class Parent::DashboardsController < ApplicationController
 layout :layout?
 before_filter :authenticate_parent!

  def index
    @parent = current_parent
  end

  def marks
    @parent = current_parent
    @user = User.find(params[:id])
    @marks = @user.received_marks
  end

  def mark_compare
     @parent = current_parent
     @users = User.where(:role => "student")
     @user = User.find(params[:id])
     @marks = @user.received_marks
  end

  def attend_compare
    @parent = current_parent
   #  @user = User.find(params[:id])
    @attendance = Attendance.all
    @users = User.where(:role => "student")
    @start_date = Date.today.beginning_of_month
    @end_date = Date.today.end_of_month
    @date = Date.today
    @attendances = Attendance.all

  end

  def attendance_report
   @parent = current_parent
 end

end