class CreateDannies < ActiveRecord::Migration
  def change
    create_table :dannies do |t|
      t.string :userid1
      t.string :userid2
      t.string :userid3
      t.string :userid4
      t.string :userid5
      t.string :userid6
      t.string :userid7
      t.string :userid8
      t.string :userid9
      t.string :userid10

      t.timestamps null: false
    end
  end
end
