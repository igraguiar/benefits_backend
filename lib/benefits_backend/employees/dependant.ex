defmodule BenefitsBackend.Employees.Dependant do
  use Ecto.Schema
  import Ecto.Changeset

  alias BenefitsBackend.Employees.Employee

  schema "dependants" do
    field :cpf_number, :string
    field :name, :string
    belongs_to :employee, Employee

    timestamps()
  end

  @doc false
  def changeset(dependant, attrs) do
    dependant
    |> cast(attrs, [:name, :cpf_number, :employee_id])
    |> validate_required([:name, :cpf_number, :employee_id])
  end
end
