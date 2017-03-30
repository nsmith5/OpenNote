/* Copyright 2017 Nathan Smith
 * 
 * This file is part of OpenNote
 * 
 * OpenNote is free software: you can redistribute it
 * and/or modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * OpenNote is distributed in the hope that it will be
 * useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
 * Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with OpenNote. If not, see http://www.gnu.org/licenses/.
 */

using Gtk;

public class Application : Gtk.Window
{
	public Application ()
	{
		this.title = "OpenNote";
		this.destroy.connect (Gtk.main_quit);
		this.set_default_size (400, 400);

		var scrollwin = new ScrolledWindow (null, null);
		scrollwin.set_policy (PolicyType.ALWAYS, PolicyType.ALWAYS);
		scrollwin.kinetic_scrolling = true;

		var viewport = new Viewport (null, null);
		viewport.set_size_request (255, 300);
		scrollwin.add(viewport);

		var box = new Box (Orientation.VERTICAL, 0);
		var drawing_area = new NotePad ();
		box.pack_start (drawing_area);
		viewport.add(box);                

                var header = new HeaderBar ();
                header.title = "Opennote";
                header.show_close_button = true;
                
                this.set_titlebar (header);
		this.add (scrollwin);
	}

	public static int main (string[] args)
	{
		Gtk.init(ref args);
		var window = new Application ();
		window.show_all ();
		print ("New application made\n");

		Gtk.main();
		return 0;
	}
}

