class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(approved: true)
  end

  def range
    @bookings = Booking.where "\"from\" BETWEEN :start_date AND :end_date OR \"to\" BETWEEN :start_date AND :end_date ",
                              {:start_date => params[:start], :end_date => params[:finish]}

    render :json => @bookings
  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.approved = false

    @user.bookings << @booking
    if @user.save
      redirect_to @booking
    else
      render 'new'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(params[:booking].permit( :from, :to))
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
      params.require(:booking).permit( :from, :to)
    end
end
