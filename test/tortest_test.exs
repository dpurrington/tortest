defmodule TortestTest do
  use ExUnit.Case
  doctest Tortest

  test "greets the world" do
    assert Tortest.hello() == :world
  end
end
