class AttachmentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :attachment, :string
    add_column :sigans, :attachment, :string
  end
end
