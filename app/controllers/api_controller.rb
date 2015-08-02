class ApiController < ActionController::Base
  include MetadataBuilder
  include Authenticator
  include CommonActions
  include CommonResponse

  protect_from_forgery with: :null_session
  before_action :authenticate_request

  helper_method :current_user, :request_details

  #
  # Current user helper method
  #
  def current_user
    @current_user ||= User.find_by_valid_token request_details
  end

  #
  # crates an instnace var of important request headers
  # Authorization is for access token
  # UserId is the bearer of the token
  #
  def request_details
    @request_details ||=
      {
        access_token:  request.headers['Authorization'],
        user_id: request.headers['UserId']
      }
  end

  def authenticate_request
    fail ExpiredSessionError unless current_user.present?
  end



end
