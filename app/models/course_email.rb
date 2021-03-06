class CourseEmail < ActiveRecord::Base
  belongs_to :course
  has_and_belongs_to_many :users

  validates :title, length: { minimum: 4 }
  validates :content, length: { minimum: 10 }

  def send_class_email(teacher_email)
    return if course.nil? || course.users.empty?
    course.users.each do |user|
      next if user.id == nil || user.has_role?(:teacher, course)
      UserMailer.custom_email(user, title, content, teacher_email).deliver_later
    end
  end
end
