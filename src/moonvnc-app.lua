--[[--
 @package   MoonVNC
 @filename  moonvnc-app.lua
 @version   1.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      01.03.2022 06:30:42 -04
--]]

function ui.btn_connect:on_clicked()
    local port = ui.entry_port.text
    
    if port == '' then
        port = "5900"
    end 

    vnc:open_host(ui.entry_server.text, port)
    vnc:grab_focus()
    ui.stack:set_visible_child_name('server_view')
    ui.main_window:resize(vnc:get_width(), vnc:get_height())
end

function ui.btn_new_connection:on_clicked()
    ui.stack:set_visible_child_name('new_connection')
    ui.menu_popover:hide()
end

function ui.btn_quit:on_clicked()
    Gtk.main_quit()
end

function ui.main_window:on_destroy()
  Gtk.main_quit()
end
