class UsersController < ApplicationController
  before_action :set_user, only: [:show, :change, :update, :destroy]

  # GET /users
  # GET /users.json
  def list
    access
      @users = User.all #.find_by!(privilege: 'Member')
  end
  def index
    access
    @users = User.all #.find_by!(privilege: 'Member')
  end
  # GET /users/1
  # GET /users/1.json
  def show
    @user= User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  def new
    access
    @user = User.new
  end

  # GET /users/1/change
  def change
    access
    @user = User.find(params[:id])
    rights(@user)
  end

  def view
    render(:action => 'users/view')
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_list_path, notice: 'User was successfully created.' }
        format.json { render user_list_path, status: :created, location: @user }
      else
        format.html { redirect_to user_list_path, notice: 'User creation fails.'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_list_path, notice: 'User was successfully updated.' }
        format.json { render user_list_path, status: :ok, location: @user }
      else
        format.html { render :change }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to user_list_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :privilege,:name, )
    end

end
