defmodule AuthWorkerTest do
  use ExUnit.Case
  doctest AuthWorker

  test "greets the world" do
    assert AuthWorker.hello() == :world
  end
end
