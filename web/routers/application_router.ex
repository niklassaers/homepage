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


	# TODO: Make it so that /static/assets/cv.pdf downloads as Niklas-Saers.pdf

end
