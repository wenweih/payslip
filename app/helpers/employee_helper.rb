module EmployeeHelper
  def set_leader_link user
    opr_type = (user.namespace.leader == user) ? "cancel" : "assign"
    path = set_leader_employee_path(user, type: opr_type, namespace: user.namespace)
    title = ( user.namespace.leader == user ) ? "cancel department leader" : "set as department leader"
    class_btn = ( user.namespace.leader == user ) ? "ui mini positive icon button" : "ui mini icon button"
    link_to path, method: :put, class: class_btn, title: "#{title}" do
      content_tag(:i, "", class: "setting icon")
    end
  end
end
