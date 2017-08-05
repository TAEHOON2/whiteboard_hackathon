class DeleteUseridsToSigans < ActiveRecord::Migration
  def change
    remove_column :sigans, :userid1, :string
    remove_column :sigans, :userid2, :string
    remove_column :sigans, :userid3, :string
    remove_column :sigans, :userid4, :string
    remove_column :sigans, :userid5, :string
    remove_column :sigans, :userid6, :string
    remove_column :sigans, :userid7, :string
    remove_column :sigans, :userid8, :string
    remove_column :sigans, :userid9, :string
    remove_column :sigans, :userid10, :string
  end
end
