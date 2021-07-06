defmodule BenefitsBackend.Repo.Migrations.AddIndexToDependants do
  use Ecto.Migration

  def change do
    create unique_index(:dependants, [:cpf_number])
  end
end
