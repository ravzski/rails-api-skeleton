module MetadataBuilder
  extend ActiveSupport::Concern

  #
  # converts the query string into a json hash
  #
  def search_query
    @search_query ||= params[:query].present? ? JSON.parse(params[:query].gsub('=>', ':')) : false
  end

  def current_page
    params[:page].present? ? params[:page] : 1
  end

  def metadata collection=nil
    {count: @collection.total_count, page: current_page} if @collection.try(:total_count).present?
  end

end