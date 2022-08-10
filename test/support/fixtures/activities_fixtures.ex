defmodule ExValidation.ActivitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExValidation.Activities` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        deadline: ~N[2022-08-09 06:20:00],
        description: "some description",
        title: "some title"
      })
      |> ExValidation.Activities.create_todo()

    todo
  end
end
