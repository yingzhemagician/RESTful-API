class Api::V1::GasstationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  # GET /gasstations
  def index
    @gasstations = Gasstation.all
    render json: @gasstations
  end

  # GET /gasstations/1
  def show
    @gasstation = Gasstation.find(params[:id]) 
    render json: @gasstation
  end


  # POST /gasstations
  def create
    @gasstation = Gasstation.new(gasstation_params)

    if @gasstation.save
      render json: @gasstation, status: :created, location: api_v1_gasstation_url(@gasstation)
    else
      render json: @gasstation.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /gasstations/1
  def update
    @gasstation = Gasstation.find(params[:id])
    if @gasstation.update(gasstation_params)
      render json: @gasstation
    else
      render json: @gasstation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gasstations/1
  def destroy
    @gasstation = Gasstation.find(params[:id])
    @gasstation.destroy
  end

  # GET /gasstations/cheapest
  def get_cheapest(offset=0.5)

    cur_lat = params[:lat].to_f
    cur_lng = params[:lng].to_f
    lowest_price = 10
    station_id = 0

    gasstations = Gasstation.all

    gasstations.each do |gasstation|
      if  cur_lat - offset <= gasstation.latitudes and gasstation.latitudes <= cur_lat + offset and cur_lng - offset <= gasstation.longitudes and gasstation.longitudes <= cur_lng + offset
        p gasstation
        if gasstation.prices < lowest_price
          lowest_price = gasstation.prices
          station_id = gasstation.id
        end
      end
    end

    if lowest_price == 10
      get_cheapest(offset + 0.5)
    else
      @gasstation = Gasstation.find(station_id)
      render json: @gasstation
    end
  end

  private
  # Only allow a trusted parameter “white list” through.
  def gasstation_params
    p params
    params.require(:gasstation).permit(:prices, :latitudes, :longitudes)
  end
end
