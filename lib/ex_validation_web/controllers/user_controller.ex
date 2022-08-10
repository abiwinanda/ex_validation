defmodule ExValidationWeb.UserController do
  use ExValidationWeb, :controller

  alias ExValidation.Accounts
  alias ExValidation.Accounts.User

  action_fallback ExValidationWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"name" => name}) when is_binary(name) do
    with {:ok, %User{} = user} <- Accounts.create_user(%{name: name}) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def create(conn, _) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ExValidationWeb.ErrorView)
    |> render("invalid_input.json", error: %{name: ["name should be a string"]})
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end
end
