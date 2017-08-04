class Usergwamok < ActiveRecord::Base
    belongs_to :user
    belongs_to :crawl
end
