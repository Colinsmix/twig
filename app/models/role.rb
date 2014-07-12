class Role < ActiveRecord::Base
  validates_presence_of :name

  has_many :assignments
  has_many :users,
    through: :assignments
end
