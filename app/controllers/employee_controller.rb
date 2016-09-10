class EmployeeController < ApplicationController
  def index
    @users = User.where("admin IS NULL").includes(:namespace).order(:created_at).page params[:page]
    @namespaces = Namespace.all
  end

  def edit
    @employee = User.find(params[:id])
  end

  def update
    params.permit!
    user = User.find(params[:id])
    begin
      user.update_attributes!(params[:user])
      redirect_to employee_index_path, notice: "update #{user.email} successfully"
    rescue  StandardError => error
      redirect_to :back, notice: "#{error}"
    end
  end

  def destroy
    user = User.find(params[:id])
    begin
      if user.namespace.present? && user.namespace.leader == user
        redirect_to employee_index_path, notice: "#{user.email} is #{user.namespace.name} department, can't be deleted" and return
      else
        user.destroy!
        redirect_to employee_index_path, notice: "deleted #{user.email}" and return
      end
    rescue  StandardError => error
      redirect_to employee_index_path, notice: "#{error}"
    end
  end

  def change_namespace
    user = User.find(params[:id])
    # if user reassigned is a department leader ,user admin user as the department leader
    if user.namespace.present? && user.namespace.leader == user
      user.namespace.leader = User.where(admin: 1).first
      user.namespace.save!
    end
    namespace = Namespace.find(params[:namespace]) if params[:namespace] != "0"
    begin
      user.namespace = namespace.present? ? namespace : nil
      user.save!
      redirect_to employee_index_path, notice: user.namespace.present? ? "now, #{user.email} is belongs to #{user.namespace.name} " : "#{user.email} is free"
    rescue  ActiveRecord::RecordInvalid => exception
      redirect_to employee_index_path, notice: "update #{user.email} because of #{exception}"
    end
  end

  def set_leader
    namespace = Namespace.find(params[:namespace])
    user = User.find(params[:id])
    namespace.leader = user if params[:type] == "assign"
    namespace.leader = User.where(admin: 1).first if params[:type] == "cancel"
    begin
      redirect_to :back, notice: "#{namespace.name} is belong to #{namespace.leader.email}" and return if namespace.save!
    rescue StandardError => error
      redirect_to :back, notice: "#{error}"
    end
  end

end
