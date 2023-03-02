class Admin::NotificationsController < ApplicationController

  #管理者でログインしていない場合、ログイン画面へ遷移。
  before_action :authenticate_admin!

end