# frozen_string_literal: true

class CustomTime
  def add_month(time, integer = nil)
    return nil if integer.nil?

    time.month + integer
  end

  def sum_month(times)
    times.sum(&:month)
  end

  def self.now_month
    Time.now.month
  end
end
