defmodule PlayerServerManager do
  use Application

  
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [

      worker(PlayerServer, [], restart: :temporary),
      
      # Define workers and child supervisors to be supervised
      # worker(PlayerServerManager.Worker, [arg1, arg2, arg3]),
    ]
   
    opts = [strategy: :one_for_one, name: PlayerServerManager.Supervisor]
    Supervisor.start_link(children, opts)
  end


  def start_player_server(%Player{} = player) do
    Supervisor.start_child(PlayerServerManager.Supervisor, [player])
  end
  
end


defmodule PlayerServer do

    use ExActor.GenServer

    defstart start_link(player), do: initial_state(%{player: player, socket: nil})
    defcall gem, state: state, do: reply(state.player.base_info.gem)
end