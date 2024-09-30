defmodule ConnectorsWorkerTest do
  use ExUnit.Case
  doctest ConnectorsWorker

  test "greets the world" do
    assert ConnectorsWorker.hello() == :world
  end
end
