class StakeholdersController < ApplicationController
  before_action :set_stakeholder, only: [:show, :edit, :update, :destroy,:clasificacion,:influencia, :influenciaview, :guardarinfluencia ,:relevancesuser]

  # GET /stakeholders
  # GET /stakeholders.json
  def index
    @stakeholders = current_user.empresa.stakeholders.all
  end

  # GET /stakeholders/1/relevances
  
  def relevancesuser
    @stakeholder.relevances
  end


  # GET /stakeholders/1
  # GET /stakeholders/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf  do
        pdf = StakeholderPdf.new(@stakeholder, current_user, :top_margin => 0)
        send_data pdf.render, filename: "prueba.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /stakeholders/new
  def new
    @stakeholder = Stakeholder.new
  end

  # GET /stakeholders/1/edit
  def edit
  end

  # POST /stakeholders
  # POST /stakeholders.json
  def create
    @stakeholder = Stakeholder.new(stakeholder_params)

    respond_to do |format|
      if @stakeholder.save
        format.html { redirect_to stakeholders_clasificacion_path(@stakeholder), notice: 'El stakeholder se creo correctamente' }
        format.json { render :show, status: :created, location: @stakeholder }
      else
        format.html { render :new }
        format.json { render json: @stakeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stakeholders/1
  # PATCH/PUT /stakeholders/1.json
  def update
    respond_to do |format|
      if @stakeholder.update(stakeholder_params)
        format.html { redirect_to stakeholders_clasificacion_path(@stakeholder), notice: 'El stakeholder se actualizo correctamente' }
        format.json { render :show, status: :ok, location: @stakeholder }
      else
        format.html { render :edit }
        format.json { render json: @stakeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  def clasificacion
    
  end

  def influencia
    respond_to do |format|
      if @stakeholder.update(stakeholder_params)
        format.html { redirect_to stakeholders_influenciaview_path(@stakeholder), notice: 'El stakeholder se actualizo correctamente' }
        format.json { render :show, status: :ok, location: @stakeholder }
      else
        format.html { render :edit }
        format.json { render json: @stakeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  def influenciaview

  end

  def guardarinfluencia
    

    #se eliminan para tener actualiazada su influencia    
    @stakeholder.relevancestakeholders.each do |re|
      re.destroy
    end

    @stakeholder.influencestakeholders.each do |re|
      re.destroy
    end

    #se agregan para tener actualiazada su influencia
    if params[:influences]
      params[:influences].each_key do |per|
         Influencestakeholder.create(stakeholder_id: @stakeholder.id,influence_id:per)
      end
    end

    if params[:relevances]
      params[:relevances].each_key do |per|
         Relevancestakeholder.create(stakeholder_id: @stakeholder.id,relevance_id:per)
      end
    end


    respond_to do |format|
      if @stakeholder.update(stakeholder_params)
        format.html { redirect_to stakeholders_path, notice: 'El stakeholder se actualizo correctamente' }
        format.json { render :show, status: :ok, location: @stakeholder }
      else
        format.html { render :edit }
        format.json { render json: @stakeholder.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /stakeholders/1
  # DELETE /stakeholders/1.json
  def destroy
    @stakeholder.destroy
    respond_to do |format|
      format.html { redirect_to stakeholders_url, notice: 'El stakeholder se elimino correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stakeholder
      @stakeholder = Stakeholder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stakeholder_params
      params.require(:stakeholder).permit(:imagen, :nombre, :apellido, :cargo, :movimiento_politico, :pais, :departamento, :ciudad, :impacto, :perfil, :disposicion, :expectativas, :dimension, :dependencia, :necesidades_logro, :necesidades_poder, :necesidades_afiliacion, :empresa_id ,:entidad, :entity_id)
    end
end
