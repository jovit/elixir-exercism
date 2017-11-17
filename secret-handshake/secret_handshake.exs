defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) when code >= 16 do
    Enum.reverse(commands(code - 16))
  end

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) when code >= 8 do
    commands(code - 8) ++ ["jump"]
  end

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) when code >= 4 do
    commands(code - 4) ++ ["close your eyes"]
  end

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) when code >= 2 do
    commands(code - 2) ++ ["double blink"]
  end

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) when code > 0 do
    commands(code - 1) ++ ["wink"]
  end

  @spec commands(code :: integer) :: list(String.t())
  def commands(0) do
    []
  end

end
