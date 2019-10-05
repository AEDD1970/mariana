class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :update, :destroy]

  # GET /responses
  def index

   
    @products = Product.all.select(:hour, :timezone) 
    #name of array data   
    render json: {data: @responses.as_json}

  end

  # GET /responses/1
  def show
    render json: @response
  end

  # POST /responses
  def create
    @response = Response.new(response_params)

    if @response.save
      render json: @response, status: :created, location: @response
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /responses/1
  def update
    if @response.update(response_params)
      render json: @response
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  # DELETE /responses/1
  def destroy
    @response.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def response_params
      params.require(:response).permit(:hour, :timezone)
    end
end