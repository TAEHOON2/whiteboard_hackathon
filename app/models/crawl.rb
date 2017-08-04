class Crawl < ActiveRecord::Base
    has_many :usergwamoks
    belongs_to :user

end
