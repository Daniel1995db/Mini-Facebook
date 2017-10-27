class FriendshipsController < ApplicationController
	before_action :set_friendship, only: [:show, :create, :destroy]
	before_action :authenticate_user!

	def index
		@friendships = Friendship.all
		@Users = User.all
  		if params[:search]
    		@Users = User.search(params[:search]).order("created_at DESC")
  		else
    		@Users = User.all.order('created_at DESC')
  		end
	end
 
	def show
	end

	def create
  		@friendship = Friendship.new(friendship_params)
  		@friendship.user_id = @current_user.id
	  	if @current_user.id == params[:user_id] && @friendship.save
	  		format.html { redirect_to @user, notice: 'Friendship Created' }
	        format.json { render :show, status: :ok, location: @user }
	  	else
	    	format.html { render :new }
	        format.json { render json: @friendship.errors, status: :unprocessable_entity }
	      end
		end
    end

	def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Friendship was successfully deleted.' }
      format.json { head :no_content }
    	end
  	end

   private

   def set_friendship
      @friendship = Friendship.find(params[:id])
    end

	def friendship_params
  		params.require(:friendship).permit(:amigo_id)
	end

# end



