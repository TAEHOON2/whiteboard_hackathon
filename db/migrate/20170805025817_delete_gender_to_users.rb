class DeleteGenderToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :gender
  end
end
