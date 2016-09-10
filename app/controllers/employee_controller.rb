class EmployeeController < ApplicationController
  def index
    @users = User.where("admin IS NULL").includes(:namespace).order(:created_at).page params[:page]
    @namespaces = Namespace.all
  end

  def create
  end

  def new

  end

  def edit
  end

  def destroy
  end
  def change_namespace
    user = User.find(params[:id])
    namespace = Namespace.find(params[:namespace]) if params[:namespace] != "0"
    begin
      user.namespace = namespace.present? ? namespace : nil
      user.save!
      redirect_to employee_index_path, notice: user.namespace.present? ? "now, #{user.email} is belongs to #{user.namespace.name} " : "#{user.email} is free"
    rescue  ActiveRecord::RecordInvalid => exception
      redirect_to employee_index_path, notice: "update #{user.email} because of #{exception}"
    end
  end
end
