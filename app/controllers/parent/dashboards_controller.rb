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
  end

  def attend_compare
    @parent = current_parent
    @users = User.where(:role => "student")
  #  @school = SchoolAdmin.find(params[:school_id])
     @start_date = Date.today.beginning_of_month
    @end_date = Date.today.end_of_month
 
    @date = Date.today

  end

  def attendance_report
   @parent = current_parent
 end

end