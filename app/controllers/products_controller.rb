class ProductsController < ApplicationController
	
	def show
	  @product = Product.friendly.find(params[:id])
	  if request.path != product_path(@product)
	    redirect_to @product, status: :moved_permanently
	  end
	end
		
end