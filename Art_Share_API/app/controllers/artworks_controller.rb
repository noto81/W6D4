class ArtworksController < ApplicationController


    #/users/:user_id/artworks
    def index
        params[:id]
        users= User.find(params[:user_id]) 
        render json: users.artworks
      #  render json: users.artwork_shares
    end 

    def create #create ...follow class[...]
        #debugger
        x = Artwork.new(artworks_params)
        if x.save #want to return false
            render json: x
        else 
            render json: x.errors.full_messages, status:422
        end 
    end

    def show
        artwork = Artwork.find(params[:id]) #only need id dont need top level id
        render json: artwork
        #:id is wild card and points to
    end

    def update
        artwork = Artwork.find(params[:id]) #only need id dont need top level id
        if artwork.update(artworks_params) #AR update method that acts on instance
          redirect_to artwork_url(artwork)  #redirect to show
        else
          render json: artwork.errors.full_messeges, status: :unprocessable_entity #meessage for error
        end
    end

    def destroy
        artwork = Artwork.find(params[:id]) #only need id dont need top level id
        artwork.destroy 
        redirect_to artworks_url #do not need to pass arg because its not looking for :id wildcard
        #does .all and shows whats still there
    end 

    private 

    def artworks_params 
        # debugger
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end


end