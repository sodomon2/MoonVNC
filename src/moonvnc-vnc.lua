--[[--
 @package   MoonVNC
 @filename  moonvnc-vnc.lua
 @version   1.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      01.03.2022 18:46:23 -04
--]]

local vnc = {}

function vnc:connect(server, port, window)
	Gvnc:open_host(server, port)
	Gvnc:grab_focus()
	window:resize(Gvnc:get_width(), Gvnc:get_height())
	window.title = ("%s - MoonVNC"):format(server)
	Gvnc:realize()
end

function vnc:disconnect()
	Gvnc:close()
end

function vnc:connect_with_credential(username, password, client_name, window)
	Gvnc:set_credential(GtkVnc.DisplayCredential.USERNAME, username)
	Gvnc:set_credential(GtkVnc.DisplayCredential.PASSWORD, password)
	Gvnc:set_credential(GtkVnc.DisplayCredential.CLIENTNAME, client_name)
	window.title = ("%s@%s - MoonVNC"):format(username, server)
end

return vnc
