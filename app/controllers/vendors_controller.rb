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
    @vendors = active_vendors
  end

  def edit
    @vendor = current_user.vendors.find params[:id]
  end

  def update
    @vendor = current_user.vendors.find params[:id]
    if @vendor.update_attributes(vendor_params)
      flash[:success_update] = "Vendedor #{@vendor[:name]} modificado."
      redirect_to vendors_path
    else
      flash[:error_update] = "Vendedor no se pudo modificar"
      redirect_to edit_vendor_path
    end
  end

  def destroy
    @vendor = current_user.vendors.find params[:id]
    if @vendor.update_attribute(:archived, true)
      flash[:success_delete] = "Vendedor #{@vendor[:name]} eliminado."
      redirect_to vendors_path
    else
      flash[:error_delete] = "Vendedor no se pudo eliminar."
      redirect_to vendors_path
    end
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :email)
  end

  def active_vendors
    @vendors = current_user.vendors.where(archived: false)
  end
end
