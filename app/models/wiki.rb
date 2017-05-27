class Wiki < ActiveRecord::Base
  belongs_to :user
  after_initialize { self.private ||= false }
  

end

# user has many wikis
