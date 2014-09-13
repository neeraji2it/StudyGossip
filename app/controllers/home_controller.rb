class HomeController < ApplicationController
  layout :home_layout, only: ["index"]

  def index
    if current_user
      redirect_to profiles_path(:school_name => current_user.school_admin.school)
    end
  end

  def new_user1
    @user = User.find(params[:id])
    sql_query = "select * from tweets a where (id in (select max(id) from tweets b where a.user_id = b.user_id )) order by a.created_at desc"
    @posts = Tweet.paginate_by_sql [sql_query], :per_page => 10, :page => params[:page]
    render :layout => false
  end

  def new_user2
    @user = User.find(params[:id])
    sql_query = "select * from tweets a where (id in (select max(id) from tweets b where a.user_id = b.user_id )) order by a.created_at desc"
    @posts = Tweet.paginate_by_sql [sql_query], :per_page => 10, :page => params[:page]
    render :layout => false
  end

  def update_new_user2
    @user = User.find(params[:id])
    sql_query = "select * from tweets a where (id in (select max(id) from tweets b where a.user_id = b.user_id )) order by a.created_at desc"
    @posts = Tweet.paginate_by_sql [sql_query], :per_page => 10, :page => params[:page]
    if @user.update_attributes(params[:user])
      redirect_to profiles_path(:school_name => current_user.school_admin.school)
    else
      flash[:error] = "Failed to Update your Profile details."
      render :action => 'new_user2', :layout => false
    end

  end

  def school_login

  end

  def about
  end

  def terms_of_service
    
  end

  def privacy_policy
    
  end

  def contact
    @contact = Contact.new
  end

  def post_contact
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Successfully send the contact information"
      UserMailer.contact(@contact).deliver
      redirect_to contact_home_index_path
    else
      flash[:error] = "Fail to send the contact information"
      render :action => 'contact'
    end
  end
  
  def contact_us
    params[:captcha_error] = "Captcha is invalid." unless params[:captcha] == "4"
    params[:name_error] = "Name can't be blank." if params[:name].to_s.blank?
    params[:email_error] = "Email can't be blank" if params[:email].to_s.blank?
    params[:message_error] = "Message can't be blank." if params[:message].to_s.blank?
    
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    if params[:captcha] == "4" and !params[:name].to_s.blank? and !params[:email].to_s.blank? and !params[:message].to_s.blank?
      UserMailer.contact_us(@name,@email,@message).deliver
    end
    render
  end

end
