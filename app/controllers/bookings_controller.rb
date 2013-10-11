class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      render 'new'
    end
  end

  private
    def booking_params
      params.require(:booking).permit(:who, :from, :to)
    end
end
