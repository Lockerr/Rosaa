class Region < ActiveRecord::Base
  belongs_to :result
  scope :by_name, order("name")

end
