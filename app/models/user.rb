class User < ActiveRecord::Base
  has_secure_password

  has_many :functions, dependent: :nullify
  validates :username, presence: true
end
