# frozen_string_literal: true

Reservation.delete_all
Room.delete_all
Rabbit.delete_all

[
  { name: 'うさぎのおへや1' },
  { name: 'うさぎのおへや2' },
  { name: 'うさぎのおへや3' }
].each do |attributes|
  Room.create(attributes)
end

[
  { name: 'ネザーランドドワーフ' },
  { name: 'ホーランドロップ' },
  { name: 'ミニレッキス' }
].each do |attributes|
  Rabbit.create(attributes)
end

Room.all.each do |room|
  Rabbit.all.each do |rabbit|
    ReservationService.create(room, rabbit, Date.new(2021, 1, 1), Date.new(2021, 6, 1))
  end
end
