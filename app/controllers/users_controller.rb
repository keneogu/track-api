class UsersController < ApplicationController
	def show
	end

	def create
		
	end

	def update
	end

	private

	def user_params
		params.require(:user).permit(:username, :target)
	end
end
