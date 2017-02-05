class BalancesController < ApplicationController
  def new
  end

  def create
    user = current_user
    if user
      client = user.clients.find_by_id params[:client_id]
      balances = client.balances.new balance_params
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
      @client = user.clients.find_by_id params[:client_id]
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
end
