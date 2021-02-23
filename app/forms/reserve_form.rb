# frozen_string_literal: true

class ReserveForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations
  attribute :rabbit_id, :integer
  attribute :room_id, :integer
  attribute :start_month, :date
  attribute :end_month, :date

  validates :rabbit_id, presence: true
  validates :room_id, presence: true
  validates :start_month, presence: true
  validates :end_month, presence: true
  validate :start_month_lteq_end_month

  def initialize(attr)
    super(form_params(attr))
  end

  def save
    return false unless valid?

    room = Room.find(room_id)
    rabbit = Rabbit.find(rabbit_id)
    start_month_date = parse_date(start_month).beginning_of_month
    end_month_date = parse_date(end_month).beginning_of_month
    ReservationService.create(room, rabbit, start_month_date, end_month_date)
  end

  private

  def parse_date(str)
    return Date.current if str.blank?

    Date.parse("#{str}-01")
  end

  def start_month_lteq_end_month
    return if parse_date(start_month).beginning_of_month <= parse_date(end_month).beginning_of_month

    errors.add(:body, '期間にエラーがあります')
  end

  def form_params(attr)
    {
      room_id: attr[:room_id],
      rabbit_id: attr[:rabbit_id],
      start_month: parse_date(attr[:start_month]),
      end_month: parse_date(attr[:end_month])
    }
  end
end
