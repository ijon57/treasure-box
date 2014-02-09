class TreasuresController < ApplicationController

  before_filter :find_treasure, only: [:edit, :show]

  def new
    @treasure = Treasure.new
  end

  def create
    @treasure = current_user.treasures.build(params[:treasure])

    if @treasure.save
      redirect_to @treasure
    else
      render :new, alert: "Invalid treasure"
    end
  end

  private

  def find_treasure
    @treasure = Treasure.find(params[:id])
  end
end
