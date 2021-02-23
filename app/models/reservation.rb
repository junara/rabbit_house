# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :rabbit
  belongs_to :room
end
