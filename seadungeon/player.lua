function i_plr()
    
    plr={
        x=1*8,
        y=4*8,
        dx=0,
        dy=0,
        w=8,
        h=8,
        sp=1,
        spd=1,
        state="idle",
        flp=false,
    }
    shadow={
        x=plr.x,
        y=plr.y+5,
        sp=6
    }
   
    bubble={}
    swim_t=0
    attac_t=0
    cold_d=10
end

function u_plr()
    local lx=plr.x
    local ly=plr.y

    plr.x+=plr.dx
    plr.y+=plr.dy

    --base move
    if btn(0) then
        plr.state="swim"
        plr.dx= -plr.spd
        plr.flp=true
    elseif btn(1) then
        plr.state="swim"
        plr.dx=plr.spd
        plr.flp=false
    else
        plr.dx=0
    end

    if btn(2) then
        plr.state="swim"
        plr.dy= -plr.spd
    elseif btn(3) then
        plr.state="swim"
        plr.dy=plr.spd
    else
        plr.dy=0
    end
    

    --states
    if plr.dx!=0 or plr.dy!=0 then
        swim_anim()
    else
        plr.state="idle"
        plr.sp=1
    end
    
    --attac
    if btn(5) then
        cold_d-=1
        plr.state="attac"
        if plr.state=="attac" then
            plr.sp=4
            attac_anim()
        end
        if plr.flp and cold_d<0 then
            add(bubble,{
                x=plr.x,
                y=plr.y+4,
                dx= -2,
                r=1,
                life=20
            })
            cold_d=10
        elseif not plr.flp and cold_d<0 then
            add(bubble,{
                x=plr.x+7,
                y=plr.y+4,
                dx=2,
                r=1,
                life=20
            })
            cold_d=10
        end
        
    else
        plr.spd=1
    end
    for b in all(bubble) do
        b.r+=.5
        b.life-=1
        b.x+=b.dx
        if b.r>3 then
            b.r=3
            if b.life<0 then
                del(bubble,b)
            end
            --del bobble
            if del_bubble(0) then
                del(bubble,b)
            end
        end
    end

    --shadow
    shadow.x=plr.x
    shadow.y=plr.y+3

    --collision
    if map_collide() then
        plr.x=lx
        plr.y=ly
    end
end

function d_plr()
    --shadow
    spr(shadow.sp,shadow.x,shadow.y)
    spr(plr.sp,plr.x,plr.y,1,1,plr.flp)
    --bubble
    for b in all(bubble) do
        circ(b.x,b.y,b.r,7)
    end
end

--anim
function swim_anim()
    if swim_t<0 then
        plr.sp+=1
        if plr.sp>3 then
            plr.sp=2
        end
        swim_t=3
    end
    swim_t-=1
end
function attac_anim()
    if attac_t<0 then
        plr.sp+=1
        if plr.sp>5 then
            plr.sp=4
        end
        attac_t=5
    end
    attac_t-=1
end

--collision
function map_collide()
    local px1=plr.x/8
    local px2=(plr.x+7)/8
    local py1=(plr.y+4)/8
    local py2=(plr.y+7)/8

    local a=fget(mget(px1,py1),0)
    local b=fget(mget(px2,py1),0)
    local c=fget(mget(px2,py2),0)
    local d=fget(mget(px1,py2),0)

    if a or b or c or d then
        return true
    else
        return false
    end
end

function del_bubble(flg)
    for b in all(bubble) do
        local bx1=(b.x-1)/8
        local bx2=(b.x+3)/8
        local by1=b.y/8
        local by2=(b.y+4)/8
        if fget(mget(bx1,by1),flg)
        or fget(mget(bx2,by1),flg)
        or fget(mget(bx2,by2),flg)
        or fget(mget(bx1,by2),flg) then
            return true
        else
            return false
        end
        
    end
end