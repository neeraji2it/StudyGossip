class Attendance < ActiveRecord::Base
  attr_accessible :user_id, :receiver_id,:today_date,:cls_id,:subject_id,:school_admin_id,:attendance_status
  belongs_to :user
  belongs_to :receiver, :class_name => 'User'
  belongs_to :subject
  belongs_to :cls
end
