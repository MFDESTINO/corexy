include <util/perfil.scad>;
include <util/wheel.scad>;
include <util/screw.scad>;
include <util/washer.scad>;

module car_a(){
    color("#bbf")difference(){
        union(){
            translate([-4,-30,12])cube([8, 60, 18]);
            translate([-4,-18,-29])cube([8, 36, 18]);
            translate([10,-14,-10])cube([20, 4, 20]);
            translate([10,10,-10])cube([20, 4, 20]);
            translate([10,14,6])linear_extrude(4)polygon([[0,0], [20,0], [0,10]]);
            translate([10,-14,6])linear_extrude(4)polygon([[0,0], [20,0], [0,-10]]);
            translate([10,14,-10])linear_extrude(4)polygon([[0,0], [20,0], [0,5]]);
            translate([10,-14,-10])linear_extrude(4)polygon([[0,0], [20,0], [0,-5]]);
            translate([2,0,0])rotate([90,0,90])linear_extrude(8)
            polygon([[-18,-15],[-18,-29],[18,-29],[18,-15],[30,12],[30,30],[-30,30],[-30,12]]);
        }
        translate([11,-20,20.5])rotate([180,90,0])cylinder(h=7, d=12);
        translate([11,20,20.5])rotate([180,90,0])cylinder(h=7, d=12);
        translate([11,0,-20.5])rotate([180,90,0])cylinder(h=7, d=12);
        translate([11,-20,20.5])rotate([180,90,0])cylinder(h=20, d=6, $fn=12);
        translate([11,20,20.5])rotate([180,90,0])cylinder(h=20, d=6, $fn=12);
        translate([11,0,-20.5])rotate([180,90,0])cylinder(h=20, d=6, $fn=12);
        translate([20,0,0])rotate([90,90,0])cylinder(h=50, d=4, center=true, $fn=12);
    }
}
