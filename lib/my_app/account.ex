defmodule MyApp.Account do
  @moduledoc """
  The Account context.
  """

  import Ecto.Query, warn: false
  alias MyApp.Repo

  alias MyApp.Account.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  def print_users_name do
    users = list_users()

    Enum.each(users, fn user ->
      IO.puts(user.name)
    end)
  end

  def print_user_categories do
    list_users()
    |> Enum.map(fn user ->
      category =
        cond do
          user.age < 18 -> "minor"
          user.age < 60 -> "adult"
          true -> "senior"
        end

      "#{user.name} is a #{category}"
    end)
    |> Enum.each(&IO.puts/1)
  end


  def print_user_age_statements do
    list_users()
    |> Enum.map(fn user ->
      "#{user.name} is #{user.age} years old"
    end)
    |> Enum.each(&IO.puts/1)
  end
end
