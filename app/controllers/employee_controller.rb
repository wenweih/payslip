class EmployeeController < ApplicationController
  def index
    @users = User.where("admin IS NULL").includes(:namespace).order(:created_at).page params[:page]
  end

  def create
  end

  def new

  end

  def edit
  end

  def destroy
  end
end
