class Admin::UsersController < ApplicationController
before_action :authenticate_admin!

  def show
   @user = User.find(params[:id])
   @grants = @user.grants
   @today_grant = @grants.created_today
   @yesterday_grant = @grants.created_yesterday
   @this_week_grant = @grants.created_this_week
   @last_week_grant = @grants.created_last_week
  end

  def edit

  end

  def update
   @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to admin_root_path
  else
    render :edit
  end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :company_from, :name_kana, :company_number, :post_code, :address, :phonenumber, :is_deleted )
  end

end


