class CoctelsController < ApplicationController
  before_action :authenticate_userlog!
  before_action :set_coctel, only: %i[ show edit update destroy ]

  

  # GET /coctels or /coctels.json
  def index
    @coctels = Coctel.all

    if params[:min_price].present?
      @coctels = @coctels.where("precio >= ?", params[:min_price])
    end
    
  end

  # GET /coctels/1 or /coctels/1.json
  def show
    @menores = Coctel.find_by("precio <= '10'")
  end

  # GET /coctels/new
  def new
    @coctel = Coctel.new
    @liquors = Liquor.all
  end

  # GET /coctels/1/edit
  def edit
    @liquors = Liquor.all
  end

  # POST /coctels or /coctels.json
  def create
    @coctel = Coctel.new(coctel_params)
    @liquors = Liquor.all
    @coctel.save_liquors
    

    respond_to do |format|
      if @coctel.save
        format.html { redirect_to coctel_url(@coctel), notice: "Coctel was successfully created." }
        format.json { render :show, status: :created, location: @coctel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coctel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coctels/1 or /coctels/1.json
  def update
    
    respond_to do |format|
      if @coctel.update(coctel_params)
        format.html { redirect_to coctel_url(@coctel), notice: "Coctel was successfully updated." }
        format.json { render :show, status: :ok, location: @coctel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coctel.errors, status: :unprocessable_entity }
      end
    end
    @coctel.save_liquors
  end

  # DELETE /coctels/1 or /coctels/1.json
  def destroy  
    @coctel.save_liquors
    @coctel.destroy

    respond_to do |format|
      format.html { redirect_to coctels_url, notice: "Coctel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coctel
      @coctel = Coctel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coctel_params
      params.require(:coctel).permit(:nombre_coctel, :gramos_alcohol, :precio, liquor_principal: [])
    end


end
