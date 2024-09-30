defmodule CommonUtilsTest do
  use ExUnit.Case
  doctest CommonUtils

  test "greets the world" do
    assert CommonUtils.hello() == :world
  end
end
