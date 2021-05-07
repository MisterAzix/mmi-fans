class UsersController < ApplicationController
  
  def show
    @user = User.where("lower(username) = ?", params[:slug].downcase).first
    @posts = Post.where(:user_id => @user.id).order('id DESC')
  end

end
