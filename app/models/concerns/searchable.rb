module Searchable
  extend ActiveSupport::Concern

  module ClassMethods

    def search query
      return unless query
      where(build_query(query).join(' and '))
    end

  end

  private

  def build_query query
    query_string = []
    query.each do |key, value|
      case key
      when "email", "first_name" ,"last_name"
        query_string << sanitize_sql_array(["LOWER(#{key}) LIKE LOWER(?)", "%#{value}%"]) if value.present?
      when "is_active"
        query_string << sanitize_sql_array(["#{key} = ?", value]) if value.present?
      when "from"
        query_string << sanitize_sql_array(["created_at >= ?", value]) if value.present?
      when "to"
        query_string << sanitize_sql_array(["created_at <= ?", value]) if value.present?
      end
    end
    query_string
  end



end
