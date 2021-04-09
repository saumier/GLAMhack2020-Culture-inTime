class ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :edit, :update, :destroy]

  # GET /productions
  # GET /productions.json
  def index
    @productions = Production.all
  end

  # GET /productions/1
  # GET /productions/1.json
  def show
    @performances_client ||= LoadPerformances.new
    @performance_dates = []
    @performance_urls = []
    @performance_tickets = []

    return unless @production.country == 'Canada'

    data = @performances_client.canada(@production.production_uri)
    @performance_dates = data.map { |performance| performance['startDate']['value'] }
                             .uniq
                             .reject(&:blank?)
                             .sort
    @performance_urls = data.map { |performance| performance.dig('webpage', 'value') }
                            .uniq
                            .reject(&:blank?)
    @performance_tickets = data.map { |performance| performance.dig('offer_url', 'value') }
                               .uniq
                               .reject(&:blank?)
  end

  # GET /productions/new
  def new
    @production = Production.new
  end

  # GET /productions/1/edit
  def edit
  end

  # POST /productions
  # POST /productions.json
  def create
    @production = Production.new(production_params)

    respond_to do |format|
      if @production.save
        format.html { redirect_to @production, notice: 'Production was successfully created.' }
        format.json { render :show, status: :created, location: @production }
      else
        format.html { render :new }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productions/1
  # PATCH/PUT /productions/1.json
  def update
    respond_to do |format|
      if @production.update(production_params)
        format.html { redirect_to @production, notice: 'Production was successfully updated.' }
        format.json { render :show, status: :ok, location: @production }
      else
        format.html { render :edit }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productions/1
  # DELETE /productions/1.json
  def destroy
    @production.destroy
    respond_to do |format|
      format.html { redirect_to productions_url, notice: 'Production was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production
      @production = Production.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def production_params
      params.require(:production).permit(:data_source_id, :label, :location_label, :location_uri, :date_of_first_performance, :production_company_uri, :production_company_label, :description, :main_image)
    end
end
