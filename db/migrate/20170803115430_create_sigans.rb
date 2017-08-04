class CreateSigans < ActiveRecord::Migration
  def change
    create_table :sigans do |t|
      t.string :gwamokid
      t.string :username
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
