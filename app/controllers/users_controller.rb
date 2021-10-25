class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(uid: params[:user][:uid],pass: params[:user][:pass])
    if @user.valid? #validatesを実行してくれる
      
      @user.pass = BCrypt::Password.create(params[:user][:pass])
      @user.save
      redirect_to users_path
      #TODO:成功したことを通知する
      flash[:notice] = '新規ユーザーを登録しました'
    else
      render 'new'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
    flash[:notice] = '該当ユーザーを削除しました'
  end
end
