module screw(m, h)
{
    color("#303030")union(){
        cylinder(h, d=m);
        translate([0,0,-m/2])cylinder(m/2, d=m*2);
    }
    
}