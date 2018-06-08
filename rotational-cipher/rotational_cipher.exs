defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    # break up string into charlist for easier iteration
    charlist = String.graphemes(text)

    # iterate over each character and do required shift
    converted_charlist =
      Enum.map(charlist, fn character ->
        # get unicode number
        <<unicode_number::utf8>> = character

        cond do
          Regex.match?(~r/[a-z]/, character) ->
            # character is lowercase letter

            # shift unicode number
            shifted_unicode_number = rem(unicode_number + shift - 97, 26) + 97
            # convert back to unicode character
            <<shifted_unicode_number::utf8>>

          Regex.match?(~r/[A-Z]/, character) ->
            # character is uppercase letter

            # shift unicode number
            shifted_unicode_number = rem(unicode_number + shift - 65, 26) + 65 convert back to unicode character
            <<shifted_unicode_number::utf8>>

          true ->
            # return any other character without shifting
            character
        end
      end)

    # convert charlist back into string
    List.to_string(converted_charlist)
  end
end
