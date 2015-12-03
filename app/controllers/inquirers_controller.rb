class InquirersController < ApplicationController
  before_action :set_inquirer, only: [:show, :edit, :update, :destroy]
  before_filter :zero_inquirers_or_authenticated, only: [:new, :create]
  before_filter :require_login, except: [:new, :create]

  def zero_inquirers_or_authenticated
    unless Inquirer.count == 0 || current_user
      redirect_to root_path
      return false
    end
  end

  # GET /inquirers
  # GET /inquirers.json
  def index
    @inquirers = Inquirer.all
  end

  # GET /inquirers/1
  # GET /inquirers/1.json
  def show
  end

  # GET /inquirers/new
  def new
    @inquirer = Inquirer.new
  end

  # GET /inquirers/1/edit
  def edit
  end

  # POST /inquirers
  # POST /inquirers.json
  def create
    @inquirer = Inquirer.new(inquirer_params)

    respond_to do |format|
      if @inquirer.save
        format.html { redirect_to @inquirer, notice: 'Inquirer was successfully created.' }
        format.json { render :show, status: :created, location: @inquirer }
      else
        format.html { render :new }
        format.json { render json: @inquirer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inquirers/1
  # PATCH/PUT /inquirers/1.json
  def update
    respond_to do |format|
      if @inquirer.update(inquirer_params)
        format.html { redirect_to @inquirer, notice: 'Inquirer was successfully updated.' }
        format.json { render :show, status: :ok, location: @inquirer }
      else
        format.html { render :edit }
        format.json { render json: @inquirer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inquirers/1
  # DELETE /inquirers/1.json
  def destroy
    @inquirer.destroy
    respond_to do |format|
      format.html { redirect_to inquirers_url, notice: 'Inquirer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquirer
      @inquirer = Inquirer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquirer_params
      params.require(:inquirer).permit(:username, :email, :password, :password_confirmation)
    end
end
