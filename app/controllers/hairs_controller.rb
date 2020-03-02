class HairsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :edit, :update]
  before_action :set_hair, only: [:show, :edit, :update, :destroy]

  def index
    @purchases = policy_scope(Purchase)
    @hairs = policy_scope(Hair)
    @unsold_hairs = []

    @hairs.each do |hair|
      @unsold_hairs << hair if !hair.sold
    end
    @unsold_hairs

    if params[:search]
      filtering_hair
      execute_filter(filtering_hair)
      if none_filter
        @unsold_hairs = Hair.all
      end
    end
  end

  def new
    @hair = Hair.new
    authorize @hair
  end

  def create
    @hair = Hair.new(hairs_params)
    @hair.user = current_user
    authorize @hair
    if @hair.save
      redirect_to hairs_path
    else
      render :new
    end
  end

  def show
    @hair = Hair.find(params[:id])
    authorize @hair
    @purchase = Purchase.new
    authorize @purchase
  end

  def edit
    @hair = Hair.find(params[:id])
  end

  def update
    @hair.update(hairs_params)
    if @hair.save
      redirect_to my_hair_hairs_path
    else
      render :edit
    end
  end

  def destroy
    @hair.destroy
    redirect_to hairs_path
  end

  def my_hair
    @hairs = current_user.hairs
    authorize @hairs
  end

   private

  def hairs_params
    params.require(:hair).permit(:ethnicity, :weight_grams, :length_cm, :price, :hair_type, :colour, photos: [])
  end

  def set_hair
    @hair = Hair.find(params[:id])
    authorize @hair
  end

  def filtering_hair
    @hair_type_filter = params[:search][:hair_type]
    @hair_colour_filter = params[:search][:colour]
    @hair_ethnicity_filter = params[:search][:ethnicity]
  end

  def execute_filter(filter_option)
      if !@hair_type_filter.empty?
        @unsold_hairs = @unsold_hairs.select do |hair|
          hair.hair_type == @hair_type_filter
        end
      end

      if !@hair_colour_filter.empty?
        @unsold_hairs = @unsold_hairs.select do |hair|
          hair.colour == @hair_colour_filter
        end
      end

      if !@hair_ethnicity_filter.empty?
        @unsold_hairs = @unsold_hairs.select do |hair|
          hair.ethnicity == @hair_ethnicity_filter
        end
      end
  end

  def none_filter
    !@hair_type_filter && !@hair_colour_filter && !@hair_ethnicity_filter
  end

end
