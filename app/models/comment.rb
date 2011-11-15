class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  has_many :comments, :as => :commentable

  validates_presence_of :user_id
  self.per_page = 10

end
