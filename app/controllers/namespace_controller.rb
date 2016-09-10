class NamespaceController < ApplicationController
  def index
    @np = Namespace.all
  end

  def create
    namespace_params = params[:namespace]
    all_records = []
    admin_id = User.where(admin: 1).first.id
    namespace_params.each do  |n|
      single_record = { owner_id: admin_id }
      single_record.merge!(name: n).merge!(path: n)
      all_records.push  single_record
    end
    begin
      Namespace.bulk_insert values: all_records
      redirect_to namespace_index_path, notice: "batch add department successfully"
    rescue  StandardError => error
      redirect_to namespace_index_path, notice: "#{error}"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def query_user
    free_employee = User.where(:namespace_id => nil).pluck(:email)
    query_result = {
      "success": true,
      "results": [

      ]
    }
    free_employee.each do  |employee|
      query_result[:results].push({
        "name": employee
      })
    end
    respond_to  do  |format|
      format.json { render json: query_result}
    end
  end

end
