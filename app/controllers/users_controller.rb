class UsersController < ApplicationController
  def index
    @users = User.order('id desc')
    render :layout => 'admin'
  end
end
