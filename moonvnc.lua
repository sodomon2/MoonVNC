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

Gvnc 	= GtkVnc.Display()
vnc 	= require('src.moonvnc-vnc')
app		= Gtk.Application()

-- MoonVNC
require('src.moonvnc-app')

app:run()
