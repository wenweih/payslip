class DashboardController < ApplicationController
  def index
  end

  def calculate
    @collections = User.where.not(annual_salary: nil, super_rate: nil, first_name: nil, last_name: nil)
  end

  def result
    respond_to do  |format|

    end
  end

end
