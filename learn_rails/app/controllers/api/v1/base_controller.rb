class Api::V1::BaseController < ApplicationController
  # disable the CSRF token
  protect_from_forgery with: :null_session

  # disable cookies (no set-cookies header in response)
  before_action :destroy_session

  # disable the CSRF token
  skip_before_action :verify_authenticity_token

  # skip devise user authentication
  skip_before_action :authenticate_user!

  def destroy_session
    request.session_options[:skip] = true
  end
end
