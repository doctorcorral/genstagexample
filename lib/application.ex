defmodule Genstagexample.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec


    children = [
      worker(GoodProducer, []),
      worker(GoodConsumer, [])
    ]

    opts = [strategy: :one_for_one, name: Genstagexample.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
