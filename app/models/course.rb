class Course < ApplicationRecord
  #belongs_to :teacher, class_name: 'User'
  belongs_to :category
  has_many_attached :course_videos #Active storage 
  validate :validate_course_videos
  has_many :orders
  has_many :line_items
  # has_many :carts, through: :cart_courses
private

  def validate_course_videos
    course_videos.each do |video|
      if !video.content_type.in?(%w(video/mp4 video/avi video/mov))
        errors.add(:course_videos, 'must be a valid video format (MP4, AVI, MOV)')
      end
    end
  end
end
