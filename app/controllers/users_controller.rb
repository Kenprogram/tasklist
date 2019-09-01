class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :encore_correct_user, only: [:edit, :update]
  
  def index
    @tasks = Task.where(status: "未完了").page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to tasks_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      redirect_to root_url
    end
  end
  
end
