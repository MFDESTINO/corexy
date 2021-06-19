module pulley(){
    color("#eee")difference(){
    union(){
        cylinder(h=8.5, d=9.5, center=true);
        translate([0,0,-8.5/2])cylinder(h=1, d=13, center=false);
        translate([0,0,6.5/2])cylinder(h=1, d=13, center=false);
    }
    cylinder(h=10, d=3, center=true, $fn=12);
    }
}
