defmodule MyApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :gender, :string

      timestamps(type: :utc_datetime)
    end
  end
end
