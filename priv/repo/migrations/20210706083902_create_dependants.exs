defmodule BenefitsBackend.Repo.Migrations.CreateDependants do
  use Ecto.Migration

  def change do
    create table(:dependants) do
      add :name, :string
      add :cpf_number, :string
      add :employee_id, references(:employees, on_delete: :nothing)

      timestamps()
    end

    create index(:dependants, [:employee_id])
  end
end
