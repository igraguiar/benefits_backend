defmodule BenefitsBackend.Employees.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :cpf_number, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name, :cpf_number])
    |> validate_required([:name, :cpf_number])
    |> unique_constraint(:cpf_number)
  end
end
