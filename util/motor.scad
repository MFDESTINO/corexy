module motor(){
    module base(){
        color("#eee")union(){
            linear_extrude(10)motor_shape();
            translate([-8, 42/2, 0])cube([16, 4.4, 3]);
        }
    };

    module body(){
        color("#222")translate([0,0,10])linear_extrude(22)motor_body();
    };

    module head(){
        color("#eee")translate([0, 0, 32])difference(){
            union(){
                linear_extrude(8)motor_shape();
                translate([0,0,8])cylinder(2, d = 22);
            }
            translate([0,0,4])cylinder(11, d = 10);
            for (i = [-1, 1]){
                for (j = [-1, 1]){
                    translate([i*31/2,j*31/2,4])cylinder(10, d = 3);
                };
            };
        
        }
    };

    module rotor(){
        color("#eee")translate([0, 0, 2])cylinder(62, d=5);
    }

    module motor_shape(){
        bevel = (42-34)/2;
        side_len = 42-bevel;
        translate([-42/2, -42/2, 0])polygon([[bevel,0], [side_len, 0], [42, bevel], [42, side_len],[side_len, 42], [bevel, 42], [0, side_len], [0, bevel]]);
    };

    module motor_body(){
        bevel = (42-30)/2;
        side_len = 42-bevel;
        translate([-42/2, -42/2, 0])polygon([[bevel,0], [side_len, 0], [42, bevel], [42, side_len], [side_len, 42], [bevel, 42], [0, side_len], [0, bevel]]);
    };
    union(){
        base();
        body();
        head();
        rotor();
    }
}




