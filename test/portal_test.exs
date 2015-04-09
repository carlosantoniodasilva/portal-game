defmodule PortalTest do
  use ExUnit.Case

  test "push right and left" do
    Portal.shoot :orange
    Portal.shoot :blue
    portal = Portal.transfer :orange, :blue, [1, 2, 3]

    assert Portal.Door.get(:orange) == [3, 2, 1]
    assert Portal.Door.get(:blue) == []

    Portal.push_left portal

    assert Portal.Door.get(:orange) == [3, 2, 1]
    assert Portal.Door.get(:blue) == []

    Portal.push_right portal

    assert Portal.Door.get(:orange) == [2, 1]
    assert Portal.Door.get(:blue) == [3]

    Portal.push_right portal

    assert Portal.Door.get(:orange) == [1]
    assert Portal.Door.get(:blue) == [2, 3]

    Portal.push_left portal

    assert Portal.Door.get(:orange) == [2, 1]
    assert Portal.Door.get(:blue) == [3]
  end
end
