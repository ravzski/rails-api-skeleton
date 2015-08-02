module Authenticator
  extend ActiveSupport::Concern

  included do

    #
    # raise an error if:
    # the token is an invalid token
    # either it is an old token
    # or simple the token does not exist
    #
    class ExpiredSessionError < StandardError; end
    rescue_from ExpiredSessionError do
      render json: { error: 'Your session has expired' }, status: 401
    end

    #
    # raise an error if:
    # a user wants to request data but does not have any token
    #
    class NotAuthenticatedError < StandardError; end
    rescue_from NotAuthenticatedError do
      render json: { error: 'Not Authorized' }, status: 403
    end

    #
    # raise an error if:
    # a user wants to request data with expired token
    #
    class AuthenticationTimeoutError < StandardError; end
    rescue_from AuthenticationTimeoutError do
      render json: { error: 'Auth token is expired' }, status: 419
    end


  end

end
