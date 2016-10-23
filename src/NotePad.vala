using Gtk;
using Gdk;

public class NotePad : Gtk.DrawingArea
{
	public NotePad ()
	{
		// Add events to listen to
		add_events ( Gdk.EventMask.POINTER_MOTION_MASK );
	}

	public override bool draw (Cairo.Context cr)
	{
		int width = get_allocated_width ();
		int height = get_allocated_width ();

		// Drawing code here!

		return false;
	}

	public override bool motion_notify_event (Gdk.EventMotion event)
	{
		weak Device device = event.get_device ();
		print ("Input device : %s\n", device.get_name()); 
		if (device.input_source == InputSource.PEN)
		{
			print("Hello!\n");
		}
		return false;
	}
}
