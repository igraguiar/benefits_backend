defmodule BenefitsBackendWeb.PageControllerTest do
  use BenefitsBackendWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
