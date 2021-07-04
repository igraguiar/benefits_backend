defmodule BenefitsBackend.Repo.Migrations.CreateBenefits do
  use Ecto.Migration

  def change do
    create table(:benefits) do
      add :title, :string
      add :description, :text

      timestamps()
    end

  end
end
