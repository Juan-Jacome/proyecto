class FormulariosController < ApplicationController
  before_action :authenticate_userlog!
  before_action :set_formulario, only: %i[ show edit update destroy ]
  before_action :correct_userlog, only: [:edit, :update, :destroy]

  # GET /formularios or /formularios.json
  def index
    @formularios = Formulario.all
  end

  # GET /formularios/1 or /formularios/1.json
  def show
  end

  # GET /formularios/new
  def new
    #@formulario = Formulario.new
    @formulario = current_userlog.formularios.build
  end

  # GET /formularios/1/edit
  def edit
  end

  # POST /formularios or /formularios.json
  def create
    #@formulario = Formulario.new(formulario_params)
    @formulario = current_userlog.formularios.build(formulario_params)

    respond_to do |format|
      if @formulario.save
        format.html { redirect_to formulario_url(@formulario), notice: "Formulario was successfully created." }
        format.json { render :show, status: :created, location: @formulario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formularios/1 or /formularios/1.json
  def update
    respond_to do |format|
      if @formulario.update(formulario_params)
        format.html { redirect_to formulario_url(@formulario), notice: "Formulario was successfully updated." }
        format.json { render :show, status: :ok, location: @formulario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formularios/1 or /formularios/1.json
  def destroy
    @formulario.destroy

    respond_to do |format|
      format.html { redirect_to formularios_url, notice: "Formulario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_userlog
    @formulario = current_userlog.formularios.find_by(id: params[:id])
    redirect_to formularios_path, notice: "No estas autorzado a editar este formulario" if @formulario.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulario
      @formulario = Formulario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def formulario_params
      params.require(:formulario).permit(:nombre_drinker, :estatura_cm, :peso_kg, :genero, :horas_estadia, :perfil, :presupuesto, :userlog_id)
    end
end
