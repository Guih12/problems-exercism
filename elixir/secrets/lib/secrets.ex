defmodule Secrets do
  use Bitwise, only_operators: true
  def secret_add(secret), do: fn x -> x + secret end
  def secret_subtract(secret), do: &(&1 - secret)
  def secret_multiply(secret), do: &(&1 * secret)
  def secret_divide(secret) when secret != 0, do: &(div &1, secret)
  def secret_and(secret), do: &(&1 &&& secret)
  def secret_xor(secret), do: &(Bitwise.bxor(&1, secret))
  def secret_combine(secret_function1, secret_function2), do: fn x ->
  x
  |> secret_function1.()
  |> secret_function2.()
  end
end
