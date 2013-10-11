class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)

    @booking.save
    redirect_to @booking
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(params[:booking].permit(:who, :from, :to))
      redirect_to @booking
    else
      render 'edit'
    end
  end

  private
    def booking_params
      params.require(:booking).permit(:who, :from, :to)
    end
end
