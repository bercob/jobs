class OffersController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :set_codelists, only: [:new, :edit, :create, :update]

  # GET /offers
  # GET /offers.json
  def index
    Import::Profesia.new.import!
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)
    @offer.offer_source = OfferSource.find_by(name: 'local')
    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    def set_codelists
      @offercategories = Offercategory.order('name asc').all
      @jobtypes = Jobtype.order('name asc').all
      @offerregions = Offerregion.order('name asc').all
      @offerpositions = Offerposition.order('name asc').all
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:external_offer_id, :offerdate, :position, :location, :content, :url, :company, :ico, { :offercategory_ids => [] }, { :jobtype_ids => [] }, { :offerposition_ids => [] }, { :offerregion_ids => [] })
    end
end
