class UsersController < ApplicationController
  
  def show
    @user = User.where("lower(username) = ?", params[:slug].downcase).first
    @posts = Post.where(:user_id => @user.id).order('id DESC')
    @avatar = @user.avatar.attached? ? @user.avatar.url(:width=>256, :height=>256, :crop=>"fill") : "https://via.placeholder.com/128"
  end

end
