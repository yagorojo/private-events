class AddReferencesToAttendance < ActiveRecord::Migration[7.0]
  def change
    add_reference :attendances, :attendee
    add_reference :attendances, :attendend_event
  end
end
