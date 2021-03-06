defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep([head | tail], fun) do
    cond do
      fun.(head) ->
        [head | keep(tail, fun)]
      true ->
        keep(tail, fun)
    end
  end

  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep([], _fun), do: []

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard([head | tail], fun) do
    cond do
      fun.(head) ->
        discard(tail, fun)
      true ->
        [head | discard(tail, fun)]
    end
  end

  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard([], _fun), do: []
end
