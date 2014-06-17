defmodule Homepage.Config.Prod do
  use Homepage.Config

  config :router, port: System.get_env("PORT"),
                  # Full error reports are disabled
                  consider_all_requests_local: false

  config :plugs, code_reload: false

  config :logger, level: :error
end


