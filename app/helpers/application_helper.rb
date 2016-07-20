module ApplicationHelper
  def get_user
    @user = WebService.get_single_user_by(params[:id])
  end

  def new_user
    @user = User.new()
  end

  def get_user_account
    @account = WebService.get_account_for_user(1)
  end


  def logged_on?
    !session[:email].blank?
  end

  def set_role(role)
    session[:role] = role
  end

  def admin?
    session[:role] == 'admin'
  end

  def check_logged_on
    redirect_to root_path unless logged_on?
  end

  def logon(email)
    session[:email] = email
  end
end
