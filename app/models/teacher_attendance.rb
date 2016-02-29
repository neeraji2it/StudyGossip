class TeacherAttendance < ActiveRecord::Base
  attr_accessible :present_date, :school_admin_id, :status,:user_id
  belongs_to :user
#  belongs_to :receiver, :class_name => 'User'
end
