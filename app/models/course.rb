class Course < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :sections
  has_many :enrollments

  validates :title, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :image, file_size: {less_than: 10.megabytes}

  def free?
    cost.zero?
  end

  def premium?
    ! free?
  end
end
