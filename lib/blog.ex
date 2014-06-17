defmodule BlogPost do
  defstruct header: 0, do_categories: 0, do_excerpt: 0, do_tags: 0, title: "", permalink: "", tags: [], categories: [], content: "", author: "", layout: "", excerpt: "", date: ""
end


defmodule VoteCount do
  defstruct method: "GET", link: "", votes: 0, title: ""
end

defmodule PopularityVoter do

	# better would be to count votes by day, and then compute score by today * 1 + yesterday * 0.99 + the day before * 0.98 etc
	# but for that, I'd probably need to be able to write state to disc every so often ;-)

	def startup do
		state = []
		# read from disc
		
		the_loop(state)
	end
	
	def synchronize(state) do
		# write to disc
	end

	def the_loop(state) do
		
		receive do
			{ :vote, conn } ->
				IO.puts "get path"
				index = Enum.find_index(state, fn(x) -> x.link == conn.path end)
				IO.puts "index found"
				
				if index == nil do
					IO.puts "path " <> conn.path
					IO.puts "method " <> conn.method
					newVote = %VoteCount{ method: conn.method, link: conn.path, votes: 1, title: "" }
					IO.puts "vote created"
					IO.puts "method: " <> conn.method <> ", link: " <> conn.path <> ", votes: 1"
					state = Enum.concat(state, [newVote])
				else
					IO.puts "old vote"
					oldVote = Enum.at(state, index)
					IO.puts "got vote"
					IO.puts "method: " <> conn.method <> ", link: " <> conn.path <> ", votes: ??"
					newVote = %{oldVote | votes: (oldVote.votes + 1) }
					IO.puts "made new vote"
					state = List.replace_at(state, index, newVote)
					IO.puts "Updated list"
				end
				
				IO.puts "now sync"
				#PopularityVoter.synchronize(state)
				IO.puts "then loop"

			{ :top5, sender } ->
				votes = Enum.sort state, &(&1.votes > &2.votes)
				{ votes, _ } = Enum.split(votes, 5)
				send sender, votes
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
	{ recent , _ } = Enum.split(sortedPosts, 5)
	a = Enum.map(recent, fn(post) -> %{ title: post.title, permalink: post.permalink, date: post.date } end)
	{ sortedPosts, a }
  end

  def the_loop(posts, recent) do

	if recent == nil do
		
	end	  

  	receive do
		{:recent, sender} ->
			send sender, recent
  			the_loop(posts, recent)
  		{:reload, sender} ->
			{ sortedPosts, recent } = reload()
			send sender, sortedPosts
  			the_loop(sortedPosts, recent)
  		{:posts, sender} ->
  			send sender, posts
  			the_loop(posts, recent)
  	end
  end

  def recent_as_html() do
	  send :blog, { :recent, Kernel.self }
	  receive do
	     recent ->
			 recent_as_html(recent, [])
	  end
  end
  
  def shrinkTo(s, l) do
	 if(String.length(s) <= l) do
	     s
	 else 
		 { f , _ } = String.split_at(s, l)
		 s = f <> "..." 
	 end
  end
  
  def recent_as_html(recent, acc) do
	  if(length(recent) == 0) do
	    acc
	  else
	    [ head | tail ] = recent
		s = "<li><a href=\"" <> head.permalink <> "\">" <> Blog.shrinkTo(head.title, 25) <> "</a></li>"
		acc = acc ++ [s]
		recent_as_html(tail, acc)
	  end
  end

  def parse_files(acc, files) do
  	if length(files) == 0 do
  		acc
  	else
  	  [head | tail] = files
  	  file = "blog/" <> head
  	  if File.dir?(file) or String.ends_with?(file, ".md") == false do
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
		    			if String.starts_with?(stripped, "- ") do
		    				stripped = String.slice(stripped, 2..-1)
		    			end
		    			post = %{post | categories: post.categories ++ [stripped] }
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

