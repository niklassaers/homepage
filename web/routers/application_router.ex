defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn.fetch([:cookies, :params])
  end

  # It is common to break your Dynamo into many
  # routers, forwarding the requests between them:
  # forward "/posts", to: PostsRouter

  get "/CV.html" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    render conn, "cv.html"
  end

  get "/contact.html" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    render conn, "contact.html"
  end


  get "/cv-portfolio.html" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    render conn, "cv-portfolio.html"
  end



  get "/" do
    conn = conn.assign(:title, "Go away")
    render conn, "index.html"
  end

  get "/blog" do
	  redirect conn, to: "/blog/1"
  end

  get "/blog/:pageno" do
	postPrPage = 5
    send :blog, { :posts, Kernel.self }
    receive do
      posts ->
		pageno = String.to_integer pageno
		from = (pageno - 1) * postPrPage
		{ _, last } = Enum.split(posts, from)
		{ posts, _ } = Enum.split(last, postPrPage)
		
		first = max(1, pageno - 2)
		pages = [ first, first + 1, first + 2, first + 3, first + 4 ]
		
		conn = conn.assign(:pageno, pageno)
		conn = conn.assign(:pages, pages)
        conn = conn.assign(:posts, posts)
        render conn, "blog-index.html"
    end
  end

  get "/archives/:year/:month/:day/:slug" do
	  permalink = "/archives/" <> year <> "/" <> month <> "/" <> day <> "/" <> slug <> "/"
	  IO.puts permalink
      send :blog, { :posts, Kernel.self }
      receive do
        posts ->
			post = Enum.find posts, fn(x) -> x.permalink == permalink end
			if(post == nil) do
		        conn = conn.status(404)
				render conn, "404.html"	
			else
				index = Enum.find_index(posts, fn(post) -> post.permalink == permalink end)
				last_url = Enum.at(posts, index - 1)
				if last_url != nil do
					last_url = last_url.permalink
				end
				next_url = Enum.at(posts, index + 1)
				if next_url != nil do
					next_url = next_url.permalink
				end
				conn = conn.assign(:post, post)
				conn = conn.assign(:last_url, last_url)
				conn = conn.assign(:next_url, next_url)
				render conn, "blog-entry.html"
			end
	  end
  end


  match _ do
        conn = conn.status(404)
		render conn, "404.html"	
  end



	# TODO: Make it so that /static/assets/cv.pdf downloads as Niklas-Saers.pdf

end
