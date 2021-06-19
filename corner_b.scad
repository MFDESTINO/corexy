module corner_b()
{
    
    h = 4;
    l = 70;
    color("#bbf")difference(){
        linear_extrude(h)polygon([[0,0], [l,0], [l,20], [30,20], [20, 30], [20,l], [0,l]]);
        translate([60,10,0])rotate([0,0,0])cylinder(h=10, d=4, center=true, $fn=12);
        translate([30,10,0])rotate([0,0,0])cylinder(h=10, d=4, center=true, $fn=12);
        translate([10,30,0])rotate([0,0,0])cylinder(h=10, d=4, center=true, $fn=12);
        translate([10,60,0])rotate([0,0,0])cylinder(h=10, d=4, center=true, $fn=12);
    }
    
}
