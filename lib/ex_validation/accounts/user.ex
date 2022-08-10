defmodule ExValidation.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ExValidation.Activities.Todo

  schema "users" do
    field :name, :string

    has_many :todos, Todo

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
