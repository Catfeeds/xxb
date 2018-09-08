class Evaluation < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :practice
  belongs_to :papertest
  has_many :justices, dependent: :destroy

  has_attached_file :picture_ya
  validates_attachment_file_name :picture_ya, :matches => [/png\Z/, /jpe?g\Z/]
  validates_attachment_content_type :picture_ya, :content_type => /\Aimage\/.*\Z/

  acts_as_paranoid
  
  # validates :your_answer, presence: true
end
