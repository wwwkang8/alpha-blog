class UsersController < ApplicationController

  def index
    @users = User.all
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
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new' # DB 저장에 실패하여 user/new.html로 다시 리다이렉트
    end
  end

  def edit
    @user = User.find(params[:id]) # 변경할 유저 아이디로 유저 retrieve.
    render 'edit' # edit 템플릿으로 보내면 바로 @user와 같이 전송되는것 같다.
  end

  def update
    @user = User.find(params[:id]) # 업데이트할 유저 반환.
    if @user.update(user_params)
      flash[:success] = "Your account updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end