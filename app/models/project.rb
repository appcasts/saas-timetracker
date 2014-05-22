class Project < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :client, presence: true
end
