module wheel(){
    rotate([0,90,0]){
        union(){
            color("#333")difference(){
                union(){
                    cylinder(h=6, d=24, center=true);
                    translate([0,0,3])cylinder(h=(10.2-6)/2, d1=24, d2=20);
                    translate([0,0,-3-(10.2-6)/2])cylinder(h=(10.2-6)/2, d1=20, d2=24);
                }
                cylinder(h=20, d=15.8, center=true);
            }
            color("#ddd")difference(){
                cylinder(h=10.2, d=15.8, center=true);
                cylinder(h=20, d=4.9, center=true);
            }
        }
    }
}

