class TeacherAttendencesController < ApplicationController

  def new
    @school_name = SchoolAdmin.find(params[:school_name])
    @user = User.find(params[:class_id])
    @teacher_attendence = TeacherAttendance.new
  end
  
  def attendance
    @teacher_attendence = TeacherAttendance.find_by_user_id_and_present_date(current_user.id,params[:present_date])
    if @teacher_attendence.present?
    else
      TeacherAttendance.create(:user_id => current_user.id, :present_date => params[:present_date], :school_admin_id => current_user.school_admin_id)
    end
    respond_to do |format|
      format.js
    end
  end
  
  def index
    @user = User.find(params[:user_id])
  end

end

