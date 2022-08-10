defmodule ExValidation.Activities.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias ExValidation.Accounts.User

  schema "todos" do
    field :deadline, :naive_datetime
    field :description, :string
    field :title, :string

    belongs_to :user, User, foreign_key: :user_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :description, :deadline, :user_id])
    |> validate_required([:title, :user_id])
    |> foreign_key_constraint(:user_id)
  end
end
