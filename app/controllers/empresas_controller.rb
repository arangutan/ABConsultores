class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!

  # GET /empresas
  # GET /empresas.json
  def index
    @empresas = Empresa.all
    respond_to do |format|
      format.html
      format.pdf  do
        pdf = EmpresasPdf.new(@empresas, current_user)
        send_data pdf.render, filename: "prueba.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /empresas/1
  # GET /empresas/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf  do
        pdf = EmpresaPdf.new(@empresa, current_user)
        send_data pdf.render, filename: "prueba.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas
  # POST /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to empresas_url, notice: 'La empresa fue creada satisfactoriamente.' }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresas/1
  # PATCH/PUT /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to empresas_url, notice: 'La empresa se actualizo satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.json
  def destroy
    @empresa.destroy
    respond_to do |format|
      format.html { redirect_to empresas_url, notice: 'La empresa se elimino satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresa_params
      params.require(:empresa).permit(:nombre_comercial, :razon_social, :nit, :representante_legal, :nombre_contacto, :email_contacto, :telefono_contacto, :direccion_contacto, :ciudad, :pais, :pagina_web, :imagen, :habilidato)
    end
end
