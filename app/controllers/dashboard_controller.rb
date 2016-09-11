class DashboardController < ApplicationController
  def index
  end

  def calculate
    @collections = User.where.not(annual_salary: nil, super_rate: nil, first_name: nil, last_name: nil)
  end

  def result
    @user = User.find(params[:employee])
    Payslip::AppLogger.info "user email: #{@user.email}"
    annual_tax = @user.annual_tax

    # 实例化工资单计算类
    @calculate = Payslip::PayslipCalcute.new(params[:start], params[:end], @user.super_rate, @user.annual_salary, annual_tax)
    Payslip::AppLogger.info "super_rate: #{@calculate._super}"
    respond_to do  |format|
      format.js { render 'result' }
    end
  end

end
