defmodule MyApp.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyApp.Account.User

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:user_id, :title, :body])
    |> validate_required([:user_id, :title, :body])
  end
end
