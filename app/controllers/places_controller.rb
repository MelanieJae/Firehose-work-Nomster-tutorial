class PlacesController < ApplicationController
	#adding a before filter so that only authenticated users can create new places"
		before_action :authenticate_user!, :only => [:new, :create]
	def index
		@places = Place.all.paginate(:page => params[:page], per_page: 3)
	end

	def create
		current_user.places.create(place_params)
		Place.create(place_params)
		redirect_to root_path	
	end

	def new
		@place = Place.new
	end

	private
	
	def place_params	
		params.require(:place).permit(:name, :address, :description)								  
	end

	

end
