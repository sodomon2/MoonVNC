--[[--
 @package   MoonVNC
 @filename  moonvnc-app.lua
 @version   1.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      01.03.2022 06:30:42 -04
--]]

local help =[[
MoonVNC usage:
		moonvnc [hostname] [port]

example:
		moonvnc localhost 5900
]]

main_window	= Gtk.Window {
	width_request	= 600,
	height_request	= 800,
	Gtk.Box {
		id = 'box',
		homogeneous = true
	}
}

function main_window:on_destroy()
	vnc:disconnect()
	Gvnc:destroy()
end

function app:on_activate()
	if #arg == 0 then
		print(help)
	elseif #arg ~= 1 then
		main_window.child.box:add(Gvnc)
		vnc:connect(arg[1], arg[2], main_window)
		main_window:show_all()
		self:add_window(main_window)
	end
end
