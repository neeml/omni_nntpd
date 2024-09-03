defmodule ArticleWorkerTest do
  use ExUnit.Case
  doctest ArticleWorker

  test "greets the world" do
    assert ArticleWorker.hello() == :world
  end
end
