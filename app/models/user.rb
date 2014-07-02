class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :invitable

	def role? role
		#puts "query: #{role} actual: #{self.role}"
    return self.role.casecmp(role.to_s) == 0
	end
	
end