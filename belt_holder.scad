module belt_holder_a(){
    difference(){
        translate([0,0,0.5+0.25])cube([15,30,3.5], center=true);
        translate([0,0,2])cube([32,6.5,3], center=true);
        translate([0,10,0])cylinder(h=20, d=4, center=true, $fn=12);
        translate([0,10,-1])cylinder(h=3, d=6.5, center=true, $fn=6);
        translate([0,-10,-1])cylinder(h=3, d=6.5, center=true, $fn=6);
        translate([0,-10,0])cylinder(h=20, d=4, center=true, $fn=12);
    }
        
}

module teeth(w, h, l, n){
    for (i = [0:n-1]){
        translate([i*l,0,0])rotate([-90,0,0])linear_extrude(w, center=true)polygon([[0,0], [l/2,h], [l,0]]);
    }
    
}


module belt_holder_b(){
    translate([0,0,3.5])difference(){
        union(){
            cube([15,30,2], center=true);
            translate([-5,0,-1])teeth(5, 1, 2, 5);
        }
        translate([0,10,0])cylinder(h=20, d=4, center=true, $fn=12);
        translate([0,-10,0])cylinder(h=20, d=4, center=true, $fn=12);
    }
        
}

module belt_holder_c(){
    translate([0,0,1.5+4+0.75])difference(){
        cube([15,30,3.5], center=true);
        translate([0,0,-1.5])cube([32,6.5,2], center=true);
        translate([0,10,0])cylinder(h=20, d=4, center=true, $fn=12);
        translate([0,-10,0])cylinder(h=20, d=4, center=true, $fn=12);
    }
        
}

//belt_holder_a();
//belt_holder_b();
belt_holder_c();

