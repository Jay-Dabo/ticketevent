class PurchaseController < ApplicationController
  before_action :find_ticket

  def create
    if already_bought?
      flash[:notice] = "Already sold!"
    else
      @ticket.purchases.create(user_id: current_user.id)
    end
    redirect_to event_path(@event)
  end

  private

  def find_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def already_bought?
    Purchase.where(ticket_id: params["ticket_id"]).exists?
  end
end