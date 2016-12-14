class AppointsController < ApplicationController
  before_action :set_appoint, only: [:show, :edit, :update, :destroy]

  # GET /appoints
  # GET /appoints.json
  def index
    if(current_user!="Member")
      @appoints=Appoint.all.order(start_time: :desc)
      if params[:room_id]
      @appoints=Appoint.where( :room_id=>params[:room_id]).order(start_time: :desc)
      end
    end
    if params[:room_id]
      @appoints=Appoint.where( :room_id=>params[:room_id]).order(start_time: :desc)
    end
    if params[:user_id]
        @appoints=Appoint.where( :user_id=>params[:user_id]).order(start_time: :desc)
    end
    #respond_to do |format|
    #  format.html # list.html.erb      format.json { render json: @appoints }
    #end
    end

  # GET /appoints/1
  # GET /appoints/1.json
  def show
    @appoint = Appoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appoint }
  end
  end

  # GET /appoints/new
  def new
    @appoint = Appoint.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appoint }
    end
    end

  # GET /appoints/1/change
  def edit
   @appoint =Appoint.find(params[:id])
    end


  # POST /appoints
  # POST /appoints.json
  def create
    @appoint = Appoint.new(appoint_params)
    @appoint.get_current= current_user.privilege
    if current_user.privilege=="Member"
      @appoint.user_id=current_user.id
    end
    #if params[:room_id]
    #  @appoint.room_id=params[:room_id]
    #end

    respond_to do |format|
      if @appoint.save
        format.html { redirect_to @appoint, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @appoint }
      else
        format.html { render :new }
        format.json { render json: @appoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appoints/1
  # PATCH/PUT /appoints/1.json
  def update
    @appoint = Appoint.find(params[:id])

    respond_to do |format|
      if @appoint.update(appoint_params)
        format.html { redirect_to @appoint, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @appoint }
      else
        format.html { render :edit }
        format.json { render json: @appoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appoints/1
  # DELETE /appoints/1.json
  def destroy
    @appoint = Appoint.find(params[:id])
    @appoint.destroy
    respond_to do |format|
      format.html { redirect_to appoints_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_appoint
    @appoint = Appoint.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def appoint_params
    params.require(:appoint).permit(:user_id, :start_time, :room_id, :end_time, :length)
  end
end