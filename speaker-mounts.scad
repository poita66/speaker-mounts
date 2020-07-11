
// Note: Everything is in millimeters

tube_inner_height = 25;
tube_inner_width = 45;
tab_len = 40;
rise_height = 80;
bar_stock_thickness = 5;
bar_stock_width = 32;
top_plate_overhang_x = 10;
top_plate_overhang_y = 10;
top_plate_width =
    tube_inner_width + top_plate_overhang_x + bar_stock_thickness;
top_plate_thickness = 2;
top_plate_length = bar_stock_width + top_plate_overhang_y;
tab_hole_size = 8;

difference()
{
    cube([ bar_stock_thickness, tab_len, tube_inner_height ]);    
    tab_hole();    
}

translate([ 0, tab_len, 0 ])
    cube([ bar_stock_thickness, bar_stock_width, rise_height ]);

translate([ tube_inner_width-bar_stock_thickness*2, 0, 0 ]) difference()
{
    cube([ bar_stock_thickness, tab_len, tube_inner_height ]);
    tab_hole();
}

translate([ tube_inner_width-bar_stock_thickness*2, tab_len, 0 ])
    cube([ bar_stock_thickness, bar_stock_width, rise_height ]);

translate([
    -1*top_plate_overhang_x,
    tab_len + bar_stock_width - top_plate_length,
    rise_height
]) cube([ top_plate_width, top_plate_length, top_plate_thickness ]);

module
tab_hole()
{
    translate([ -1, 10, tube_inner_height / 2 ]) rotate([ 0, 90, 0 ])
        cylinder(h = bar_stock_thickness + 2, d = tab_hole_size);
}