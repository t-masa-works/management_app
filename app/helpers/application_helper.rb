module ApplicationHelper
  def format_datetime(datetime)
    datetime.strftime('%Y-%m-%d %H:%M:%S')
  end
end
