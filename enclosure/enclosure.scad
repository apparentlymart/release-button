
$fn = 50;

function tolerance(cutout) = cutout ? 0.127 : 0;

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
            r=(87.8 / 2) + tolerance(cutout),
            $fn=250
        );

        color(chassis_color)
        translate([(93.7 / 2) - 3, 0, cutout ? -4 : -3])
        cylinder(
            r=3 + tolerance(cutout),
            h=cutout ? 5 : 4,
            $fn=50
        );
        color(chassis_color)
        translate([-((93.7 / 2) - 3), 0, cutout ? -4 : -3])
        cylinder(
            r=3 + tolerance(cutout),
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

module angled_rect_cut(width, height, angle, depth, overshoot_top=0, overshoot_bottom=0) {

    growth = (depth + overshoot_top) * tan(angle);
    shrinkage = overshoot_bottom * tan(angle);

    difference() {
        hull() {
            // Cube whose bottom face represents the bottom of the cut.
            translate([0, 0, (depth + overshoot_bottom)/-2])
            cube(size=[width - (shrinkage * 2), height - (shrinkage * 2), depth + overshoot_bottom], center=true);

            // Cube whose bottom face represents the top of the cut.
            // (We'll cut this cube off once we're done using it as a basis)
            translate([0, 0, 0.5 + overshoot_top])
            cube(size=[width + (growth * 2), height + (growth * 2), 1], center=true);
        }

        // A slightly bigger cube than the one we used to represent the top, so
        // we eliminate the extra on top and keep just the angled part.
        translate([0, 0, 1 + overshoot_top])
        cube(size=[width + (growth * 2) + 1, height + (growth * 2) + 1, 2], center=true);
    }
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
        four_about_origin(29, 29.5)
        cylinder(h=6.5, r=(3.2/2) + tolerance(cutout));

        if (cutout) {
            translate([0, (23 / 2) - 11.708, 1.6 + 1.4])
            angled_rect_cut(32, 18, 32, 3.429, overshoot_top=1, overshoot_bottom=1);
        }
    }

    if (cutout) {
        holes(cutout);
    }
    else {
        color([0.08, 0.36, 1])
        translate([0, 0, -1.6 - 1.4])
        difference() {
            pcb(35, 35.5, radius=3.5, thickness=1.6);
            holes(cutout);
        }

        color([0, 0, 0])
        translate([0, (23 / 2) - 11.708, -1.4])
        linear_extrude(height=1.45)
        rounded_square(35, 23, 0.001);
    }
}

module rotary_encoder(cutout=false) {
    mechanism_color = [0.8, 0.8, 0.8];
    screw_washer_thickness = 0.5;
    screw_wall_thickness = (3.429 * 0.75) - screw_washer_thickness;

    if (! cutout) {
        color(mechanism_color)
        translate([0, 0, -6.5/2])
        cube([12.5, 13.2, 6.5], center=true);

        color(mechanism_color)
        translate([0, 0, 5])
        difference() {
            cylinder(h=15 - 5, r=6 / 2);

            translate([-5, 0.5, 15 - 5 - 7])
            cube(size=10);
        }

        // Fastening nut, for reference and to show
        // that it can actually screw on given the thickness
        // of the case.
        color(mechanism_color)
        translate([0, 0, screw_wall_thickness + screw_washer_thickness])
        difference() {
            cylinder(r=11 / 2, h=2.27, $fn=6);

            translate([0, 0, -0.5])
            cylinder(r=(7 / 2) - 0.2, h=3);
        }
    }

    color(mechanism_color)
    translate([0, 0, -1])
    cylinder(h=5 + 1 + (cutout ? 5 : 0), r=(7 / 2) + tolerance(cutout));

    if (cutout) {
        translate([0, 0, screw_wall_thickness - tolerance(cutout)])
        cylinder(10, r=(15 / 2) + tolerance(cutout));
    }
}

module overview(cutout) {
    top_feature_height = 59.1566 + 15.0368;
    button_y_offset = 22.7398;
    display_y_offset = -63.3898;
    display_x_offset = -20;
    rotary_encoder_x_offset = 28.5;

    if (! cutout) {
        translate([0, button_y_offset, top_feature_height])
        rotate(90, [0, 0, 1])
        large_button(cutout=false);

        translate([display_x_offset, display_y_offset, top_feature_height - 3.43])
        display_module(cutout=false);

        translate([rotary_encoder_x_offset, display_y_offset, top_feature_height - 3.43])
        rotary_encoder(cutout=false);

    }

    color([0.5, 0.5, 0.5])
    difference() {
        enclosure(base=true, lid=true);

        translate([0, button_y_offset, top_feature_height])
        rotate(90, [0, 0, 1])
        large_button(cutout=true);

        translate([-20, display_y_offset, top_feature_height - 3.43])
        display_module(cutout=true);

        translate([rotary_encoder_x_offset, display_y_offset, top_feature_height - 3.43])
        rotary_encoder(cutout=true);
    }
}

overview(cutout=false);
