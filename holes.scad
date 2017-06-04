module quad_holes(sx,sy,diam,height)
{
    translate([-0.5*sx,-0.5*sy,0])
    cylinder(d=diam,h=height,$fn=24);
    translate([0.5*sx,-0.5*sy,0])
    cylinder(d=diam,h=height,$fn=24);
    translate([-0.5*sx,0.5*sy,0])
    cylinder(d=diam,h=height,$fn=24);
    translate([0.5*sx,0.5*sy,0])
    cylinder(d=diam,h=height,$fn=24);
}


