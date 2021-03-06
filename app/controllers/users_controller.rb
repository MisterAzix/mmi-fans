class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  
  def show
    @user = User.where("lower(username) = ?", params[:slug].downcase).first
    @can = @current_user && (@user == current_user || current_user.is_admin?)
    @posts = Post.where(:user_id => @user.id).order('id DESC')
    @avatar = @user.avatar.attached? ? @user.avatar.url(:secure=>true, :width=>256, :height=>256, :crop=>"fill") : "https://via.placeholder.com/128"
  end

end
