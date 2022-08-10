defmodule ExValidation.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :title, :string
      add :description, :text
      add :deadline, :naive_datetime

      timestamps()
    end
  end
end
