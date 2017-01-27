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

  private

  def balance_params
    params.require(:balance).permit(:point)
  end
end
