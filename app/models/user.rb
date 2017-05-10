class User < ActiveRecord::Base
  has_many :wikis
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
   before_save { self.email = email.downcase if email.present? }
   after_initialize { self.role ||= :standard }

   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

  enum role: [:standard, :admin, :premium]

end

# wikis belongs to user