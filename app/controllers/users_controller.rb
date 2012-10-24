class UsersController < ApplicationController
  def index
    @users = User.all
    render :layout => 'admin'
  end
end
