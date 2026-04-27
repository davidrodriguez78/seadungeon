function _init()
    i_plr()
    i_ui()
    i_rooms()
    i_enemy()
    --cam
    camx=0
    camy=0
end

function _update()
    u_plr()
    u_ui()
    u_rooms()
    u_enemy()

end

function _draw()
    camera(camx,camy)
    cls()
    map()
    d_enemy()
    d_plr()
    
    --ui
    camera()
    d_ui()
    
    --stats
    print("mem: "..stat(0),0,0,7)
    print("cpu: "..stat(1),0,10,7)
    print("fps: "..stat(7),0,20,7)

end
