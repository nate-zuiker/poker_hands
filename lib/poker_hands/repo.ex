defmodule PokerHands.Repo do
  use Ecto.Repo,
    otp_app: :poker_hands,
    adapter: Ecto.Adapters.Postgres
end
