defmodule BlogPost do
  defstruct header: 0, do_categories: 0, do_excerpt: 0, do_tags: 0, title: "", permalink: "", tags: [], categories: [], content: "", author: "", layout: "", excerpt: "", date: ""
end

defmodule Blog do
  def startup do
  	{ :ok, files } = File.ls "blog"
  	posts = parse_files([], files)
	sortedPosts = Enum.sort posts, &(&1.date > &2.date)
  	
  	IO.puts "Done"
  	the_loop sortedPosts
  end

  def the_loop(_posts) do

  	posts = _posts

  	receive do
  		{:reload, sender} ->
  			{ :ok, files } = File.ls "blog"
  			posts = parse_files([], files)
  			sortedPosts = Enum.sort posts, &(&1.date > &2.date)
  			send sender, sortedPosts
  			the_loop(sortedPosts)
  		{:posts, sender} ->
  			send sender, posts
  			the_loop(posts)
  	end
  end

  def parse_files(acc, files) do
  	if length(files) == 0 do
  		acc
  	else
  	  [head | tail] = files
  	  file = "blog/" <> head
  	  if File.dir? file do
  	  	acc = parse_files(acc, tail)
  	  	acc
  	  else
	  	content = File.read! file
  	  	ar = String.split(content, "\n", trim: true)
  	  	post = parse_blogEntry ar
  	  	post = %{post | date: String.slice(head, 0, 10) }
  	    acc = parse_files(acc ++ [post], tail)
  	    acc
  	  end
  	end
  end

  def parse_blogEntry(ar) do
  	post = %BlogPost{}
  	parse_blogEntry(ar, post)
  end

  def parse_blogEntry(ar, post) do
  	if length(ar) == 0 do
  		if String.first(post.content) == "\n" do
  			post = %{post | content: String.slice(post.content, 1..-1) }
  		end
  		post
  	else
	    head = List.first(ar)
		stripped = String.strip(head)
	    parsed = String.split(head, ":", trim: true)
	    if String.first(head) == " " do
			if post.do_categories == 1 do
				post = %{post | categories: post.categories ++ [String.slice(stripped, 2..-1)] }
			else
				if post.do_excerpt == 1 do
					post = %{post | excerpt: post.excerpt <> "\n" <> stripped }
				else
					if post.header == 2 do
	      				post = %{post | content: post.content <> "\n" <> stripped, do_categories: 0, do_excerpt: 0, do_tags: 0 }
	      			else
	      				if post.do_tags == 1 do
							post = %{post | tags: post.tags ++ [stripped] }
		      			else
		      				#IO.puts "Forgot to parse #1: " <> head <> "\n\n"
						end
					end
				end
			end
	    else
		    if length(parsed) == 1 do
		    	case stripped do
		    		"---" ->
		    			post = %{post | header: post.header + 1, do_categories: 0, do_excerpt: 0, do_tags: 0 }
		    		"categories:" ->
		    			post = %{post | do_categories: 1, do_excerpt: 0, do_tags: 0 }
		    		"tags:" ->
		    			post = %{post | do_categories: 0, do_excerpt: 0, do_tags: 1 }
		      		_ ->
		      			if post.header == 2 do
		      				post = %{post | content: post.content <> "\n" <> stripped, do_categories: 0, do_excerpt: 0, do_tags: 0 }
		      			else
		      				#IO.puts "Forgot to parse #2: " <> head <> "\n\n"
		      			end
		    	end
		    else
		    	if post.header == 1 do # I'm parsing a header
		    		case String.strip(List.first(parsed)) do
		    			"title" ->
		    				post = %{post | title: String.strip(List.last(parsed)), do_categories: 0, do_excerpt: 0, do_tags: 0 }
		    			"permalink" ->
		    				post = %{post | permalink: String.strip(List.last(parsed)), do_categories: 0, do_excerpt: 0, do_tags: 0 }
		    			"author" ->
		    				post = %{post | author: String.strip(List.last(parsed)), do_categories: 0, do_excerpt: 0, do_tags: 0 }
		    			"layout" ->
		    				post = %{post | layout: String.strip(List.last(parsed)), do_categories: 0, do_excerpt: 0, do_tags: 0 }
		    			"excerpt" ->
		    				post = %{post | excerpt: String.strip(List.last(parsed)), do_categories: 0, do_excerpt: 1, do_tags: 0 }
		    			_ ->
		    				#IO.puts "Forgot to parse #3: " <> String.strip(List.first(parsed)) <> "\n\n"
		    		end

		    	else
		    		if post.header == 2 do # I'm parsing content
			 	   		stripped = String.strip(head)
		      			post = %{post | content: post.content <> "\n" <> stripped, do_categories: 0, do_excerpt: 0, do_tags: 0 }
		    		end
		    	end
		    end
		end

	    [ _ | tail ] = ar
	    parse_blogEntry(tail, post)
	end
  end

end

defmodule Homepage do
  use Application.Behaviour


  @doc """
  The application callback used to start this
  application and its Dynamos.
  """
  def start(_type, _args) do
    pid = spawn(fn -> Blog.startup() end)
    Process.register(pid, :blog)
    Homepage.Dynamo.start_link([max_restarts: 5, max_seconds: 5])
  end
end
