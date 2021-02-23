# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @rabbits = Rabbit.all
  end

  def create
    @form = ReserveForm.new(reserve_form_params)
    @form.save
    redirect_to :root, notice: '予約成功'
  end

  def destroy
    reservation = Reservation.find(params[:reservation_id])
    reservation.destroy!
    redirect_to :root, notice: '予約削除成功'
  end

  private

  def reserve_form_params
    params.require(:reserve_form).permit(
      :room_id, :rabbit_id, :start_month, :end_month
    )
  end
end
