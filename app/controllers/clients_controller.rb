class ClientsController < ApplicationController
  before_action :login

  def new
  end

  def create
    @user = current_user
    if @user
      client = @user.clients.create client_params
      redirect_to clients_path + "/#{client.id}"
    end
  end

  def show
    user = current_user
    if user
      @client = user.clients.find_by_id(params[:id])
    end
  end

  def client_params
    params.require(:client).permit(:client_number)
  end
end
