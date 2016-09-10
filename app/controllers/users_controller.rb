class UsersController < Clearance::UsersController
  skip_before_filter :redirect_signed_in_users, only: [:create], raise: false

  def new
    @user = user_from_params
  end

  def create
    @user = user_from_params
    begin
      @user.save!
      if @user.first_name.present?
        redirect_to :back, notice:"Successfully add #{@user.first_name}" and return
      else
        sign_in @user
        redirect_to root_path, notice:"Successfully sign up and Sign in auto" and return
      end
    rescue  ActiveRecord::RecordInvalid => exception
      flash[:notice] = "#{exception}"
      render "users/new"
    end
  end

  private
  def user_from_params
    user_params = params[:user] || Hash.new
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    annual_salary = user_params.delete(:annual_salary)
    super_rate = user_params.delete(:super_rate)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.first_name = first_name
      user.last_name = last_name
      user.annual_salary = annual_salary
      user.super_rate = super_rate
    end
  end

  # def user_params
  #   params.require(:user).permit(:email, :password, :first_name, :last_name, :annual_salary,  :super_rate)
  #   # params[Clearance.configuration.user_parameter] || Hash.new
  # end
end
