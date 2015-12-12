class Cashier < ActiveRecord::Base
  belongs_to :user
  resourcify
  acts_as_paranoid
  validates :user_id, uniqueness: true, presence: true
end
