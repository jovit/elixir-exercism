defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count([], nucleotide) do
    0
  end

  def count([nucleotide | tail], nucleotide) do
    1 + count(tail, nucleotide)
  end

  def count([_head | tail], nucleotide) do
    count(tail, nucleotide)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    %{?A => count(strand, ?A), ?C => count(strand, ?C), ?G => count(strand, ?G), ?T => count(strand, ?T)} 
  end
end
