class CreateUsergwamoks < ActiveRecord::Migration
  def change
    create_table :usergwamoks do |t|
      t.belongs_to :user
      t.belongs_to :crawl
      t.string :gwamokid
      t.string :campus
      t.string :haksu
      t.string :boonban
      t.string :isoo
      t.string :gwamok
      t.string :gyosoo
      t.string :hakjum
      t.string :timeplace1
      t.string :timeplace2
      t.string :timeplace3
      t.string :timeplace4
      
      
      t.timestamps null: false
    end
  end
end
