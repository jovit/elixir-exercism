defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    String.split(sentence) |>
    Enum.group_by(fn it -> it end) |>
    Enum.map(fn {word, list} -> {String.downcase(word), Enum.count(list) } end) |>
    Enum.into(%{})
  end
end
