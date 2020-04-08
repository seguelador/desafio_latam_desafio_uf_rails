class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :update, :destroy]

  # GET /units/:date
  def date
    user = request.headers['X-Cliente']
    result = Unit.get_uf_value_by_date(params[:date])
    
    if (result[:code] == 200)
      response = { 
        valor_uf: result[:response],
        fecha: params[:date],
        cliente: user
      }
      # Save the request
      Request.create(user: user)
    else
      response = { 
        code: result[:code],
        message: 'Ha ocurrido un error'
      }
    end
    
    render json: response
  end

  # GET /units
  def index
    @units = Unit.all

    render json: @units
  end

  # GET /units/1
  def show
    render json: @unit
  end

  # POST /units
  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      render json: @unit, status: :created, location: @unit
    else
      render json: @unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /units/1
  def update
    if @unit.update(unit_params)
      render json: @unit
    else
      render json: @unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /units/1
  def destroy
    @unit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def unit_params
      params.fetch(:unit, {})
    end
end
