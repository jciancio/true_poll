class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update, :destroy]
  before_action :set_bill, only: [:index, :create]

  # GET /votes
  def index
    @votes = Vote.all

    render json: @votes
  end

  # POST /votes
  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      @vote.bill.calculate_votes
      render json: @vote.bill, status: :created, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /votes/1
  def destroy
    @vote.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    def set_bill
      @bill = Bill.find(params[:bill_id])
    end

    # Only allow a trusted parameter "white list" through.
    def vote_params
      params.require(:vote).permit(:bill_id, :position)
    end
end
