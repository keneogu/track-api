class UsersController < ApplicationController
	require 'jwt'
	def show
		user = User.validate_user(params[:id])

		if user
      render json: user, status: :ok
    else
      render json: user, status: :not_found
    end
	end

	private

	def user_params
		params.require(:user).permit(:username, :target)
	end
end
