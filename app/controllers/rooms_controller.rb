class RoomsController < ApplicationController

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all

    respond_to do |format|
      format.html # listhtml.erb
      format.json { render json: @rooms }
    end
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room= Room.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/change
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @room.vacant="Available"
    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'User was successfully created.' }
        format.json { render json: @room, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    @room = Room.find(params[:id])
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def result
    @number = params[:number].to_s
    @status = params[:status].to_s
    @size = params[:size].to_s
    @building = params[:building].to_s

=begin

    if(@number != nil)
      @condition = "number = #{@number}"
    end

    if(@status != "none")
      @condition = @condition + " and " + "vacant = #{@status}"
    end

    if(@size != "none")
      @condition = @condition + " and " + "size = #{@size}"
    end

    if(@building != "none")
      @condition = @condition + " and " + "building = #{@building}"
    end

    @results =  Room.where(@condition)

=end

    @results  = Room.all

    if(@number != "")
      @results = @results.select{|result| result.number == @number.to_i}
    end

    if(@status != "none")
      @results = @results.select{|result| result.vacant == @status}
    end

    if(@size != "none")
      @results = @results.select{|result| result.size == @size.to_i}
    end

    if(@building != "none")
      @results = @results.select{|result| result.building == @building}
    end

  end

  def view
    @room = Room.find(params[:id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
      @room = Room.find(params[:id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(:size, :number, :vacant, :building)
  end

end
