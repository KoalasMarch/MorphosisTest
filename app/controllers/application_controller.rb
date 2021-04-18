class ApplicationController < ActionController::Base
  respond_to :json
  protect_from_forgery prepend: true

  before_action :process_token

  private

  def process_token
    if request.headers['Authorization'].present?
      begin
        jwt_payload = JWT.decode(request.headers['Authorization'], Rails.application.secrets.secret_key_base).first
        @current_user_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        head :unauthorized
      end
    end
  end
  
  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end
  
  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end

  def signed_in?
    @current_user_id.present?
  end
end
