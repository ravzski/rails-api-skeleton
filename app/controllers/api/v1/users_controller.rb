class Api::V1::UsersController < ApiController

  before_action :find_obj, except: [:index,:create]

  def index
    @collection = User.search(search_query).page(current_page)
    render_collection
  end

  def create
    @obj = User.new(obj_params)
    basic_create
  end

  def update
    basic_update
  end

  def destroy
    basic_destroy
  end

  private

  def find_obj
    @obj = User.find(params[:id])
  end

  def obj_params
    params.require(:user).permit(*%i(
      first_name
      last_name
      email
      password
    ))
  end

end
