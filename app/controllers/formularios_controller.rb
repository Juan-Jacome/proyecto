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

    @observar = Formulario.joins(:liquors).find_by(liquors: {marca: 'Absolut'})
    @observar = @observar.peso_kg


    @prueba = Formulario.joins(:liquors).where("liquors.grados_alcohol > ?", 30).pluck(:nombre_drinker)

    @alcohol_tomado = 14

    #@nivel_alcohol: 0.08 0.2 0.4
    @nivel_alcohol = 0.08

  
    

    #Perfiles drinker
    if @formulario.perfil == "Conductor"
      @perfil_tomador = Liquor.find_by("grados_alcohol <= 29 ")
      @perfil_tomador = @perfil_tomador.nombre_licor
      @nivel_alcohol = 0.8
    elsif @formulario.perfil == "Moderado"
      @perfil_tomador = Liquor.find_by("grados_alcohol < 39 AND grados_alcohol > 30")
      @perfil_tomador = @perfil_tomador.nombre_licor
      @nivel_alcohol = 0.4
    else
      @perfil_tomador = Liquor.find_by("grados_alcohol > 39")
      @perfil_tomador = @perfil_tomador.nombre_licor
      @nivel_alcohol = 0.2
    end


    #Formula Widemark
    if @formulario.genero == "Masculino"
      #@wid = ((@alcohol_tomado/((@formulario.peso_kg*1000) * 0.68)) * 100) - (@formulario.horas_estadia * 0.015)
      @wid = (((@formulario.peso_kg)*0.68*0.1)/(@nivel_alcohol)) + (@formulario.horas_estadia * 0.015)
      @wid = @wid.to_i
    else
      #@wid = ((@alcohol_tomado/((@formulario.peso_kg*1000) * 0.55)) * 100) - (@formulario.horas_estadia * 0.015)
      @wid = (((@formulario.peso_kg)*0.55*0.1)/@nivel_alcohol) + (@formulario.horas_estadia * 0.015)
      @wid = @wid.to_i
    end

    @mostrar = @formulario.liquor_favorito

    
  end

  # GET /formularios/new
  def new
    #@formulario = Formulario.new
    @formulario = current_userlog.formularios.build
    @liquors = Liquor.all
  end

  # GET /formularios/1/edit
  def edit
    @liquors = Liquor.all
  end

  # POST /formularios or /formularios.json
  def create
    #@formulario = Formulario.new(formulario_params)
    @formulario = current_userlog.formularios.build(formulario_params)
    @liquors = Liquor.all
    @formulario.save_liquorsfavs

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
    @formulario.save_liquorsfavs
  end

  # DELETE /formularios/1 or /formularios/1.json
  def destroy
    @formulario.save_liquorsfavs
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
      params.require(:formulario).permit(:nombre_drinker, :estatura_cm, :peso_kg, :genero, :horas_estadia, :perfil, :presupuesto, :userlog_id, liquor_favorito: [])
    end
end
