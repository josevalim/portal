defmodule Portal do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    children = [worker(Portal.Hole, [])]
    opts = [strategy: :simple_one_for_one, name: Portal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def shoot(color) do
    Supervisor.start_child(Portal.Supervisor, [color])
  end

  defstruct [:left, :right]

  def transfer(left, right, data) do
    for item <- data do
      Portal.Hole.push(left, item)
    end
    %Portal{left: left, right: right}
  end

  def push_right(%Portal{left: left, right: right}) do
    case Portal.Hole.pop(left) do
      :error   -> :ok
      {:ok, h} -> Portal.Hole.push(right, h)
    end
  end

  def push_left(%Portal{left: left, right: right}) do
    case Portal.Hole.pop(right) do
      :error   -> :ok
      {:ok, h} -> Portal.Hole.push(left, h)
    end
  end

  def print(%Portal{left: left, right: right}) do
    data_left  = inspect(Portal.Hole.get(left))
    data_right = inspect(Portal.Hole.get(right))

    transfer = "    #{data_left} <=> #{data_right}    "
    left     = inspect(left)
    right    = String.rjust(inspect(right), String.length(transfer))

    IO.write """
    #{left}

    #{transfer}

    #{right}
    """
  end
end
