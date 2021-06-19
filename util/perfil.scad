module perfil(h=10, center=false){
    color("#eee")rotate([90,0,0])linear_extrude(height=h, center=center)_perfil_shape();
}

module _perfil_shape(){
    difference()
    {
        square(20, center=true);
        circle(d = 5, $fn=12);
        translate([0,-10,0])rotate([0,0,0])_perfil_hole();
        translate([10,0,0])rotate([0,0,90])_perfil_hole();
        translate([-10,0,0])rotate([0,0,-90])_perfil_hole();
        translate([0,10,0])rotate([0,0,180])_perfil_hole();
        
        translate([8,8,0])rotate([0,0,0])_perfil_bevel();
        translate([-8,8,0])rotate([0,0,90])_perfil_bevel();
        translate([8,-8,0])rotate([0,0,-90])_perfil_bevel();
        translate([-8,-8,0])rotate([0,0,180])_perfil_bevel();
    }
}

module _perfil_hole_side(){
    ea = 9.6/2;
    ia = 6/2;
    ie = 5.4;
    da = (ea - ia);
    h = 1.8;
    polygon([[0,-5], [ea, 0], [ea-da, h], [ie, h], [ie, 2*h], [ea-da, 6], [-1, 6]]);
}
module _perfil_hole(){
    union(){
        _perfil_hole_side();
        mirror([1, 0, 0])_perfil_hole_side();
    }
    
}

module _perfil_bevel(){
    difference(){
        square(3);
        circle(2, $fn=12);
    }
}

