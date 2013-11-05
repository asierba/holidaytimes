class ApprovalsController < ApplicationController
  def index
    @bookings = Booking.where("approved = '0'")
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.approved = true

    if @booking.save
      redirect_to approvals_path
    end
  end
end
