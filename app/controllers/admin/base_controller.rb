class Admin::BaseController < ApplicationController
  before_action :check_admin

  def check_admin
    render json: { errors: 'Authorization error' }, status: :forbidden unless current_user&.admin?
  end
end
