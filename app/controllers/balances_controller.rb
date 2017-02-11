class BalancesController < ApplicationController
  def new
    @percent_catalogs = PercentCatalog.all
    @vendors = current_user.vendors
  end

  def create
    user = current_user
    @vendor = Vendor.find(vendor_params[:vendor])
    @percent_catalog = PercentCatalog.find(percent_catalog_params[:percent])
    if user && @vendor && @percent_catalog
      client = user.clients.find_by_id params[:client_id]
      balances = client.balances.new(add_points_params(@vendor, @percent_catalog))
      if balances.save
        flash[:points]
        redirect_to client_path(params[:client_id])
      else
        flash[:invalid]
        redirect_to client_path(params[:client_id])
      end
    end
  end

  def use_new
    user = current_user

    if user
      @client = user.clients
      @client_profile = @client.client_profile
      @balances = @client.balances || []
      @point_number = @balances.sum(:point)
    end
  end

  def use_create
    user = current_user
    if user
      client = user.clients.find_by_id params[:client_id]
      points = balance_params[:point].to_i.abs
      balances = client.balances
      balance = balances.new({ point: - points })
      if balances.sufficient_balance?(points)
        if balance.save
          flash[:used_points] = "Puntos utilizados: #{points}"
          redirect_to client_path(params[:client_id])
        else
          flash[:invalid]
          redirect_to client_path(params[:client_id])
        end
      else
        flash[:insufficient_money] = true
        redirect_to client_balances_use_new_path(params[:client_id])
      end
    end
  end

  private

  def balance_params
    params.require(:balance).permit(:point)
  end

  def balance_information_params
    params.require(:balance_information).permit(:amount, :note_number)
  end

  def vendor_params
    params.require(:vendor).permit(:vendor)
  end

  def percent_catalog_params
    params.require(:percent_catalog).permit(:percent)
  end

  def add_points_params(vendor, percent_catalog)
    result = {point: params[:balance][:point], vendor: vendor,
              balance_information_attributes: {
                amount: params[:balance_information][:amount],
                note_number: params[:balance_information][:note_number],
                percent_catalog: percent_catalog}}
  end
end
