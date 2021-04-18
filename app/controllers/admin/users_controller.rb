class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[ show update destroy ]

  def show
    render json: @user.as_json
  end

  def update
    return render json: { errors: user.errors.full_messages }, status: :unprocessable_entity unless @user.update(user_param)
  end

  private
    def set_user
      @user = User.find(params[:id])
    rescue ApplicationRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
    end

    def user_params
      params.require(:user).permit(:role)
    end
end
