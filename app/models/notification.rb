class Notification < ActiveRecord::Base

	scope :published, -> { where(published: true) }

  belongs_to :product
  belongs_to :instruction
end
