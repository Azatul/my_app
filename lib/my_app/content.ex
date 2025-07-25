defmodule MyApp.Content do
  @moduledoc """
  The Content context.
  """

  import Ecto.Query, warn: false
  alias MyApp.Repo

  alias MyApp.Content.Post

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
   def list_posts(opts \\ []) do
    preload_opt = Access.get(opts, :preload, [])

    Repo.all(from p in Post, preload: ^preload_opt)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

      iex> get_post!(456, preload: [:user])
      %Post{
        id: 456,
        title: "My Post",
        body: "This is a post",
        user: %User{id: 123, name: "John Doe"}
      }

  """

  # def get_post!(id), do: Repo.get!(Post, id)

  def get_post!(id, opts \\ []) do
    preload_opt = Access.get(opts, :preload, [])

    Post
    |> preload(^preload_opt)
    |> Repo.get!(id)
  end

  @spec create_post() :: any()
  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end
end
