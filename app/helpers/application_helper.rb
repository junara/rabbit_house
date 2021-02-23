# frozen_string_literal: true

module ApplicationHelper
  def display_year_month(date)
    date.strftime('%Y年%m月')
  end
end
