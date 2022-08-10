defmodule ExValidation.Repo do
  use Ecto.Repo,
    otp_app: :ex_validation,
    adapter: Ecto.Adapters.Postgres
end
