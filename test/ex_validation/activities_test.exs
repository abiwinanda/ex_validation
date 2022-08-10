defmodule ExValidation.ActivitiesTest do
  use ExValidation.DataCase

  alias ExValidation.Activities

  describe "todos" do
    alias ExValidation.Activities.Todo

    import ExValidation.ActivitiesFixtures

    @invalid_attrs %{deadline: nil, description: nil, title: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Activities.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Activities.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{deadline: ~N[2022-08-09 06:20:00], description: "some description", title: "some title"}

      assert {:ok, %Todo{} = todo} = Activities.create_todo(valid_attrs)
      assert todo.deadline == ~N[2022-08-09 06:20:00]
      assert todo.description == "some description"
      assert todo.title == "some title"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Activities.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{deadline: ~N[2022-08-10 06:20:00], description: "some updated description", title: "some updated title"}

      assert {:ok, %Todo{} = todo} = Activities.update_todo(todo, update_attrs)
      assert todo.deadline == ~N[2022-08-10 06:20:00]
      assert todo.description == "some updated description"
      assert todo.title == "some updated title"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Activities.update_todo(todo, @invalid_attrs)
      assert todo == Activities.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Activities.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Activities.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Activities.change_todo(todo)
    end
  end
end
