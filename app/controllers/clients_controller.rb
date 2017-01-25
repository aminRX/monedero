class ClientsController < ApplicationController
  before_action :login

  def new
    user = current_user
    @client = user.clients.new
  end

  def create
    @user = current_user
    if @user
      client = @user.clients.new client_params
      client.client_profile_attributes = client_profile
      client.save
      redirect_to clients_path + "/#{client.id}"
    end
  end

  def show
    user = current_user
    if user
      @client = user.clients.find_by_id(params[:id])
    end
  end

  def index
    user = current_user
    if user
      @clients = user.clients
    end
  end

  def client_params
    params.require(:client).permit(:client_number)
  end

  def client_profile
    params.require(:client_profile).permit(:name, :phone, :phone_model, :birthdate)
  end
end
