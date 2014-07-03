class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.role?('admin')
			can :manage, :all
		elsif user.role?('manager')
			#can :manage, User, :company_id => user.company.id
			#can :manage, Product, :company_id => user.company.id
			#can :manage, ProductLanguage, :product => { :company_id => user.company.id }
			#can :manage, Document, :product_language => { :product => { :company_id => user.company.id } }
			can :edit, Company, :id => user.company.id
			#can :read, Order, :product_language => { :product => { :company_id => user.company.id } }
		elsif user.role?('operator')
			#can :update, User, :id => user.id
			#can :manage, Product, :company_id => user.company.id
			#can :manage, ProductLanguage, :product => { :company_id => user.company.id }
			#can :manage, Document, :product_language => { :product => { :company_id => user.company.id } }
			#can :read, Order, :product_language => { :product => { :company_id => user.company.id } }
		else
			#can :read, :all
			#can :read, Product
			#can :read, ProductLanguage
			#can :read, Document
			#can :create, Order
			#can :update, Order
			#can :edit, Order
			#can :show, Order
			#can :thanks, Order
		end
    
  end
end
