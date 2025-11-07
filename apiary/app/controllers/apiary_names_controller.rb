class ApiaryNamesController < ApplicationController
  before_action :set_apiary_name, only: %i[ show edit update destroy ]

  # GET /apiary_names or /apiary_names.json
  def index
    @apiary_names = ApiaryName.all
  end

  # GET /apiary_names/1 or /apiary_names/1.json
  def show
  end

  # GET /apiary_names/new
  def new
    @apiary_name = ApiaryName.new
  end

  # GET /apiary_names/1/edit
  def edit
  end

  # POST /apiary_names or /apiary_names.json
  def create
    @apiary_name = ApiaryName.new(apiary_name_params)

    respond_to do |format|
      if @apiary_name.save
        format.html { redirect_to @apiary_name, notice: "Apiary name was successfully created." }
        format.json { render :show, status: :created, location: @apiary_name }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apiary_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apiary_names/1 or /apiary_names/1.json
  def update
    respond_to do |format|
      if @apiary_name.update(apiary_name_params)
        format.html { redirect_to @apiary_name, notice: "Apiary name was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @apiary_name }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @apiary_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apiary_names/1 or /apiary_names/1.json
  def destroy
    @apiary_name.destroy!

    respond_to do |format|
      format.html { redirect_to apiary_names_path, notice: "Apiary name was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apiary_name
      @apiary_name = ApiaryName.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def apiary_name_params
      params.expect(apiary_name: [ :name ])
    end
end
