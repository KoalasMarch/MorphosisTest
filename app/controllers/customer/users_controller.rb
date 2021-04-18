class Customer::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def show
    render json: @user.as_json
  end

  def update
    return render json: { errors: @user.errors.full_message }, status: :unprocessable_entity unless @user.update(user_params)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:role)
    end
end
