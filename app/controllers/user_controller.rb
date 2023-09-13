class UserController < ApplicationController
    def index
        @users = User.all
        if @users.present?
          render json: { success: true, message: 'data found', status: 200, data: user.new_attr }
        else
          render json: { success: true, message: 'data not found', status: 404 }, status: 404
        end
    end
    def create
        @user = User.new(user_params)
        if @user.save
          render json: { success: true, status: 201, message: 'user created successfully', data: @user.new_attr },
                 status: 201
        else
          render json: { success: false, status: 422, message: 'oooppss, something went wrong!', data: @user.errors.full_messages.first },
                 status: 422
        end
    end

    def user_params
        params.permit(:username, :email, :password)
    end
end
