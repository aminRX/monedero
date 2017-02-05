class VendorsController < ApplicationController
  before_action :login
  def new
    user = current_user
    @vendor = user.vendors.new
  end

  def create
    @vendor = current_user.vendors.new vendor_params
    if @vendor.save
      flash[:vendor_created] = "Usuario #{@vendor[:name]} creado."
      redirect_to vendors_path
    else
      flash[:vendor_error] = "Error al crear el usuario."
      redirect_to new_vendor_path
    end
  end

  def index
    @vendors = current_user.vendors
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name)
  end
end
