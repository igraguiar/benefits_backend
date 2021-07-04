defmodule BenefitsBackend.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string
      add :cpf_number, :string

      timestamps()
    end

    create unique_index(:employees, [:cpf_number])
  end
end
