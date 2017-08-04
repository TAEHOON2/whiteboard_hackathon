class CreateSiplies < ActiveRecord::Migration
  def change
    create_table :siplies do |t|
      t.string :reply_user
      t.text :body
      t.references :sigan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
