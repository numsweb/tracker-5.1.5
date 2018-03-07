module ApplicationHelper
  def active_nav_class(page,controller)
    if page == controller
      "active"
    else
      ""
    end

  end
end
