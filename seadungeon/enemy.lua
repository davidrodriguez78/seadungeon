function i_enemy()
    octu={}
    crap={}
    cala={}
    crapi={}
    anim_t=0
    for x=0,127 do
        for  y=0,63 do
            if mget(x,y)==42 then
                mset(x,y,20)
                add(octu,{
                    x=x*8,
                    y=y*8,
                    dx=0,
                    dy=0,
                    spd=0.6,
                    hp=1,
                    sp=42,
                })
            end
        end
    end
end

function u_enemy()
    anim_oct()
    for oc in all(octu) do
        local lx=oc.x
        local ly=oc.y
        oc.x+=oc.dx
        oc.y+=oc.dy
        oc.dx = oc.spd
        if ene_map_collide(oc) then
            oc.x=lx
            oc.y=ly
        end
    end
end

function d_enemy()
    for oc in all(octu) do
        spr(oc.sp,oc.x,oc.y)
    end
end

function anim_oct()
    if anim_t<0 then
        for o in all(octu) do
            o.sp+=1
            if o.sp>43 then
                o.sp=42
            end
        end
        anim_t=8
    end
    anim_t-=1
end

function ene_map_collide(obj)
    local ox1=obj.x/8
    local ox2=(obj.x+7)/8
    local oy1=(obj.y+4)/8
    local oy2=(obj.y+7)/8

    local a=fget(mget(ox1,oy1),0)
    local b=fget(mget(ox2,oy1),0)
    local c=fget(mget(ox2,oy2),0)
    local d=fget(mget(ox1,oy2),0)

    if a or b or c or d then
        return true
    else
        return false
    end
end