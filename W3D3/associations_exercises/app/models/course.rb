class Course < ApplicationRecord

  has_many :enrollments,
    class_name: :Enrollment,
    foreign_key: :course_id,
    primary_key: :id

  has_many :enrolled_students,
    through: :enrollments,
    source: :student

  has_one :prerequisite,
    class_name: :Course,
    primary_key: :prereq_id,
    foreign_key: :id

  has_one :instructor,
    class_name: :User,
    foreign_key: :id,
    primary_key: :instructor_id
end
