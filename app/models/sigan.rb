class Sigan < ActiveRecord::Base
    has_many :siplies, dependent: :destroy
end
