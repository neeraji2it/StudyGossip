class ParentsController < ApplicationController
  
  layout :get_school_layout, :except => ['edit', 'update']

  def new
    @school = SchoolAdmin.find(params[:school_id])
    @parent = @school.parents.new
    puts "******"
     puts "#{params[:student_id]}"
     puts "*******"
    @student = User.find(params[:student_id])
  end
  
  def index
    @school = SchoolAdmin.find(params[:school_id])
    @parents = Parent.all
  end
  
  def create
    @school = SchoolAdmin.find(params[:school_id])
    # puts "##########"
    # puts params[:student_id].inspect
    # puts "#######"
    @parent = @school.parents.new(params[:parent])
    @parent.password = 'abcxyz'
    @parent.password_confirmation = 'abcxyz'
    @parentuser = Parentuser.find_by_email(@parent.email)
    if !@parentuser.present?
      if @parent.save  # !@parent.email.present?                                
                @parentuser = Parentuser.create(:parent_id => @parent.id, :user_id => params[:user_id], :email => @parent.email,:school_admin_id => @school.id)
        @parent.send_reset_password_instructions
        flash[:notice] = "Sccessfully Send invitation to student"
    #  UserMailer.sent_parent_invitation(@school,@parent).deliver
     #  redirect_to school_path(@school)
      else
       # flash[:error] = "Failed to Send Invitation"
       # render :action => 'new'
      end
    else
      @parentuser = Parentuser.create(:parent_id => @parentuser.parent_id, :user_id => params[:user_id], :email => @parentuser.email,:school_admin_id => @school.id)
     # redirect_to school_path(@school)
    end
  end
  
  def edit
     @parent = Parent.find(params[:id])
    if @parent.reset_password_token != params[:reset_password_token]
      render :text => 'Invalid Token.',:layout => false
    end
  end
  
  def update
     @parent = Parent.find(params[:id])
    if @parent.update_attributes(params[:parent])
      @parent.update_attribute(:reset_password_token,nil)
      @parent.update_attribute(:confirmation_token,nil)
      sign_in(@parent,@parent)
      redirect_to root_path

    else
      flash.now[:error] = "Loggened is failed"
      render :action => 'edit'
    end
  end

 
 def show
   @school = SchoolAdmin.find(params[:school_id])
   @parent = Parent.find(params[:id])
 end

 def destroy
   @parent = Parent.find(params[:id])
   if @parent.destroy
    respond_to do |format|
      format.js
    end
  end
end

end
