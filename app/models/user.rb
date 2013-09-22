class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :name, presence: true
end
