#!/usr/bin/env lua

--[[--
 @package   MoonVNC
 @filename  moonvnc.lua
 @version   1.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      01.03.2022 06:01:05 -04
--]]

lgi		= require("lgi")
Gtk		= lgi.require('Gtk', '3.0')
Gdk		= lgi.require('Gdk', '3.0')
GtkVnc	= lgi.require('GtkVnc', '2.0')
GLib	= lgi.require('GLib', '2.0')
Gio		= lgi.require('Gio', '2.0')

vnc 	= GtkVnc.Display()
builder = Gtk.Builder()

assert  = lgi.assert

assert(builder:add_from_file('moonvnc.ui'))
ui = builder.objects

-- MoonVNC
require('src.moonvnc-app')

ui.main_window:show_all({ ui.box:add(vnc) })
Gtk.main()
