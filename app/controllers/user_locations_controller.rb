class UserLocationsController < ApplicationController
	respond_to :json, :html

	def index
		@userlocations = UserLocation.all
		respond_with @userlocations

	end

	def create
		# convert params to proper data type
		@lat = params[:lat].to_f
		@lng = params[:lng].to_f
		@accuracy = params[:accuracy].to_i
		@user_id = params[:user_id].to_i

		# instantiate new user location
		@userlocation = UserLocation.new(lat: @lat, lng: @lng, accuracy: @accuracy, user_id: @user_id)

		# save to database
		if @userlocation.save
			respond_to do |format|
				format.html #html here
				format.json {render json: @userlocation, status: :created}
			end
		else
			respond_to do |format|
				format.html #html here
				format.json {render json: @userlocation.errors, status: :unprocessable_entity}
			end
		end

	end

	protected
	def strong_params
		params.require(:user_location).permit(:lat,:lng,:accuracy,:timestamp,:user_id)
	end
end
