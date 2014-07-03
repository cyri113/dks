class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :invitable

	def role? role
		#puts "query: #{role} actual: #{self.role}"
		#sym = self.role.to_sym
    return self.role.casecmp(role.to_s) == 0
	end
	
	has_one :company
	belongs_to :company
	
end