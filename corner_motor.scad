include <util/motor.scad>;

module corner_motor(){
    h = 4;
    l = 50;
    module motor_base(){
        translate([0.5,19-0.5,15])difference(){
            translate([-0.5,0,0])cube([42.5,43,5]);
            translate([21,21+0.5,0])cylinder(h=20, d=24, center=true);
            for (i = [-1, 1]){
                for (j = [-1, 1]){
                    translate([i*31/2+21,j*31/2+21+0.5,-1])cylinder(10, d=4, $fn=10);
                };
            };
        }
    }
    module corner(){
         linear_extrude(h)polygon([[0,0], [l,0], [l,20], [30,20], [20, 30], [20,l+40], [0,l+40]]);
    }
    module base_support_a(){
        linear_extrude(h)polygon([[0,0],[50,0],[20,42.5],[15,42.5]]);
    }
    module base_support_b(){
        linear_extrude(h)polygon([[0,0],[20,0],[20,42.5],[15,42.5]]);
    }
    color("#bbf")difference(){
        union(){
            corner();
            rotate([0,90,0])motor_base();
            translate([0,15-0.5,0])rotate([-90,0,0])base_support_a();
            translate([0,15+42+4+0.5,0])rotate([-90,0,0])base_support_b();
        }
       
        translate([10,10,0])rotate([0,0,0])cylinder(h=10, d=4, center=true, $fn=12);
        translate([40,10,0])rotate([0,0,0])cylinder(h=10, d=4, center=true, $fn=12);
        //translate([10,30,0])rotate([0,0,0])cylinder(h=10, d=4, center=true, $fn=12);
        translate([10,80,0])rotate([0,0,0])cylinder(h=10, d=4, center=true, $fn=12);
    }
    
}

//translate([20,21+0.5,42-10+3])rotate([0,180,-90])motor();
//translate([-20,0,10])rotate([90,90,0])corner_motor();