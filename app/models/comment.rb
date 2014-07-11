class Comment < ActiveRecord::Base
  validates_presence_of :comment

  belongs_to :project,
  inverse_of: :comments,
  dependent: :destroy

  belongs_to :user,
  inverse_of: :comments
end
