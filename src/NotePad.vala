using Gtk;
using Gdk;
using Cairo;

public class NotePad : Gtk.DrawingArea
{
        private SvgSurface surface;

	public NotePad ()
	{
		/* Add events to listen to */
		add_events ( EventMask.POINTER_MOTION_MASK |
			     EventMask.BUTTON_PRESS_MASK   |
			     EventMask.BUTTON_RELEASE_MASK |
		             EventMask.TOUCH_MASK );
		
		/* US letter 8.5" x 11" @ 300pdi = 2550px x 3300px */
                this.surface = new SvgSurface ("img.svg", 255, 330);

                this.draw.connect (draw_from_surface);
	}

        public bool draw_from_surface (Context context)
        {
                context.set_source_surface (this.surface, 0, 0);
                context.paint ();
                return false;
        }

	public override bool button_press_event (EventButton event)
	{
                Context context = new Context (this.surface);
                context.set_source_rgba (1, 0, 0, 1);
                context.arc (event.x, event.y, 5, 0, 2 * Math.PI);
                context.stroke ();

                queue_draw ();

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
                //print ("Local  (x, y) = (%g, %g)\n", event.x, event.y); 
		//print ("Global (x, y) = (%g, %g)\n", event.x_root, event.y_root);
		weak Gdk.Device dev = event.get_device ();
		var tool = dev.tool;
		var tooltype = tool.get_tool_type ();	
		stdout.printf ("%d\n", tooltype);
		return false;
	}

	public override bool touch_event (Gdk.EventTouch event)
	{
		return false;
	}
}

