defmodule Homepage do

  require Weber.Templates.ViewsLoader

  def start(_type, _args) do

    blogPid = spawn(fn -> Blog.startup() end)
    Process.register(blogPid, :blog)
        
    voterPid = spawn(fn -> PopularityVoter.startup() end)
    Process.register(voterPid, :voter)

    # Set resources
    Weber.Templates.ViewsLoader.set_up_resources(File.cwd!)
    # compile all views
    Weber.Templates.ViewsLoader.compile_views(File.cwd!)
    # start weber application
    Weber.run_weber
  end

  def stop(_state) do
    :ok
  end

end
