defmodule BenefitsBackendWeb.PageController do
  use BenefitsBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
