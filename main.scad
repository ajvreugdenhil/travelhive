/* [Tile sizing] */

tile_radius = 21.16;
tile_height = 1;

/* [Hidden] */

// Images
image_bee = "images/base/bee.png";
image_beetle = "images/base/beetle.png";
image_spider = "images/base/spider.png";
image_ant = "images/base/ant.png";
image_grasshopper = "images/base/grasshopper.png";

images_xy_factor = 0.05;
images_z_factor = 0.1;

FN = 32;

// --- Start of code ---

// use default fn for editor or fn given by makefile
$fn=FN;

// make all objects for editor
make();

// --- Modules ---

module make() {
    tile_bee();
}

module tile(image)
{
    // move back up to 0 height
    translate([0,0,tile_height])
    // rotate the entire tile so there is no overhang with fuzzy images
    rotate([0,180,0])
    difference()
    {
        // abuse cylinder to make a hexagon
        // the radius determines the points of the shape
        cylinder(r=tile_radius, h=tile_height, $fn=6);

        // the image
        translate([0,0,tile_height])
        scale([images_xy_factor,images_xy_factor,images_z_factor])
        surface(file = image, center=true, invert=true);
    }
}

module tile_bee() // Make me
{
    tile(image_bee);
}
