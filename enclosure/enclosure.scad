
$fn = 50;

module pi() {
    translate([665.2,-524.2,10.3]) {
        import("raspi_aplus.stl");
    };
}

module medium_button() {
    union() {
        cylinder(
            h=10,
            r1=60.8 / 2,
            r2=55.3 / 2
        );

        translate([0, 0, 9]) cylinder(
            h=5.4,
            r=51.9 / 2
        );

        translate([0, 0, -30.5]) cylinder(
            h=30.5,
            r=23.3 / 2
        );

        translate([0, 0, -30.5 - (21.9 / 2)]) scale([27.65,9.65,21.9])  cube(size=1, center=true);

        translate([-18.85, 0, -4.4]) cylinder(
            r=3.4 / 2,
            h=4.4
        );

        translate([18.85, 0, -4.4]) cylinder(
            r=3.4 / 2,
            h=4.4
        );
    };
};

module large_button(cutout=false) {
    chassis_color = [0.1, 0.1, 0.1];
    button_color = [0, 0.4, 0];

    union() {
        if (! cutout) {
            color(chassis_color)
            cylinder(
                h=6.5,
                r1=98.5 / 2,
                r2=87.8 / 2
            );

            color(button_color) {
                translate([0, 0, 6.5])
                intersection() {
                    translate([0, 0, 3])
                    scale([78.78, 78.78, (21 * 2) - (3 * 2)])
                    sphere(r=0.5, $fn=50);

                    cylinder(
                        r=78.78/2,
                        h=22 * 2
                    );
                }

                cylinder(
                    r=78.78/2,
                    h=6.5 + 3,
                    $fn=50
                );
            }
        }

        color(chassis_color)
        translate([0, 0, -10.5])
        cylinder(
            h=11,
            r=87.8 / 2,
            $fn=250
        );

        color(chassis_color)
        translate([(93.7 / 2) - 3, 0, cutout ? -4 : -3])
        cylinder(
            r=3,
            h=cutout ? 5 : 4,
            $fn=50
        );
        color(chassis_color)
        translate([-((93.7 / 2) - 3), 0, cutout ? -4 : -3])
        cylinder(
            r=3,
            h=cutout ? 5 : 4,
            $fn=50
        );

        color(chassis_color)
        translate([0, 0, -10.5 - 4.5])
        cylinder(
            h=4.5,
            r1=23.74 / 2,
            r2=27.3 / 2
        );

        color(chassis_color)
        translate([0, 0, -10.5 - 31.5])
        cylinder(
            h=31.5,
            r=23.74 / 2
        );

        color(chassis_color)
        translate([-27.65/2, -9.65/2, -53.75 - 10.5])
        cube(size=[27.65, 9.65, 16.1]);

    };
};

module pcb(width, height, thickness=1.6, radius=0.001) {
    linear_extrude(height=thickness)
    rounded_square(width, height, radius);
}

module rounded_square(width, height, radius) {
    translate_x = (width / 2) - radius;
    translate_y = (height / 2) - radius;

    hull()
    {
        translate([-translate_x, -translate_y, 0])
        circle(r=radius);

        translate([translate_x, -translate_y, 0])
        circle(r=radius);

        translate([translate_x, translate_y, 0])
        circle(r=radius);

        translate([-translate_x, translate_y, 0])
        circle(r=radius);
   }
}

module circle_cutout_square(width, height, radius) {
    translate_x = (width / 2);
    translate_y = (height / 2);

    difference() {
        square(size=[width, height], center=true);

        translate([-translate_x, -translate_y, 0])
        circle(r=radius);

        translate([translate_x, -translate_y, 0])
        circle(r=radius);

        translate([translate_x, translate_y, 0])
        circle(r=radius);

        translate([-translate_x, translate_y, 0])
        circle(r=radius);
   }
}

module four_about_origin(x_spacing, y_spacing) {
    translate([-x_spacing / 2, -y_spacing / 2, 0])
    child();

