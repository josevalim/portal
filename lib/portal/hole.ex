defmodule Portal.Hole do
  def start_link(name) do
    Agent.start_link(fn -> [] end, name: name)
  end

  def get(hole) do
    Agent.get(hole, fn list -> list end)
  end

  def push(hole, value) do
    Agent.update(hole, fn list -> [value|list] end)
  end

  def pop(hole) do
    Agent.get_and_update(hole, fn
      []    -> {:error, []}
      [h|t] -> {{:ok, h}, t}
    end)
  end
end
