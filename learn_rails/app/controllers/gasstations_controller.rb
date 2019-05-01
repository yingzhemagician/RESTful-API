class GasstationsController < ApplicationController
  before_action :set_gasstation, only: [:show, :edit, :update, :destroy]

  # GET /gasstations
  # GET /gasstations.json
  def index
    @gasstations = Gasstation.all
  end

  # GET /gasstations/1
  # GET /gasstations/1.json
  def show
  end

  # GET /gasstations/new
  def new
    @gasstation = Gasstation.new
  end

  # GET /gasstations/1/edit
  def edit
  end

  # POST /gasstations
  # POST /gasstations.json
  def create
    @gasstation = Gasstation.new(gasstation_params)

    respond_to do |format|
      if @gasstation.save
        format.html { redirect_to @gasstation, notice: 'Gasstation was successfully created.' }
        format.json { render :show, status: :created, location: @gasstation }
      else
        format.html { render :new }
        format.json { render json: @gasstation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gasstations/1
  # PATCH/PUT /gasstations/1.json
  def update
    respond_to do |format|
      if @gasstation.update(gasstation_params)
        format.html { redirect_to @gasstation, notice: 'Gasstation was successfully updated.' }
        format.json { render :show, status: :ok, location: @gasstation }
      else
        format.html { render :edit }
        format.json { render json: @gasstation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gasstations/1
  # DELETE /gasstations/1.json
  def destroy
    @gasstation.destroy
    respond_to do |format|
      format.html { redirect_to gasstations_url, notice: 'Gasstation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gasstation
      @gasstation = Gasstation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gasstation_params
      params.require(:gasstation).permit(:prices, :latitudes, :longitudes, :user_id)
    end
end
