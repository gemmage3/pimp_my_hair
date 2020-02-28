class PurchasesController < ApplicationController
  def index
  end

  def create
    @purchase = Purchase.new(purchases_params)
    @purchase.user = current_user
    set_hair
    authorize @hair
    if @hair.save
      redirect_to hairs_path
    else
      render :new
    end
  end

  def new
    @purchase = Purchase.new
    authorize @purchase
  end

  def show
  end

  private
  def purchases_params
    params.require(:purchase).permit(:comment)
  end

  def set_hair
    @purchase.hair = Hair.find(params[:id])
    authorize @hair
  end
end
