defmodule StorageWorkerTest do
  use ExUnit.Case
  doctest StorageWorker

  test "greets the world" do
    assert StorageWorker.hello() == :world
  end
end
