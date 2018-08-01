class GossipsController < ApplicationController
	def new
		@gossip = Gossip.new
	end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:gossip_title, :gossip_content)
    @gossip.update(gossip_params)
    redirect_to gossip_path
  end

	def create
		@gossip = Gossip.create(gossip_params)
		redirect_to gossip_path(@gossip.id)
  end

  def show
      @gossip = Gossip.find(params[:id])	
  end

  private

  def gossip_params
    params.require(:gossip).permit(:gossip_title, :gossip_content, :anonymous_gossiper)
  end
end
