class PercentCatalogsController < ApplicationController
  def new
    @percent_catalog = PercentCatalog.new
  end

  def create
    @percent_catalog = PercentCatalog.new(percent_catalog_params)
    if @percent_catalog.save && is_admin?
      flash[:catalog_created] = "Porcentaje creado."
      redirect_to percent_catalog_path(@percent_catalog.id)
    else
      flash[:catalog_failed] = "Porcentaje no pudo ser creado."
      redirect_to new_percent_catalog_path
    end
  end

  def show
    @percent_catalog = PercentCatalog.find(params[:id])
  end

  def index
    @percent_catalogs = PercentCatalog.all
  end

  def percent_catalog_params
    params.require(:percent_catalog).permit(:percent)
  end
end
