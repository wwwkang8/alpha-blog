class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only:[:destory]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
    # @users = User.all
  end



  # Sign up을 누르면 new 라우팅으로 연결되어 new.html로 연결된다.
  # 하지만 @user = User.new를 왜 생성하는지 이유를 알 수 없다.
  # 왜냐하면 create에서도 @user를 사용하기 때문에 사실상 필요가 없는 생성이다.
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # UI로부터 받아온 이름, 이메일, 비밀번호를 받아서 인스턴스 생성
    if @user.save # 인스턴스를 DB에 저장
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new' # DB 저장에 실패하여 user/new.html로 다시 리다이렉트
    end
  end

  def edit
    render 'edit' # edit 템플릿으로 보내면 바로 @user와 같이 전송되는것 같다.
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all articles have been deleted"
    redirect_to users_path
  end



  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_same_user
      if current_user != @user and !current_user.admin?
        flash[:danger] = "You can only edit your own account"
        redirect_to root_path
      end
    end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin User can perform that action"
      redirect_to root_path
    end
  end

end