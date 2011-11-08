class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable
  acts_as_votable

  self.per_page = 1

  validates_presence_of :user_id

end
