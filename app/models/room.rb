# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :reservations, dependent: :nullify
  has_many :rooms, through: :reservations

  def reserved_months
    months = reservations.pluck(:start_month, :end_month)
    return [] if months.blank?

    return [months[-1]] if months.count == 1

    from_range_arrays = months[0..-2]
    range_array = months[-1]
    MonthRange::Service.add(range_array, from_range_arrays)
  end
end
