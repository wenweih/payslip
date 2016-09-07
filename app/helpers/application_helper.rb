module ApplicationHelper
  def title(text)
    content_for :title,text
  end

  def meta_tag(tag,text)
    content_for :"meta_#{tag}",text
  end

  def yield_meta_tag(tag,default_text=" ")
    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
  end

  # 给定 controller name 是否是当前的 controller
  # Examples
  #
  #   # On TreeController
  #   current_controller?(:tree)           # => true
  #   current_controller?(:commits)        # => false
  #   current_controller?(:commits, :tree) # => true
  def current_controller?(*args)
    args.any? do |v|
      v.to_s.downcase == controller.controller_name || v.to_s.downcase == controller.controller_path
    end
  end

  # 给定 action name 是否是当前的 action
  def current_action?(*args)
    args.any? { |v| v.to_s.downcase == action_name }
  end

  def nav_active(options = {})
    # path 的格式类型为 controller_name#action_name
    if path = options.delete(:path)
      if path.respond_to?(:each)
        c = path.map { |p| p.split('#').first }
        a = path.map { |p| p.split('#').last }
      else
        c, a, _ = path.split('#')
      end
    elsif action = options.delete(:action)
      a = action
    else
      c = options.delete(:controller)
    end
    if c && a
      # When given both options, make sure BOTH are active
      klass = current_controller?(*c) && current_action?(*a) ? 'active' : ''
    else
      # Otherwise check EITHER option
      klass = current_controller?(*c) || current_action?(*a) ? 'active' : ''
    end
    klass
  end

end
