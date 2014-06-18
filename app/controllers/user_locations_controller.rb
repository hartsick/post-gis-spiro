class UserLocationsController < ApplicationController
	respond_to :json, :html

	def index
		@userlocations = UserLocation.all
		respond_with @userlocations

	end

	def create
		@userlocation = UserLocation.new(strong_params)
		if @userlocation.save
			respond_to do |format|
				format.json {render json: @userlocation, status: :created}
			end
		else
			respond_to do |format|
				format.json {render json: @userlocation.errors, status: :unprocessable_entity}
			end
		end

	end

	protected
	def strong_params
		params.require(:user_location).permit(:lat,:lng,:accuracy,:timestamp,:user_id)
	end
end
