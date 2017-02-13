class UsePointsController < ApplicationController
  def show
    @balance = Balance.find(params[:id])
    @client = @balance.client
    @vendor = @balance.vendor
  end

  def new
  end

  def create
    puts params[:id]
  end

  def edit
    @balance = Balance.find(params[:id])
    @vendor = @balance.vendor
    @vendors = Vendor.all
  end
end
