# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      render json: { error: 'You must sign in' }, status: :unauthorized
    end
  end
end
