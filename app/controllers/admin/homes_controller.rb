class Admin::HomesController < ApplicationController
before_action :authenticate_admin!

  def top
    @users = User.order(created_at: :desc).page(params[:page]).per(8)
    @grants = Grant.all
    @today_grant = Grant.created_today
    @yesterday_grant = Grant.created_yesterday
    @this_week_grant = Grant.created_this_week
    @last_week_grant = Grant.created_last_week
  end

end