defmodule Lasagna do

  @time_total 40
  @minutes_to_prepare 2

  def expected_minutes_in_oven do
    @time_total
  end

  def remaining_minutes_in_oven(value) do
    total(value)
  end

  def preparation_time_in_minutes(value) do
    @minutes_to_prepare * value
  end

  def total_time_in_minutes(layers, minutes) do
    preparation_time_in_minutes(layers) + minutes
  end

  def alarm do
    "Ding!"
  end

  defp total(value) do
    @time_total - value
  end
end
