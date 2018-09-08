class Roadmap < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :textbook
  has_many :paces, dependent: :destroy
  has_many :lessons, through: :paces
  has_many :wordmaps

  acts_as_paranoid
  validates :name, presence: true
end
