using Gtk;
using Gdk;

public class NotePad : Gtk.DrawingArea
{
	public NotePad ()
	{
		/* Add events to listen to */
		add_events ( EventMask.POINTER_MOTION_MASK |
			     EventMask.BUTTON_PRESS_MASK   |
			     EventMask.BUTTON_RELEASE_MASK |
		             EventMask.TOUCH_MASK );
	}

	public override bool draw (Cairo.Context cr)
	{
		int width = get_allocated_width ();
		int height = get_allocated_width ();

		// Drawing code here!

		return false;
	}

	public override bool button_press_event (EventButton event)
	{
		print ("Button pressed!\n");
		print ("Cursor position (%g, %g)\n", event.x, event.y);
		return false;
	}

	public override bool button_release_event (EventButton event)
	{
		print ("Button released!\n");
		print ("Cursor position (%g, %g)\n", event.x, event.y);
		return false;
	}

	public override bool motion_notify_event (Gdk.EventMotion event)
	{
		print ("x old = %g and x new is %g\n", event.x_root, event.x);

		return false;
	}

	public override bool touch_event (Gdk.EventTouch event)
	{
		return false;
	}
}
