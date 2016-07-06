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
end
