class UsersController < ApplicationController
  def index
  end
  def answer
  end
  def edit
  end
  def index
    @users = User.all.order(created_at: :desc)
  end
  def login_form
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password]
    )
    # binding.pry
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスとパスワードが一致しません"
      # DBとのエラーではないから、flashではメッセージはでない。なので、htmlのフィルで、表示は設定する
      @email = params[:email]
      @password = params[:password]
      render("/users/login_form")
    end
  end

  def logout
      session[:user_id] = nil
      flash[:notice] = "ログアウトしました"
      redirect_to("/")
  end


  def new
    @user = User.new
    # 新規登録ページでは、蜃気楼特に失敗した場合でも、ユーザーの入力値が軽内容にする。
    # そのため@user.emailで入力した値を受取るが、userがぞんざいしていないとエラーが起きるので新規登録ページを訪れた段階で、@user = User.newで@userrを生成ｓるうことでエラーを防いでいる
  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password],
      email: params[:email],
      image_name: "default_user.png"
    )
    @user.save
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "新規ユーザー登録が完了しました"
      redirect_to("/users/index")
    else
      render("users/new")
    end

  end

  def question
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
