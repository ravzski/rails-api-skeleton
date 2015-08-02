module CommonActions
  extend ActiveSupport::Concern

  def basic_create
    if @obj.save
      render_create_success
    else
      render_obj_errors
    end
  end

  def basic_update
    if @obj.update_attributes(obj_params)
      render_update_success
    else
      render_obj_errors
    end
  end

  def basic_destroy
    if @obj.destroy
      render_update_success
    else
      render_obj_errors
    end
  end

  def basic_show
    render json: @obj
  end

end
