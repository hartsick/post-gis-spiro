class UserLocationsController < ApplicationController
	respond_to :json, :html

	def index
		@userlocations = UserLocation.all
		respond_with @userlocations

	end

	def create
		@lat = params[:lat].to_f
		@lng = params[:lng].to_f
		@accuracy = params[:accuracy].to_i
		@user_id = params[:user_id].to_i

		@userlocation = UserLocation.new(lat: @lat, lng: @lng, accuracy: @accuracy, user_id: @user_id)
		
		puts @userlocation.lat
		puts @userlocation.lng

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
