defmodule BenefitsBackend.Repo do
  use Ecto.Repo,
    otp_app: :benefits_backend,
    adapter: Ecto.Adapters.Postgres
end
