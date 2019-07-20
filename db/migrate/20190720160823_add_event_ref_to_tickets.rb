class AddEventRefToTickets < ActiveRecord::Migration[5.2]
  def change
    add_reference(:tickets, :event, index: { name: "index_tickets_on_event_id" })
  end
end
