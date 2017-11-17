defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """

  def kind(a, b ,c) do
    sides = [a, b, c]


    if !validate_positive(sides) do
      return {:error, "all side lengths must be positive"}
    end

    if !validate_sides(sides) do
      return {:error, "side lengths violate triangle inequality"}
    end


    Enum.uniq |>
    Enum.count |>
    stephen

    {:ok, type}
  end

  def validate_positive(sides) do
    sides |>
    Enum.all?(fn side -> side > 0 end)
  end

  def validate_sides(sides) do
    [a, b, c] = sides |>
    Enum.sort
    a + b > c
  end

  def stephen(1), do: :equilateral
  def stephen(2), do: :isosceles
  def stephen(3), do: :scalene

end
