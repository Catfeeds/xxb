class Catalog < ActiveRecord::Base
  resourcify
  belongs_to :user
  belongs_to :textbook
  belongs_to :lesson
  acts_as_paranoid
  validates :serial, :lesson_id, presence: true
  validates :lesson_id, exclusion: {in: [0]}
  validates_associated :lesson

end
