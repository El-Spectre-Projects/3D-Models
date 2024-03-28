plug_width = 19;
plug_length = 57;
depth = 12;
thickness = 3;
flange_overlap = 6;
flange_thickness = 3;

module Plug() 
{
    radius = plug_width / 2;
    
    cylinder (depth, radius, radius);

    translate([0, - plug_width / 2, 0])
    {
        cube([plug_length  - plug_width, radius * 2, depth]);
    };

    translate([plug_length - plug_width, 0,0])
    {
        cylinder (depth, radius, radius);
    };
};

module Hole() 
{    
    radius = (plug_width - thickness) / 2;
    depth = depth + thickness + flange_thickness;
    
    cylinder (depth, radius, radius);

    translate([0, - radius, 0])
    {
        cube([plug_length  - (plug_width), (plug_width - thickness), depth]);
    };

    translate([plug_length - (plug_width) , 0,0])
    {
        cylinder (depth, radius, radius);
    };
};

module PlugFlange() 
{
    radius = (plug_width / 2) + flange_overlap;
    
    cylinder (flange_thickness, radius, radius);

    translate([0, - radius, 0])
    {
        cube([plug_length  - plug_width, radius * 2, flange_thickness]);
    };

    translate([plug_length - plug_width, 0,0])
    {
        cylinder (flange_thickness, radius, radius);
    };
};

translate([(flange_overlap + (plug_width / 2)), 0,0])
{
   difference()
   {
        union()
        {
            translate([0,0,depth])
            {
                PlugFlange();
            };
            Plug();
        }

        Hole();
    };
};
