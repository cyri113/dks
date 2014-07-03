class Company < ActiveRecord::Base

  scope :published, -> { where(published: true) }
  
  belongs_to :user
  has_many :users
end