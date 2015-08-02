class Api::V1::SessionsController < ApiController

  skip_before_action :authenticate_request, only: :create

  def show
    render json: SessionsSerializer.show
  end

  def create
    user = User.find_by_credentials(params[:credentials])
    if user && user.set_access_token(request_details)
      render json: SessionsSerializer.create
    else
      render json: { error: 'Incorrect email or password' }, status: 403
    end
  end

  def destroy
    if current_user.destroy_token
      render_update_success
    else
      render_obj_errors
    end
  end

end
