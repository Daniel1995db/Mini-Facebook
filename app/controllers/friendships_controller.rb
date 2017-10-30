class FriendshipsController < ApplicationController
	before_action :set_friendship, only: [:show, :create, :destroy]
	before_action :authenticate_user!

	def index
		@friendships = current_user.amigos
    @user = User.find(params[:user_id])
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
  		@friendship = Friendship.new(amigo_id: params[:user_id])
  		@friendship.user_id = current_user.id
      p "FRIENDS!!", @friendship
      respond_to do |format|
  	  	if current_user.id != params[:user_id] && @friendship.save
  	  		format.html { redirect_to users_path, notice: 'Friendship Created' }
  	        format.json { render :show, status: :ok, location: @user }
  	  	else
  	    	format.html { redirect_back(fallback_location: :root) }
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

    def friends
      friendships.map{|friendship| friendship.reversable_friendships}
    end


   private

   def set_friendship
      @friendship = Friendship.find_by(id: params[:id])
    end


	def friendship_params
  		params.require(:friendship).permit(:amigo_id)
	end

end



