module TasksHelper
  def priority_class(priority)
    case priority
    when "low"
      "low-priority"
    when "medium"
      "medium-priority"
    when "high"
      "high-priority"
    else
      ""
    end
  end

end
