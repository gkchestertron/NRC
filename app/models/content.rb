class Content < ActiveRecord::Base
  attr_accessible :layout_id, :parent_selector, :text
  belongs_to :layout
end
