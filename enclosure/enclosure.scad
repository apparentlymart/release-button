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

module enclosure_base() {
	corner_radius = 5.969;
	width = 120.2182;
	depth = 199.9996;
   height = 59.1566;
	wall_thickness = 3.4036;
	floor_thickness = 3.429;

	inner_convex_radius = 1.27;
	inner_concave_radius = 7.0104;

   // These two don't seem right since the resulting edges don't line
   // up with the curve created by the inner_concave_radius arcs
	vert_inner_cut_offset = 22.9362;
	horiz_inner_cut_offset = 13.2588;

   difference() {
		linear_extrude(height=height)
		rounded_square(width, depth, corner_radius);

		/*translate([wall_thickness, wall_thickness, floor_thickness])
		linear_extrude(height=height + 1) {
			translate([vert_inner_cut_offset, 0])
			rounded_square(width - (vert_inner_cut_offset * 2), depth - (wall_thickness * 2), 1.27);

			translate([0, horiz_inner_cut_offset])
			rounded_square(width - (wall_thickness * 2), depth - (horiz_inner_cut_offset * 2), 1.27);

		}*/

		translate([0, 0, floor_thickness])
		linear_extrude(height=height + 1) {
			translate([vert_inner_cut_offset, wall_thickness, 0])
			rounded_square(width - (vert_inner_cut_offset * 2), depth - (wall_thickness * 2), 1.27);

			translate([wall_thickness, horiz_inner_cut_offset, 0])
			rounded_square(width - (wall_thickness * 2), depth - (horiz_inner_cut_offset * 2), 1.27);
		}

		translate([15.9258, 6.2484, floor_thickness])
		linear_extrude(height=height + 1)
		circle_cutout_square(88.2396, 187.6298, inner_concave_radius);

	}

	module pcb_mounting_screw() {
		translate([-45.2247, -80.5434, 0])
		cylinder(
			r=7.1628 / 2,
			h=4.826
		);
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

module enclosure_lid() {

}

//pi();
//medium_button();
//pcb(38, 29, radius=3.5);

//projection(cut=true)
//translate([0, 0, -3.44])
enclosure_base();


