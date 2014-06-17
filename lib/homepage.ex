defmodule Homepage do
  use Application

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    blogPid = spawn(fn -> Blog.startup() end)
    Process.register(blogPid, :blog)
	
	voterPid = spawn(fn -> PopularityVoter.startup() end)
	Process.register(voterPid, :voter)

  	
    Homepage.Supervisor.start_link
  end
end
