class AddUseridToSigans < ActiveRecord::Migration
  def change
      add_column :sigans, :userid1, :string
      add_column :sigans, :userid2, :string
      add_column :sigans, :userid3, :string
      add_column :sigans, :userid4, :string
      add_column :sigans, :userid5, :string
      add_column :sigans, :userid6, :string
      add_column :sigans, :userid7, :string
      add_column :sigans, :userid8, :string
      add_column :sigans, :userid9, :string
      add_column :sigans, :userid10, :string
  end
end
