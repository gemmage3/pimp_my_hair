class PurchasesController < ApplicationController
  def index
  end

  def create
    @purchase = Purchase.new(purchases_params)
    @purchase.user = current_user
    @hair = Hair.find(params[:hair_id])
    @purchase.hair = @hair
    authorize @purchase
    if @purchase.save
      redirect_to purchase_path(@purchase.id)
    else
      edirect_to purchase_path(@purchase.id)
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
    authorize @purchase
  end

  private
  def purchases_params
    params.require(:purchase).permit(:comment)
  end
end
