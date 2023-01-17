defmodule FreelancerRates do

  @hourly_rate 8.0
  @month_rate 22

  def daily_rate(hourly_rate) do
    hourly_rate
    |>calculate_rate()
  end

  def apply_discount(before_discount, discount) do
   percent = discount|>transform_in_percent
   before_discount - (before_discount * percent) |> Float.round(5)
  end

  def monthly_rate(hourly_rate, discount) do
    rate = daily_rate(hourly_rate) * @month_rate
    apply_discount(rate, discount) |> Float.ceil(0) |> trunc
  end

  def days_in_budget(budget, hourly_rate, discount) do
    price =
    daily_rate(hourly_rate)
    |> apply_discount(discount)
    (budget / price) |> Float.floor(1)
  end

  defp calculate_rate(value) do
    value * @hourly_rate
  end

  defp transform_in_percent(value) do
    value / 100
  end
end
