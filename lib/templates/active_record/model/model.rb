class <%= class_name %> < ActiveRecord::Base
  has_paper_trail

  attr_accessible <%= attributes.map { |a| ":#{a.name}" }.join(', ') %>

  def to_s
    <%= "self.#{attributes.first.name}" %>
  end

  def self.filtered_list(query)
    query.present? ? magick_search(query) : scoped
  end
end
