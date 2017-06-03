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
      @client_profile = @client.client_profile
      @balance = @client.balances.joins(:vendor) || []
      @point_number = @balance.where(archived: false).sum(:point)
      @balances = Kaminari.paginate_array(@balance).page(params[:page]).per(25)
    end
  end

  def index
    user = current_user
    if user
      @clients = user.clients
    end
  end

  def search
    user = current_user
    if user
      client = user.clients.where(client_params).take
      if client
        redirect_to client_path(client.id)
      else
        flash[:not_found] = true
        redirect_to root_path
      end
    end
  end

  def client_params
    params.require(:client).permit(:client_number)
  end

  def client_profile
    params.require(:client_profile).permit(:name, :phone, :phone_model, :birthdate, :email)
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

end
