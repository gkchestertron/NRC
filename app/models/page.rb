class Page < ActiveRecord::Base
  attr_accessible :title
  has_one :layout
end
