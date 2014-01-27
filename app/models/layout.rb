class Layout < ActiveRecord::Base
  attr_accessible :html, :name, :page_id, :template_id
  belongs_to :page
  has_many :contents
end
