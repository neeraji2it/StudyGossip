class Parent::DashboardsController < ApplicationController
 layout :layout?
 before_filter :authenticate_parent!

 def index
  @parent = current_parent
end

def marks
@user = User.find(params[:id])
@marks = @user.received_marks
end

def attendance_report
#  @user = User.find(params[:id])
@parent = current_parent
end
end
