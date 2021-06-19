include <util/perfil.scad>;
include <util/wheel.scad>;
include <util/screw.scad>;
include <util/washer.scad>;

module car_b(){
    color("#bbf")difference(){
        union(){
            translate([-4,-30,12])cube([8, 60, 18]);
            translate([-4,-30,-29])cube([8, 60, 18]);
            translate([2,-30,-29])cube([8, 60,59]);
        }
        translate([11,-20,20.5])rotate([180,90,0])cylinder(h=7, d=12);
        translate([11,20,20.5])rotate([180,90,0])cylinder(h=7, d=12);
        translate([11,20,-20.5])rotate([180,90,0])cylinder(h=7, d=12);
        translate([11,-20,-20.5])rotate([180,90,0])cylinder(h=7, d=12);
        translate([11,-20,20.5])rotate([180,90,0])cylinder(h=20, d=6, $fn=12);
        translate([11,20,20.5])rotate([180,90,0])cylinder(h=20, d=6, $fn=12);
        translate([11,20,-20.5])rotate([180,90,0])cylinder(h=20, d=6, $fn=12);
        translate([11,-20,-20.5])rotate([180,90,0])cylinder(h=20, d=6, $fn=12);
    }
}

module wheel_with_screw(){
        wheel();
        translate([15,0,0])rotate([0,-90,0])screw(5, 25);
        translate([15,0,0])rotate([0,-90,0])washer(5, 10, 1);
        translate([6,0,0])rotate([0,-90,0])washer(5, 10, 1);
        translate([-4.9,0,0])rotate([0,-90,0])washer(5, 8, 5);    
}
