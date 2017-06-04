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
