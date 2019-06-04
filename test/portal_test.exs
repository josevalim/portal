defmodule PortalTest do
  use ExUnit.Case
  doctest Portal

  test "greets the world" do
    assert Portal.hello() == :world
  end
end
