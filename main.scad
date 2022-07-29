/* [Tile sizing] */

tile_radius = 21.16;
tile_height = 4;

/* [Hidden] */

// Images
image_bee = "images/base/bee.svg";
image_beetle = "images/base/beetle.svg";
image_spider = "images/base/spider.svg";
image_ant = "images/base/ant.svg";
image_grasshopper = "images/base/grasshopper.svg";

image_magic_xy = 0.20;

FN = 32;

// --- Start of code ---

// use default fn for editor or fn given by makefile
$fn=FN;

// make all objects for editor
make();

// --- Modules ---

module make() {
    tile_spider();
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
        scale([image_magic_xy,image_magic_xy,1])
        linear_extrude(height=tile_height)
        import(image, center=true);
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
