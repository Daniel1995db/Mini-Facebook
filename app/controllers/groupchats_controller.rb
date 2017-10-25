class GroupchatsController < ApplicationController
  before_action :set_groupchat, only: [:show, :edit, :update, :destroy]

  # GET /groupchats
  # GET /groupchats.json
  def index
    @groupchats = Groupchat.all
  end

  # GET /groupchats/1
  # GET /groupchats/1.json
  def show
  end

  # GET /groupchats/new
  def new
    @groupchat = Groupchat.new
  end

  # GET /groupchats/1/edit
  def edit
  end

  # POST /groupchats
  # POST /groupchats.json
  def create
    @groupchat = Groupchat.new(groupchat_params)

    respond_to do |format|
      if @groupchat.save
        format.html { redirect_to @groupchat, notice: 'Groupchat was successfully created.' }
        format.json { render :show, status: :created, location: @groupchat }
      else
        format.html { render :new }
        format.json { render json: @groupchat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupchats/1
  # PATCH/PUT /groupchats/1.json
  def update
    respond_to do |format|
      if @groupchat.update(groupchat_params)
        format.html { redirect_to @groupchat, notice: 'Groupchat was successfully updated.' }
        format.json { render :show, status: :ok, location: @groupchat }
      else
        format.html { render :edit }
        format.json { render json: @groupchat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupchats/1
  # DELETE /groupchats/1.json
  def destroy
    @groupchat.destroy
    respond_to do |format|
      format.html { redirect_to groupchats_url, notice: 'Groupchat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupchat
      @groupchat = Groupchat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupchat_params
      params.require(:groupchat).permit(:group_id)
    end
end
