defmodule ExValidationWeb.TodoController do
  use ExValidationWeb, :controller

  alias ExValidation.Activities
  alias ExValidation.Activities.Todo

  action_fallback ExValidationWeb.FallbackController

  def index(conn, _params) do
    todos = Activities.list_todos()
    render(conn, "index.json", todos: todos)
  end

  def create(conn, %{"todo" => todo_params}) do
    with {:ok, %Todo{} = todo} <- Activities.create_todo(todo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.todo_path(conn, :show, todo_params["user_id"], todo))
      |> render("show.json", todo: todo)
    end
  end

  def show(conn, %{"id" => todo_id, "user_id" => user_id}) do
    with {:ok, todo} <- Activities.get_user_todo(user_id, todo_id) do
      render(conn, "show.json", todo: todo)
    end
  end
end
