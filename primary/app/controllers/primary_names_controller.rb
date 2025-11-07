class PrimaryNamesController < ApplicationController
  before_action :set_primary_name, only: %i[ show edit update destroy ]

  # GET /primary_names or /primary_names.json
  def index
    @primary_names = PrimaryName.all
  end

  # GET /primary_names/1 or /primary_names/1.json
  def show
  end

  # GET /primary_names/new
  def new
    @primary_name = PrimaryName.new
  end

  # GET /primary_names/1/edit
  def edit
  end

  # POST /primary_names or /primary_names.json
  def create
    @primary_name = PrimaryName.new(primary_name_params)

    respond_to do |format|
      if @primary_name.save
        format.html { redirect_to @primary_name, notice: "Primary name was successfully created." }
        format.json { render :show, status: :created, location: @primary_name }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @primary_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /primary_names/1 or /primary_names/1.json
  def update
    respond_to do |format|
      if @primary_name.update(primary_name_params)
        format.html { redirect_to @primary_name, notice: "Primary name was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @primary_name }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @primary_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /primary_names/1 or /primary_names/1.json
  def destroy
    @primary_name.destroy!

    respond_to do |format|
      format.html { redirect_to primary_names_path, notice: "Primary name was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_primary_name
      @primary_name = PrimaryName.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def primary_name_params
      params.expect(primary_name: [ :name ])
    end
end
