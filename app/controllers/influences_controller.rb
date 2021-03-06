class InfluencesController < ApplicationController
  before_action :set_influence, only: [:show, :edit, :update, :destroy]

  # GET /influences
  # GET /influences.json
  def index
    @influences = Influence.all
  end

  # GET /influences/1
  # GET /influences/1.json
  def show
  end

  # GET /influences/new
  def new
    @influence = Influence.new
  end

  # GET /influences/1/edit
  def edit
  end

  # POST /influences
  # POST /influences.json
  def create
    @influence = Influence.new(influence_params)

    respond_to do |format|
      if @influence.save
        format.html { redirect_to @influence, notice: 'Influence was successfully created.' }
        format.json { render :show, status: :created, location: @influence }
      else
        format.html { render :new }
        format.json { render json: @influence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /influences/1
  # PATCH/PUT /influences/1.json
  def update
    respond_to do |format|
      if @influence.update(influence_params)
        format.html { redirect_to @influence, notice: 'Influence was successfully updated.' }
        format.json { render :show, status: :ok, location: @influence }
      else
        format.html { render :edit }
        format.json { render json: @influence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /influences/1
  # DELETE /influences/1.json
  def destroy
    @influence.destroy
    respond_to do |format|
      format.html { redirect_to influences_url, notice: 'Influence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_influence
      @influence = Influence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def influence_params
      params.require(:influence).permit(:nombre)
    end
end
