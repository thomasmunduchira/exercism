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
  def count(strand, nucleotide) do
    # reduce over strand and count number of times character appears
    Enum.reduce(strand, 0, fn element, result ->
      if element == nucleotide do
        # increment result by 1
        result + 1
      else
        # keep result the same
        result
      end
    end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    # initial map
    initial = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}

    # reduce over strand and count number of times characters appear
    Enum.reduce(strand, initial, fn element, result ->
      # increment value associated with element by 1
      Map.put(result, element, result[element] + 1)
    end)
  end
end
