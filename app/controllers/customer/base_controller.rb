class Customer::BaseController < ApplicationController
  before_action :check_customer

  def check_customer
    render json: { errors: 'Authorization error' }, status: :forbidden unless current_user&.customer?
  end
end
