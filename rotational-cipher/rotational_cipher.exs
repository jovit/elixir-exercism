defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    List.to_string(do_rotate(String.to_char_list(text), shift))
  end

  def do_rotate([c | text], shift) do
    cond do
      c >= ?A && c <= ?Z -> [?A + rem(shift + c - ?A, 26) | do_rotate(text,shift)]
      c >= ?a && c <= ?z -> [?a + rem(shift + c - ?a, 26) | do_rotate(text,shift)]
      true ->  [c  | do_rotate(text, shift)]
    end
  end

  def do_rotate([], _shift) do
    []
  end

end
