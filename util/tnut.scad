module tnut()
{
    color("#eee")
        difference(){
            union()
            {
                cube([10.3,6,5], center=true);
                cylinder(h=4, d=6);
            }
            translate([-6, 0, -5])rotate([0, 45, 0])cube(7, center=true);
            translate([6, 0, -5])rotate([0, -45, 0])cube(7, center=true);
            cylinder(h=10, d=3, center=true);
    }
    
}