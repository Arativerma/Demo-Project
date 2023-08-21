class Course < ApplicationRecord
  #belongs_to :teacher, class_name: 'User'
  belongs_to :category
  has_many_attached :course_videos
  validate :validate_course_videos_content_type
  has_many :purchases
  #has_many :students, through: :purchases, source: :student
private

  def validate_course_videos_content_type
    course_videos.each do |video|
      if !video.content_type.in?(%w(video/mp4 video/avi video/mov))
        errors.add(:course_videos, 'must be a valid video format (MP4, AVI, MOV)')
      end
    end
  end
end
