class Sigan < ActiveRecord::Base
    has_many :siplies, dependent: :destroy
    mount_uploader :attachment, AttachmentUploader
end
