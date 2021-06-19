module washer(m, d, h)
{
    color("#eee")difference(){
        cylinder(h, d=d);
        cylinder(2*h+1, d=m, center=true);
    }
    
}