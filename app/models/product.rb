class Product < ActiveRecord::Base
	extend FriendlyId
	friendly_id :code, use: [:slugged, :history]
	
	def should_generate_new_friendly_id?
	  slug.blank? || code_changed?
	end
	
	has_many :instructions
  has_many :languages, through: :instructions
  has_many :notifications
	
end
