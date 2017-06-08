class BalancesController < ApplicationController
  def new
    @percent_catalogs = current_user.cards
    @vendors = current_user.vendors
  end

  def create
    user = current_user
    @vendor = Vendor.find(vendor_params[:vendor])
    if user && @vendor
      client = user.clients.find_by_id params[:client_id]
      @percent_catalog = Card.find_by_id(client.card_id)
      add_points = add_points_params(@vendor, @percent_catalog)
      balances = client.balances.new(add_points)
      balances.calculate_points(
        add_points[:balance_information_attributes][:amount],
        add_points[:balance_information_attributes][:card]
      )
      if balances.save
        flash[:added_points] = "Se agregaron los puntos"
        redirect_to client_path(params[:client_id])
      else
        flash[:invalid_points] = "No se pudo agregar los puntos."
        redirect_to client_path(params[:client_id])
      end
    end
  end

  def use_new
    user = current_user
    if user
      @client = user.clients.find(params[:client_id])
      @client_profile = @client.client_profile
      @balances = @client.balances || []
      @point_number = @balances.sum(:point)
      @vendors = current_user.vendors
    end
  end

  def use_create
    user = current_user
    if user
      client = user.clients.find_by_id params[:client_id]
      points = balance_params[:point].to_i.abs
      balances = client.balances

      balance = balances.new(add_points_params_without_card(points))
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

  def use_edit

  end

  def destroy
    @client = Client.find(params[:client_id])
    @balance = Balance.find(params[:id])
    if @balance.update_attribute(:archived, true)
      redirect_to client_path(@client.id)
    else
      render :show
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
    params.require(:card).permit(:percent)
  end

  def add_points_params(vendor, percent_catalog)
    {vendor: vendor,
     balance_information_attributes: {
       amount: params[:balance_information][:amount],
       note_number: params[:balance_information][:note_number],
       card: percent_catalog}}
  end

  def add_points_params_without_card(points)
    {point: - points,
     vendor_id: params[:vendor][:vendor],
     balance_information_attributes: {
       amount: params[:balance_information][:amount],
       note_number: params[:balance_information][:note_number]
     }
    }
  end
end
