class UsersController < Clearance::UsersController
  def new
    @user = user_from_params
  end

  def create
    @user = user_from_params
    begin
      @user.save!
      sign_in @user
      redirect_to dashboard_index_path, notice:"注册成功且自动登录" and return
    rescue  ActiveRecord::RecordInvalid => exception
      flash[:notice] = "#{exception}"
      render "users/new"
    end
  end

  private
  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end
end
