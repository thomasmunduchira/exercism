defmodule SecretHandshake do
  @doc """
  Returns true if the character at the specified index from the right of the string is 1
  """
  @spec isBitSet?(bin :: String, index :: integer) :: Boolean
  def isBitSet?(bin, index) do
    length = String.length(bin)
    # calculate actual index from original index in relation to the right
    right_index = length - index - 1
    # check if index is illegal
    exceeded = right_index < 0
    # true if legal and character at index is "1"
    !exceeded && String.at(bin, right_index) == "1"
  end

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
  def commands(code) do
    # get binary representation of number
    bin = Integer.to_string(code, 2)

    # do required transformations based on which bits are set
    []
    |> (fn result -> if isBitSet?(bin, 0), do: result ++ ["wink"], else: result end).()
    |> (fn result -> if isBitSet?(bin, 1), do: result ++ ["double blink"], else: result end).()
    |> (fn result -> if isBitSet?(bin, 2), do: result ++ ["close your eyes"], else: result end).()
    |> (fn result -> if isBitSet?(bin, 3), do: result ++ ["jump"], else: result end).()
    |> (fn result -> if isBitSet?(bin, 4), do: Enum.reverse(result), else: result end).()
  end
end
