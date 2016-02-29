class TeacherAttendencesController < ApplicationController

  def new
    @school_name = SchoolAdmin.find(params[:school_name])
    @school_admin_id = params[:school_name]
    @user_id = params[:user_id]
    @teacher_attendence = TeacherAttendance.new
  end
  
  def create
    @school_name = SchoolAdmin.find(params[:school_name])
    @teacher_attendence = TeacherAttendance.new(params[:attendance])
    @teacher_attendence.school_admin_id = @school_name.id
    @teacher_attendence.user_id = params[:user_id]
    if @teacher_attendence.save
      flash[:notice] = "Giving TeacherAttendance Successfully"
      redirect_to root_path
    else
      flash[:notice] = "TeacherAttendance Given Failure"
      render :new
    end
  end
  
  def index
    @user = User.find(params[:user_id])
  end

end
