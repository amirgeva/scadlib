module rounded_cube(sx,sy,height,radius) {
  cube([sx-2*radius,sy,height],center=true);
  translate([sx/2-radius/2,0,0])
  cube([radius,sy-2*radius,height],center=true);
  translate([-sx/2+radius/2,0,0])
  cube([radius,sy-2*radius,height],center=true);
  translate([sx/2-radius,sy/2-radius,-height/2])
  cylinder(d=2*radius,h=height,$fn=36);
  translate([sx/2-radius,-sy/2+radius,-height/2])
  cylinder(d=2*radius,h=height,$fn=36);
  translate([-sx/2+radius,sy/2-radius,-height/2])
  cylinder(d=2*radius,h=height,$fn=36);
  translate([-sx/2+radius,-sy/2+radius,-height/2])
  cylinder(d=2*radius,h=height,$fn=36);
}

module rounded_square( width, radius_corner ) {
	translate( [ radius_corner-width/2, radius_corner-width/2, 0 ] )
		minkowski() {
			square( width - 2 * radius_corner );
			circle( radius_corner );
		}
}

module mounting_corner(offsetx,offsety,radius=10)
{
    difference()
    {
        cylinder(h=20,r1=0,r2=radius);
        translate([-15,-30,0])
        cube([30,30,30]);
        translate([-30,-15,0])
        cube([30,30,30]);
        translate([offsetx,offsety,10])
            cylinder(d=3,h=12,$fn=24);
    }
}

module mounting_corners2(dx,dy,offsetx,offsety,radius)
{
	for(y=[0,1])
	mirror([0,y,0])
	{
		for(x=[0,1])
		mirror([x,0,0])
		translate([-dx/2,-dy/2,-20])
		mounting_corner(offsetx,offsety,radius);
	}
}

module mounting_corners(dx,dy,offset)
{
	mounting_corners2(dx,dy,offset,offset,10);
}

module sector(h, d, a1, a2) {
    if (a2 - a1 > 180) {
        difference() {
            cylinder(h=h, d=d);
            translate([0,0,-0.5]) sector(h+1, d+1, a2-360, a1); 
        }
    } else {
        difference() {
            cylinder(h=h, d=d);
            rotate([0,0,a1]) translate([-d/2, -d/2, -0.5])
                cube([d, d/2, h+1]);
            rotate([0,0,a2]) translate([-d/2, 0, -0.5])
                cube([d, d/2, h+1]);
        }
    }
}    

// width(x),depth(y),height(z),thickness(t)
module box(w,d,h,t)
{
	difference()
	{
		cube([w,d,h],center=true);
		translate([0,0,t])
		cube([w-2*t,d-2*t,h],center=true);
	}
}

module tri_prism(w,d,h)
{
    rotate([90,0,90])
    linear_extrude(w)
    polygon([ [0,0], [0,h], [d,0] ]);
}

