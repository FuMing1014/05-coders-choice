defmodule PlayerServerManagerTest do
  use ExUnit.Case
  doctest PlayerServerManager
  
  setup do
    Application.stop(:player_server_manager)
    :ok = Application.start(:player_server_manager)
  end

  setup do
      player = Player.new(0)
      {:ok, player: player}
  end
  test "start player_server", %{player: player} do
    assert {:ok, pid} = PlayerServerManager.start_player_server(player)
    assert  PlayerServer.gem(pid) == 0
  end
end