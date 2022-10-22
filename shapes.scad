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

module mounting_corner(offset)
{
    difference()
    {
        cylinder(h=20,r1=0,r2=10);
        translate([-15,-30,0])
        cube([30,30,30]);
        translate([-30,-15,0])
        cube([30,30,30]);
        translate([offset,offset,10])
            cylinder(d=3,h=12,$fn=24);
    }
}

module mounting_corners(dx,dy,offset)
{
    translate([-dx/2,-dy/2,-20])
    mounting_corner(offset);

    translate([dx/2,-dy/2,-20])
    rotate([0,0,90])
    mounting_corner(offset);

    translate([dx/2,dy/2,-20])
    rotate([0,0,180])
    mounting_corner(offset);

    translate([-dx/2,dy/2,-20])
    rotate([0,0,270])
    mounting_corner(offset);
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