defmodule MyApp.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.Account` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        age: 42,
        gender: "some gender",
        name: "some name"
      })
      |> MyApp.Account.create_user()

    user
  end
end
