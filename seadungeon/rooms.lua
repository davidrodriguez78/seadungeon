function i_rooms()
    rooms=1
    p_active=true
end

function u_rooms()
    if finish_room() then
        rooms+=1
        change_room()
    end
end

function finish_room()
    local px=(plr.x+4)/8
    local py=(plr.y+4)/8

    if mget(px,py)==32 then
        return true
    else
        return false
    end
end

function change_room()
    
    if rooms==2 then
        plr.x=18*8
        plr.y=14*8
        camx=16*8
        camy=0
    elseif rooms==3 then
        plr.x=39*8
        plr.y=13*8
        camx=32*8
        camy=0
    elseif rooms==4 then
        plr.x=50*8
        plr.y=8*8
        camx=48*8
        camy=0
    elseif rooms==5 then
        plr.x=70*8
        plr.y=9*8
        camx=64*8
        camy=0
    elseif rooms==6 then
        plr.x=90*8
        plr.y=12*8
        camx=80*8
        camy=0
    elseif rooms==7 then
        plr.x=98*8
        plr.y=14*8
        camx=96*8
        camy=0
    elseif rooms==8 then
        plr.x=115*8
        plr.y=13*8
        camx=112*8
        camy=0*8
    elseif rooms==9 then
        plr.x=1*8
        plr.y=20*8
        camx=0*8
        camy=16*8
    elseif rooms==10 then
        plr.x=27*8
        plr.y=24*8
        camx=16*8
        camy=16*8
    elseif rooms==11 then
        plr.x=45*8
        plr.y=29*8
        camx=32*8
        camy=16*8
    elseif rooms==12 then
        plr.x=61*8
        plr.y=29*8
        camx=48*8
        camy=16*8
    elseif rooms==13 then
        plr.x=68*8
        plr.y=24 *8
        camx=64*8
        camy=16*8
    elseif rooms==14 then
        plr.x=93*8
        plr.y=20*8
        camx=80*8
        camy=16*8
    elseif rooms==15 then
        plr.x=97*8
        plr.y=29*8
        camx=96*8
        camy=16*8
    elseif rooms==16 then
        plr.x=125*8
        plr.y=29*8
        camx=112*8
        camy=16*8
    elseif rooms==17 then
        plr.x=2*8
        plr.y=45*8
        camx=0*8
        camy=32*8
    elseif rooms==18 then
        plr.x=17*8
        plr.y=36*8
        camx=16*8
        camy=32*8
    elseif rooms==19 then
        plr.x=33*8
        plr.y=41*8
        camx=32*8
        camy=32*8
    elseif rooms==20 then
        plr.x=61*8
        plr.y=45*8
        camx=48*8
        camy=32*8
    elseif rooms==21 then
        plr.x=65*8
        plr.y=41*8
        camx=64*8
        camy=32*8
    elseif rooms==22 then
        plr.x=88*8
        plr.y=45*8
        camx=80*8
        camy=32*8
    elseif rooms==23 then
        plr.x=100*8
        plr.y=39*8
        camx=96*8
        camy=32*8
    elseif rooms==24 then
        plr.x=125*8
        plr.y=45*8
        camx=112*8
        camy=32*8
    elseif rooms==25 then
        plr.x=02*8
        plr.y=61*8
        camx=0*8
        camy=48*8
    elseif rooms==26 then
        plr.x=23*8
        plr.y=59*8
        camx=16*8
        camy=48*8
    elseif rooms==27 then
        plr.x=45*8
        plr.y=61*8
        camx=32*8
        camy=48*8
    elseif rooms==28 then
        plr.x=49*8
        plr.y=56*8
        camx=48*8
        camy=48*8
    elseif rooms==29 then
        plr.x=70*8
        plr.y=61*8
        camx=64*8
        camy=48*8
    elseif rooms==30 then
        plr.x=83*8
        plr.y=54*8
        camx=80*8
        camy=48*8
    elseif rooms==31 then
        plr.x=99*8
        plr.y=59*8
        camx=96*8
        camy=48*8
    elseif rooms==32 then
        plr.x=125*8
        plr.y=61*8
        camx=112*8
        camy=48*8
    end
      
end