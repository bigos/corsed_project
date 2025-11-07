class SecondaryNamesController < ApplicationController
  before_action :set_secondary_name, only: %i[ show edit update destroy ]

  # GET /secondary_names or /secondary_names.json
  def index
    @secondary_names = SecondaryName.all
  end

  # GET /secondary_names/1 or /secondary_names/1.json
  def show
  end

  # GET /secondary_names/new
  def new
    @secondary_name = SecondaryName.new
  end

  # GET /secondary_names/1/edit
  def edit
  end

  # POST /secondary_names or /secondary_names.json
  def create
    @secondary_name = SecondaryName.new(secondary_name_params)

    respond_to do |format|
      if @secondary_name.save
        format.html { redirect_to @secondary_name, notice: "Secondary name was successfully created." }
        format.json { render :show, status: :created, location: @secondary_name }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @secondary_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secondary_names/1 or /secondary_names/1.json
  def update
    respond_to do |format|
      if @secondary_name.update(secondary_name_params)
        format.html { redirect_to @secondary_name, notice: "Secondary name was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @secondary_name }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @secondary_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secondary_names/1 or /secondary_names/1.json
  def destroy
    @secondary_name.destroy!

    respond_to do |format|
      format.html { redirect_to secondary_names_path, notice: "Secondary name was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secondary_name
      @secondary_name = SecondaryName.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def secondary_name_params
      params.expect(secondary_name: [ :name ])
    end
end
