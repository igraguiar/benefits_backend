defmodule BenefitsBackend.Employees do
  @moduledoc """
  The Employees context.
  """

  import Ecto.Query, warn: false
  alias BenefitsBackend.Repo

  alias BenefitsBackend.Employees.Employee

  @doc """
  Returns the list of employees.

  ## Examples

      iex> list_employees()
      [%Employee{}, ...]

  """
  def list_employees do
    Employee
    |> Repo.all()
    |> Repo.preload(:dependants)
  end

  @doc """
  Gets a single employee.

  Raises `Ecto.NoResultsError` if the Employee does not exist.

  ## Examples

      iex> get_employee!(123)
      %Employee{}

      iex> get_employee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_employee!(id) do
    Employee
    |> Repo.get!(id)
    |> Repo.preload(:dependants)
  end

  @doc """
  Creates a employee.

  ## Examples

      iex> create_employee(%{field: value})
      {:ok, %Employee{}}

      iex> create_employee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_employee(attrs \\ %{}) do
    %Employee{}
    |> Employee.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a employee.

  ## Examples

      iex> update_employee(employee, %{field: new_value})
      {:ok, %Employee{}}

      iex> update_employee(employee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_employee(%Employee{} = employee, attrs) do
    employee
    |> Employee.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a employee.

  ## Examples

      iex> delete_employee(employee)
      {:ok, %Employee{}}

      iex> delete_employee(employee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_employee(%Employee{} = employee) do
    Repo.delete(employee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking employee changes.

  ## Examples

      iex> change_employee(employee)
      %Ecto.Changeset{data: %Employee{}}

  """
  def change_employee(%Employee{} = employee, attrs \\ %{}) do
    Employee.changeset(employee, attrs)
  end

  alias BenefitsBackend.Employees.Dependant

  @doc """
  Returns the list of dependants.

  ## Examples

      iex> list_dependants()
      [%Dependant{}, ...]

  """
  def list_dependants do
    Repo.all(Dependant)
  end

  @doc """
  Gets a single dependant.

  Raises `Ecto.NoResultsError` if the Dependant does not exist.

  ## Examples

      iex> get_dependant!(123)
      %Dependant{}

      iex> get_dependant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dependant!(id), do: Repo.get!(Dependant, id)

  @doc """
  Creates a dependant.

  ## Examples

      iex> create_dependant(%{field: value})
      {:ok, %Dependant{}}

      iex> create_dependant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dependant(attrs \\ %{}) do
    %Dependant{}
    |> Dependant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dependant.

  ## Examples

      iex> update_dependant(dependant, %{field: new_value})
      {:ok, %Dependant{}}

      iex> update_dependant(dependant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dependant(%Dependant{} = dependant, attrs) do
    dependant
    |> Dependant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dependant.

  ## Examples

      iex> delete_dependant(dependant)
      {:ok, %Dependant{}}

      iex> delete_dependant(dependant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dependant(%Dependant{} = dependant) do
    Repo.delete(dependant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dependant changes.

  ## Examples

      iex> change_dependant(dependant)
      %Ecto.Changeset{data: %Dependant{}}

  """
  def change_dependant(%Dependant{} = dependant, attrs \\ %{}) do
    Dependant.changeset(dependant, attrs)
  end
end
