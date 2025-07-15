defmodule MyApp.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.Blog` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        body: "some body"
      })
      |> MyApp.Blog.create_comment()

    comment
  end
end
