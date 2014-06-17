defmodule Route do

  import Weber.Route
  require Weber.Route

  route on("GET", "/", :Homepage.Main, :index)
     |> on("GET", "/CV.html", :CV.Plain, :index)
     |> on("GET", "/cv-portfolio.html", :CV.Portfolio, :index)
     |> on("GET", "/contact.html", :Contact.Main, :index)

     |> on("GET", "/blog", :Blog.Redirect, :index)
     |> on("GET", "/rss", :Blog.RSS, :index)
     |> on("GET", "/blog/:pageno", :Blog.Index, :index)
     |> on("GET", "/archives/:year/:month/:day/:slug", :Blog.entry, :index)
     #|> on(404)


end
