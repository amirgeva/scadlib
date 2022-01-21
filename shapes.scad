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

module mounting_corner()
{
    difference()
    {
        cylinder(h=20,r1=0,r2=10);
        translate([-15,-30,0])
        cube([30,30,30]);
        translate([-30,-15,0])
        cube([30,30,30]);
        translate([4,4,10])
            cylinder(d=3,h=12,$fn=24);
    }
}

module mounting_corners(dx,dy)
{
    translate([-dx/2,-dy/2,-20])
    mounting_corner();

    translate([dx/2,-dy/2,-20])
    rotate([0,0,90])
    mounting_corner();

    translate([dx/2,dy/2,-20])
    rotate([0,0,180])
    mounting_corner();

    translate([-dx/2,dy/2,-20])
    rotate([0,0,270])
    mounting_corner();
}

