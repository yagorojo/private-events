class RemoveAttendedEventFromAttendance < ActiveRecord::Migration[7.0]
  def change
    remove_reference :attendances, :attendend_event
    add_reference :attendances, :attended_event
  end
end
