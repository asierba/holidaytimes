class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(approved: true)
  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create

    @booking = Booking.new(booking_params)
    @booking.approved = false
    @user = current_user
    @user.bookings << @booking
    if @user.save
      redirect_to @booking
    else
      render 'new'
    end


    #if @booking.save
    #  redirect_to @booking
    #else
    #  render 'new'
    #end
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

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path
  end
  private
    def booking_params
      params.require(:booking).permit(:who, :from, :to)
    end
end
