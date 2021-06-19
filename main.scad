include <util/perfil.scad>;
include <util/pulley.scad>;
include <util/screw.scad>;
include <util/washer.scad>;
include <util/tnut.scad>;
include <util/motor.scad>;
include <corner_a.scad>;
include <corner_b.scad>;
include <corner_motor.scad>;
include <car_a.scad>;
include <car_b.scad>;

xlen = 500;
ylen = 500;
height = 50;

module frame(){
    
    translate([xlen/2+10,0,0])rotate([0,0,0])perfil(h=ylen, center=true);
    translate([-xlen/2-10,0,0])rotate([0,0,0])perfil(h=ylen, center=true);
    translate([0,ylen/2+10,0])rotate([0,0,90])perfil(h=xlen, center=true);
    translate([0,-ylen/2-10,0])rotate([0,0,90])perfil(h=xlen, center=true);
    translate([-xlen/2-10,-ylen/2-10,-height/2+10])rotate([90,0,0])perfil(h=height, center=true);
    translate([xlen/2+10,-ylen/2-10,-height/2+10])rotate([90,0,0])perfil(h=height, center=true);
    translate([-xlen/2-10,ylen/2+10,-height/2+10])rotate([90,0,0])perfil(h=height, center=true);
    translate([xlen/2+10,ylen/2+10,-height/2+10])rotate([90,0,0])perfil(h=height, center=true);
}

module corner_front(){
    translate([-xlen/2-20,-ylen/2-20,10])rotate([0,0,0])corner_b();
    translate([-xlen/2-24,-ylen/2-20,10])rotate([0,90,0])corner_a();
    translate([-xlen/2-20,-ylen/2-20,10])rotate([90,90,0])corner_a();
    
    translate([xlen/2+20,-ylen/2-20,14])rotate([0,180,0])corner_b();
    translate([xlen/2+20,-ylen/2-20,10])rotate([0,90,0])corner_a();
    translate([xlen/2+20,-ylen/2-24,10])rotate([-90,90,0])corner_a();

}

module corner_back(){
    translate([-xlen/2-20,ylen/2+20,10])rotate([0,0,-90])corner_b();
    translate([-xlen/2-20,ylen/2+20,10])rotate([180,90,0])corner_a();
    translate([-xlen/2-20,ylen/2+24,10])rotate([90,90,0])corner_motor();
    
    translate([xlen/2+20,ylen/2+20,10])rotate([0,0,180])corner_b();
    translate([xlen/2+24,ylen/2+20,10])rotate([180,90,0])corner_a();
    translate([xlen/2+20,ylen/2+24,10])rotate([90,-90,0])mirror([1,0,0])corner_motor();
}

module doublewheel(){
    translate([0,0,-19]){
    screw(3, 25);
    translate([0,0,8.5/2])pulley();
    translate([0,0,8.5])washer(3, 7, 0.5);
    translate([0,0,8.5/2+9])pulley();
    translate([0,0,8.5+9])washer(3, 7, 0.5);
    translate([0,0,8.5+9.5])washer(5, 10, 1);
    translate([0,0,23])rotate([0,180,0])tnut();
    }
}

module motors(){
    translate([xlen/2-20,ylen/2+41+4+0.5,42-10+3])rotate([0,180,90])motor();
    translate([-xlen/2+20,ylen/2+41+4+0.5,42-10+3])rotate([0,180,-90])motor();
    translate([xlen/2-20,ylen/2+41+4+0.5,-20+8.5/2])pulley();
    translate([-xlen/2+20,ylen/2+41+4+0.5,-19+8.5/2-10])pulley();
}

module moving_frame(){
    translate([0,0,0])rotate([0,0,90])perfil(h=xlen-20, center=true);
    translate([-xlen/2+35,0,-10])doublewheel();
    translate([+xlen/2-35,0,-10])doublewheel();
    translate([-xlen/2-10,0,0])car_with_wheels();
    rotate([0,0,180])translate([-xlen/2-10,0,0])car_with_wheels();
}

module car_with_wheels(){
    module wheel_with_screw(){
        wheel();
        translate([15,0,0])rotate([0,-90,0])screw(5, 25);
        translate([15,0,0])rotate([0,-90,0])washer(5, 10, 1);
        translate([6,0,0])rotate([0,-90,0])washer(5, 10, 1);
        translate([-4.9,0,0])rotate([0,-90,0])washer(5, 8, 5);    
    }
    translate([0,-20,20.5])wheel_with_screw();
    translate([0,20,20.5])wheel_with_screw();
    translate([0,0,-20.5])wheel_with_screw();
    translate([10,0,0])car_a();
}

module car_b_with_wheels(){
    module wheel_with_screw(){
        wheel();
        translate([15,0,0])rotate([0,-90,0])screw(5, 25);
        translate([15,0,0])rotate([0,-90,0])washer(5, 10, 1);
        translate([6,0,0])rotate([0,-90,0])washer(5, 10, 1);
        translate([-4.9,0,0])rotate([0,-90,0])washer(5, 8, 5);    
    }
    translate([-10,-20,20.5])wheel_with_screw();
    translate([-10,20,20.5])wheel_with_screw();
    translate([-10,-20,-20.5])wheel_with_screw();
    translate([-10,20,-20.5])wheel_with_screw();
    car_b();
}

module belts(){
    color("#111")union()
    {
        translate([216,-6,-28+9])rotate([0,0,90])cube([1,180,6]);
        translate([220,-4,-28+9])rotate([0,0,-0.8])cube([1,304,6]);
        translate([235,-260,-28+9])cube([1,560,6]);
        translate([235,-266,-28+9])rotate([0,0,90])cube([1,470,6]);
        translate([-236,-260,-28+9])rotate([0,0,-3.5])cube([1,265,6]);
        translate([-216,6,-28+9])rotate([0,0,-90])cube([1,180,6]);
        
        translate([-216,-5,-28])rotate([0,0,-90])cube([1,180,6]);
        translate([-221,-4,-28])rotate([0,0,0.8])cube([1,304,6]);
        translate([-236,-260,-28])cube([1,560,6]);
        translate([235,-266,-28])rotate([0,0,90])cube([1,470,6]);
        translate([235,-260,-28])rotate([0,0,3.5])cube([1,265,6]);
        translate([216,5,-28])rotate([0,0,90])cube([1,180,6]);
    }
}

translate([-xlen/2+20,-ylen/2-10,-10])doublewheel();
translate([+xlen/2-20,-ylen/2-10,-10])doublewheel();
motors();
frame();
moving_frame();
corner_front();
corner_back();
belts();
translate([0,-10,0])rotate([0,0,-90])car_b_with_wheels();

