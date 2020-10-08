class ArtworkSharesController < ApplicationController 

    def create
        artwork = ArtworkShare.new(artwork_share_params)
        if artwork.save 
            render json: artwork
        else 
            render json: artwork.errors.full_messages, status:422
        end
    end

    def destroy
        share = ArtworkShare.find(params[:id])
        share.destroy 
        render json: share
        # redirect_to artwork_shares_url
    end

    private 
    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end


end