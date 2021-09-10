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

	def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
	end

	def update
		user = User.find(params[:id])
		user.target = params[:target]
		
		if user.save
      render json: user, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
	end

	private

	def user_params
		params.require(:user).permit(:username, :target)
	end
end
