defmodule MyApp.Repo.Migrations.AddPostsTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :bod, :date
      add :address, :string
      add :gender, :string

    end
  end
end
