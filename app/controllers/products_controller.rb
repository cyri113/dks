class ProductsController < ApplicationController
	
	rescue_from ActiveRecord::RecordNotFound do
	  flash[:error] = "The code #{params[:id]} was not recognised by dokspot."
	  render :not_found   # or e.g. redirect_to :action => :index
	end
	
	
	def show
	  @product = Product.friendly.find(params[:id])
	  if request.path != product_path(@product)
	    redirect_to @product, status: :moved_permanently
	  end
	end
	
	def search
		params[:id] = params[:q]
		show
	end
	
end