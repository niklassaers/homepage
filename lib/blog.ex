defmodule BlogPost do
  defstruct header: 0, do_categories: 0, do_excerpt: 0, do_tags: 0, title: "", permalink: "", tags: [], categories: [], content: "", author: "", layout: "", excerpt: "", date: ""
end


defmodule VoteCount do
  defstruct permalink: "", votes: 0
end

defmodule PopularityVoter do

	def startup do
		# read from disc
	end
	
	def synchronize(state) do
		# write to disc
	end

	def the_loop(_state) do
		state = _state
		
		receive do
			{ :vote, permalink, sender} ->
				index = Enum.find_index(state, fn(x) -> x.permalink == permalink end)
				
				if index == nil do
					vote = %VoteCount{ permalink: permalink, votes: 1 }
					state = Enum.concat(state, [vote])
				else
					vote = Enum.at(state, index)
					vote = %{vote | votes: (vote.votes + 1) }
					List.replace_at(state, index, vote)
				end
				
				PopularityVoter.synchronize(state)
			{ :top5, sender } ->
				IO.puts "here they are"
		end
		
		the_loop(state)
	end
	

end

defmodule Blog do
  def startup do
	{ sortedPosts, recent } = reload()
  	
  	IO.puts "Done"
  	the_loop(sortedPosts, recent)
  end

  def reload do
	{ :ok, files } = File.ls "blog"
	posts = parse_files([], files)
	sortedPosts = Enum.sort posts, &(&1.date > &2.date)
	recent = Enum.split(sortedPosts, 5)
	{ sortedPosts, recent }
  end

  def the_loop(posts, recent) do

	if recent == nil do
		
	end	  

  	receive do
  		{:reload, sender} ->
			{ sortedPosts, recent } = reload()
			send sender, sortedPosts
  			the_loop(sortedPosts, recent)
  		{:posts, sender} ->
  			send sender, posts
  			the_loop(posts, recent)
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
  	  	ar = String.split(content, "\n")
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

	    cond do
    		post.header == 2 -> # I'm parsing content
	 	   		stripped = String.strip(head)
      			post = %{post | content: post.content <> "\n" <> head, do_categories: 0, do_excerpt: 0, do_tags: 0 }

	    	String.first(head) == " " ->
		    	case post do
		    		%{do_categories: 1} ->
		    			post = %{post | categories: post.categories ++ [String.slice(stripped, 2..-1)] }
		    		%{do_excerpt: 1} ->
		    			post = %{post | excerpt: post.excerpt <> "\n" <> stripped }
		    		#%{header: 2} ->
		    		#	post = %{post | content: post.content <> "\n\n" <> stripped, do_categories: 0, do_excerpt: 0, do_tags: 0 }
		    		%{do_tags: 1} ->
		    			post = %{post | tags: post.tags ++ [stripped] }
		    		_ ->
		      			#IO.puts "Forgot to parse 1: " <> head <> ""
		    	end

		    length(parsed) == 1 ->
		    	case stripped do
		    		"---" ->
		    			post = %{post | header: post.header + 1, do_categories: 0, do_excerpt: 0, do_tags: 0 }
		    		"categories:" ->
		    			post = %{post | do_categories: 1, do_excerpt: 0, do_tags: 0 }
		    		"tags:" ->
		    			post = %{post | do_categories: 0, do_excerpt: 0, do_tags: 1 }
		      		_ ->
		      			#if post.header == 2 do
		      			#	post = %{post | content: post.content <> "\n\n" <> stripped, do_categories: 0, do_excerpt: 0, do_tags: 0 }
		      			#else
		      			#	#IO.puts "Forgot to parse #2: " <> head <> ""
		      			#end
		    	end

	    	post.header == 1 -> # I'm parsing a header
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
		end

	    [ _ | tail ] = ar
	    parse_blogEntry(tail, post)
	end
  end

end

