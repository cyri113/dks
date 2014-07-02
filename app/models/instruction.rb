class Instruction < ActiveRecord::Base
  
  scope :published, -> { where(published: true) }
  
  belongs_to :product
  belongs_to :language
  
  has_many :notifications
end
