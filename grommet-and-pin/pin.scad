pin_width = 15;
pin_length = 60;
hole_diameter = 5;
hole_countersink_diameter = 12;
hole_countersink_depth = 3;

sphere_offset_x = ((pin_length - pin_width)  / 2);// + pin_width / 2);

module screwHole() { cylinder(h = pin_width, d = hole_diameter, center = true, $fn = 36);}; 

module screwCountersink() { cylinder(h = hole_countersink_depth, d = hole_countersink_diameter, center = true, $fn = 36 );}; 


difference()
{
    union()
    {
       translate ([-sphere_offset_x, 0,0])
        {
            rotate([0,90,0])
            {
                cylinder((pin_length - pin_width), d = pin_width, true, $fn = 36);
            }
        }
        
        translate([-sphere_offset_x ,0,0])
        {
            sphere(d = pin_width, $fn = 36);
        }
        
        translate([sphere_offset_x ,0,0])
        {
            sphere(d = pin_width, $fn = 36);
        }
    };    
    
    {
        translate([-sphere_offset_x ,0,0])
        {
            translate([0,0, pin_width / 2 - (hole_countersink_depth / 2) ])
            {
                screwCountersink();
            }

           screwHole(); 
        }
        
        translate([sphere_offset_x ,0,0])
        {
            translate([0,0, pin_width / 2 - (hole_countersink_depth / 2) ])
            {
                screwCountersink();
            }
           screwHole(); 
        }

        
        translate([0, 0, -(pin_width / 2)])
        {
            cube([(pin_length), pin_width, pin_width], true);
        };
    }
}
    