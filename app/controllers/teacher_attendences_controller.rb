class TeacherAttendencesController < ApplicationController

  def new
     @user = User.find(params[:user_id])
     @school_name = SchoolAdmin.find(@user.school_admin_id)
     @teacher_attendence = TeacherAttendance.new
  end
  
  # def attendance
  #   @teacher_attendence = TeacherAttendance.find_by_user_id_and_present_date(current_user.id,params[:present_date])
  #   if @teacher_attendence.present?
  #   else
  #     TeacherAttendance.create(:user_id => current_user.id, :present_date => params[:present_date], :school_admin_id => current_user.school_admin_id)
  #   end
  #   respond_to do |format|
  #     format.js
  #   end
  # end

  def create

    @teacher_attendence = TeacherAttendance.new(params[:teacher_attendance])
    if  @teacher_attendence.save
     # respond_to do |format|
     #   format.js
     # end
     redirect_to teacher_attendences_path
   else
    flash[:notice] = "Attendance Given Failure"
    render :new
   end
 end
    
  def index
    @users = User.where("id = #{current_user.id}")
    @teacher_attendence = TeacherAttendance.where("user_id = #{current_user.id}")
    respond_to do |format|
        format.js
      end
  end

end




    