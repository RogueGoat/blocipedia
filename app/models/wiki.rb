class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  after_initialize { self.private ||= false }
  

end

# user has many wikis
