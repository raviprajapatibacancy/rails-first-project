class PhsiciansController < ApplicationController
  before_action :set_phsician, only: %i[ show edit update destroy ]
  layout 'custom'

  # GET /phsicians or /phsicians.json
  def index
    @phsicians = Phsician.all
  end

  # GET /phsicians/1 or /phsicians/1.json
  def show
  end

  # GET /phsicians/new
  def new
    @phsician = Phsician.new
  end

  # GET /phsicians/1/edit
  def edit
  end

  # POST /phsicians or /phsicians.json
  def create
    @phsician = Phsician.new(phsician_params)
    @phsician.unique_id = 7.times.map { rand(1..9) }.join.to_i;

    respond_to do |format|
      if @phsician.save
        format.html { redirect_to phsician_url(@phsician), notice: "Phsician was successfully created." }
        format.json { render :show, status: :created, location: @phsician }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phsician.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phsicians/1 or /phsicians/1.json
  def update
    respond_to do |format|
      if @phsician.update(phsician_params)
        format.html { redirect_to phsician_url(@phsician), notice: "Phsician was successfully updated." }
        format.json { render :show, status: :ok, location: @phsician }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phsician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phsicians/1 or /phsicians/1.json
  def destroy
    @phsician.destroy

    respond_to do |format|
      format.html { redirect_to phsicians_url, notice: "Phsician was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phsician
      @phsician = Phsician.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phsician_params
      params.require(:phsician).permit(:name, :email, :unique_id)
    end
end
