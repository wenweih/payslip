class SessionsController < Clearance::SessionsController

  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        redirect_to dashboard_index_path, notice:"登录成功" and return
      else
        flash.now.notice = status.failure_message
        render template: "sessions/new"
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: "成功退出"
  end

  def new
    render template: "sessions/new"
  end
end
