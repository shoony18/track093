class UserController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def index
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(
      name: params[:name],
      tel: params[:tel],
      password: params[:password],
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/user/#{@user.id}")
    else
      render("user/new")
    end
  end

  def mypage
  	@user = User.find_by(id: session[:user_id])
    # @menue = User.find_by(id: session[:menue_id])
  end

  def form
  	
  end

  def login
  	@user = User.find_by(tel: params[:tel],password: params[:password])
  	if @user
  	  session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/user/#{@user.id}")
    else 
    	@error_message = "電話番号またはパスワードが間違っています"
    	@tel = params[:tel]
    	@pass = params[:pass]
    	render("login/form")
    end
  end

  def logout
  	session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login/form")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

end
