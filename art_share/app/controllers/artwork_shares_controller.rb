class ArtworkSharesController < ApplicationController
  def index
    artwork_shares = ArtworkShare.all
    render json: artwork_shares
  end

  def create
    share = ArtworkShare.new(share_params)
    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    share = ArtworkShare.find(params[:id])
    share.destroy
    render json: share
    redirect_to shares_url
  end

  private

  def share_params
    params[:share].permit(:viewer_id, :artwork_id)
  end
end
