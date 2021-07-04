defmodule BenefitsBackend.EmployeesTest do
  use BenefitsBackend.DataCase

  alias BenefitsBackend.Employees

  describe "employees" do
    alias BenefitsBackend.Employees.Employee

    @valid_attrs %{cpf_number: "some cpf_number", name: "some name"}
    @update_attrs %{cpf_number: "some updated cpf_number", name: "some updated name"}
    @invalid_attrs %{cpf_number: nil, name: nil}

    def employee_fixture(attrs \\ %{}) do
      {:ok, employee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Employees.create_employee()

      employee
    end

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Employees.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Employees.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      assert {:ok, %Employee{} = employee} = Employees.create_employee(@valid_attrs)
      assert employee.cpf_number == "some cpf_number"
      assert employee.name == "some name"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Employees.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{} = employee} = Employees.update_employee(employee, @update_attrs)
      assert employee.cpf_number == "some updated cpf_number"
      assert employee.name == "some updated name"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Employees.update_employee(employee, @invalid_attrs)
      assert employee == Employees.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Employees.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Employees.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Employees.change_employee(employee)
    end
  end
end
