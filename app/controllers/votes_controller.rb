class VotesController < ApplicationController

  def create
    # @proposal = Proposal.find(params[:id])
    # @vote = current_user.votes(proposal: @proposal)
    

    if @vote.save
      # alors afficher l'icone sur la question et incrémenter score
    else
      # render
    end
  end
end
