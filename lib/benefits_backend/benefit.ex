defmodule BenefitsBackend.Benefit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "benefits" do
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(benefit, attrs) do
    benefit
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
