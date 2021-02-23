# frozen_string_literal: true

module ReservationService
  module_function

  def create(room, rabbit, start_month, end_month)
    ApplicationRecord.transaction do
      room.save!
      rabbit.save!
      Reservation.create!(
        room: room,
        rabbit: rabbit,
        start_month: start_month,
        end_month: end_month
      )
    end
  end
end
