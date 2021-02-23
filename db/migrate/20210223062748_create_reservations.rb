# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :room
      t.references :rabbit
      t.date :start_month
      t.date :end_month
      t.timestamps
    end
  end
end
