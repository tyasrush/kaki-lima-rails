class KakiLimasController < ApplicationController
  before_action :set_kaki_lima, only: [:show, :edit, :update, :destroy]

  def newImport
  end

  def saveImport
    KakiLima.import_file(params[:file])
    redirect_to kaki_limas_path, notice: "Data imported."
  end

  def search
    # @kaki_limas = KakiLima.search(params[:query])
    # render json: @kaki_limas
    # respond_to do |format|
    #   format.json { render json: @kaki_limas }
    # end
  end

  # GET /kaki_limas
  # GET /kaki_limas.json
  def index
    @kaki_limas = KakiLima.all
  end

  # GET /kaki_limas/1
  # GET /kaki_limas/1.json
  def show
  end

  # GET /kaki_limas/new
  def new
    @kaki_lima = KakiLima.new
  end

  # GET /kaki_limas/1/edit
  def edit
  end

  # POST /kaki_limas
  # POST /kaki_limas.json
  def create
    @kaki_lima = KakiLima.new(kaki_lima_params)

    respond_to do |format|
      if @kaki_lima.save
        format.html { redirect_to @kaki_lima, notice: 'Kaki lima was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /kaki_limas/1
  # PATCH/PUT /kaki_limas/1.json
  def update
    respond_to do |format|
      if @kaki_lima.update(kaki_lima_params)
        format.html { redirect_to @kaki_lima, notice: 'Kaki lima was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /kaki_limas/1
  # DELETE /kaki_limas/1.json
  def destroy
    @kaki_lima.destroy
    respond_to do |format|
      format.html { redirect_to kaki_limas_url, notice: 'Kaki lima was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kaki_lima
      @kaki_lima = KakiLima.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kaki_lima_params
      params.require(:kaki_lima).permit(:nama, :lokasi, :kabupaten, :kecamatan, :kelurahan, :alamat, :lat, :lng, :phone, :open, :closed)
    end
end
