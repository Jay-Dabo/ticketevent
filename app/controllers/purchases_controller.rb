class PurchasesController < ApplicationController
  before_action :find_ticket

  def create
    if already_bought?
      flash[:notice] = "Already sold!"
    else
      @ticket.create_purchase(user_id: current_user.id)
      flash[:notice] = "Ticket successfully purchased!"
    end
    redirect_to ticket_path(@ticket)    
  end

  private

  def find_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def already_bought?
    Purchase.where(ticket_id: params["ticket_id"]).exists?
  end
end