    translate([-x_spacing / 2, y_spacing / 2, 0])
    child();

    translate([x_spacing / 2, -y_spacing / 2, 0])
    child();

    translate([x_spacing / 2, y_spacing / 2, 0])
    child();
}

module enclosure(base=true, lid=true) {
    corner_radius = 5.969;
    width = 120.2182;
    depth = 199.9996;
    base_height = 59.1566;
    lid_height = 15.0368;
    wall_thickness = 3.4036;
    floor_thickness = 3.429;

    inner_convex_radius = 1.27;
    inner_concave_radius = 7.0104;

    vert_inner_cut_offset = 22.9362;
    horiz_inner_cut_offset = 13.2588;

    module pcb_mounting_screw() {
        translate([-45.2247, -80.5434, 0])
        cylinder(
            r=7.1628 / 2,
            h=4.826
        );
    }

    module cavity() {
        rounded_square(width - (vert_inner_cut_offset * 2), depth - (wall_thickness * 2), 1.27);

        rounded_square(width - (wall_thickness * 2), depth - (horiz_inner_cut_offset * 2), 1.27);

        circle_cutout_square(88.2396, 187.6298, inner_concave_radius);
    }

    {
        if (base) {
            difference() {
                linear_extrude(height=base_height)
                rounded_square(width, depth, corner_radius);

                translate([0, 0, floor_thickness])
                linear_extrude(height=base_height + 1)
                cavity();
            }

            translate([0, 0, floor_thickness])
            {
                pcb_mounting_screw();

                mirror ([0, 1, 0])
                pcb_mounting_screw();

                mirror ([1, 0, 0])
                pcb_mounting_screw();

                mirror ([0, 1, 0])
                mirror ([1, 0, 0])
                pcb_mounting_screw();

            }
        }

        if (lid) {
            translate([0, 0, base_height])
            difference() {
                linear_extrude(height=lid_height)
                rounded_square(width, depth, corner_radius);

                translate([0, 0, -1])
                linear_extrude(height=(lid_height - floor_thickness) + 1)
                cavity();
            }
        }
    }
}

module display_module(cutout=false) {
    // NOTE WELL: The dimensions in this module are just approximations
    // based on the vague sizes on adafruit's site. They have not actually
    // been measured yet and may need adjustment once we have a real unit
    // to measure.

    module holes(cutout) {
        translate([0, 0, -0.5])
        four_about_origin(27, 27)
        cylinder(h=6.5, r=2.5/2);

        if (cutout) {
            translate([0, 0, 1.6 + 1.4 - 5])
            linear_extrude(height=7)
            rounded_square(29.45 + 2.5, 14.70 + 2.5, 0.001);
        }
    }

    if (cutout) {
        holes(cutout);
    }
    else {
        color([0.08, 0.36, 1])
        translate([0, 0, -1.6 - 1.4])
        difference() {
            pcb(35, 35, radius=7, thickness=1.6);
            holes(cutout);
        }

        color([0, 0, 0])
        translate([0, 0, -1.4])
        linear_extrude(height=1.5)
        rounded_square(35, 20, 0.001);
    }
}

module overview(cutout) {
    top_feature_height = 59.1566 + 15.0368;
    button_y_offset = 22.7398;
    display_y_offset = -63.3898;

    if (! cutout) {
        translate([0, button_y_offset, top_feature_height])
        rotate(90, [0, 0, 1])
        large_button(cutout=false);

        translate([0, display_y_offset, top_feature_height - 3.43])
        display_module(cutout=false);
    }

    color([0.5, 0.5, 0.5])
    difference() {
        enclosure(base=true, lid=true);

        translate([0, button_y_offset, top_feature_height])
        rotate(90, [0, 0, 1])
        large_button(cutout=true);

        translate([0, display_y_offset, top_feature_height - 3.43])
        display_module(cutout=true);
    }
}

overview(cutout=false);

