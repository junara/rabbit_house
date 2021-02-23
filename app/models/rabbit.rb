# frozen_string_literal: true

class Rabbit < ApplicationRecord
  has_many :reservations, dependent: :nullify
  has_many :rooms, through: :reservations
end
