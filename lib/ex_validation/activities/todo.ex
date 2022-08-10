defmodule ExValidation.Activities.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :deadline, :naive_datetime
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :description, :deadline])
    |> validate_required([:title, :description, :deadline])
  end
end
