//cube(size=65, center=true);

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

module pcb(width, height, radius=0.001) {
    linear_extrude(height=1.6)
    rounded_square(width, height, radius);
}

module rounded_square(width, height, radius) {
    hull()
    {
        translate([radius, radius, 0])
        circle(r=radius);

        translate([width - radius, radius, 0])
        circle(r=radius);

        translate([radius, height - radius, 0])
        circle(r=radius);

        translate([width - radius, height - radius, 0])
        circle(r=radius);
   }
}

module circle_cutout_square(width, height, radius) {
    difference() {
        scale([width, height, 0])
        square();

        circle(r=radius);

        translate([width, 0, 0])
        circle(r=radius);

        translate([0, height, 0])
        circle(r=radius);

        translate([width, height, 0])
        circle(r=radius);
   }
}

module enclosure(base=true, lid=true) {
    main_color=[0.5, 0.5, 0.5];
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
        translate([vert_inner_cut_offset, wall_thickness, 0])
        rounded_square(width - (vert_inner_cut_offset * 2), depth - (wall_thickness * 2), 1.27);

        translate([wall_thickness, horiz_inner_cut_offset, 0])
        rounded_square(width - (wall_thickness * 2), depth - (horiz_inner_cut_offset * 2), 1.27);

        translate([15.9258, 6.2484, 0])
        circle_cutout_square(88.2396, 187.6298, inner_concave_radius);
    }

    color(main_color) {
        if (base) {
            difference() {
                linear_extrude(height=base_height)
                rounded_square(width, depth, corner_radius);

                translate([0, 0, floor_thickness])
                linear_extrude(height=base_height + 1)
                cavity();
            }

            translate([width / 2, depth / 2, floor_thickness])
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

module overview() {
    translate([120.2182 / 2, 74.250 + 49.25, 59.1566 + 15.0368])
    rotate(90, [0, 0, 1])
    large_button(cut_only=false);

    difference() {
        enclosure(base=true, lid=true);

        translate([120.2182 / 2, 74.250 + 49.25, 59.1566 + 15.0368])
        rotate(90, [0, 0, 1])
        large_button(cutout=true);
    }
}

overview();

