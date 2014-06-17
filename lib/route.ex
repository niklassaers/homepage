defmodule Route do

  import Weber.Route
  require Weber.Route

  route on("GET", "/", :Homepage.Main, :index)

end
