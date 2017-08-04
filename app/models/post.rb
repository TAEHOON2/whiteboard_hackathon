class Post < ActiveRecord::Base
    has_many :replies, dependent: :destroy
    mount_uploader :attachment, AttachmentUploader
end
