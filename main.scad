/* [Tile sizing] */

tile_radius = 21.16;
tile_height = 4;

/* [Hidden] */

// Images
image_bee = "images/base/bee.png";
image_beetle = "images/base/beetle.png";
image_spider = "images/base/spider.png";
image_ant = "images/base/ant.png";
image_grasshopper = "images/base/grasshopper.png";

image_size = 512;

image_magic_xy = 0.05;
image_magic_z = 0.1;

images_xy_factor = image_magic_xy * 512/image_size;
images_z_factor = image_magic_z;

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

module tile_bee() // make me
{
    tile(image_bee);
}

module tile_beetle() // make me
{
    tile(image_beetle);
}

module tile_spider() // make me
{
    tile(image_spider);
}

module tile_ant() // make me
{
    tile(image_ant);
}

module tile_grasshopper() // make me
{
    tile(image_grasshopper);
}
