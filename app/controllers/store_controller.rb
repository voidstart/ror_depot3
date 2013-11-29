class StoreController < ApplicationController
	skip_before_filter :authorize

	def index

		if session[:counter].nil?
			session[:counter] = 0
		else
			session[:counter] += 1
		end
		if params[:set_locale]
			redirect_to store_path(locale: params[:set_locale])
		else
			@products = Product.order(:title)
			@cart = current_cart
		end
	end
end
