/* [Tile sizing] */

tile_radius = 21.16;
tile_height = 4;

rounding = 2;

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
    tile_bee();
}

module tile(image)
{
    difference()
    {
        hull()
        {
            for (i = [0:(360/6):360])
            {
                rotate([0,0,i])
                translate([tile_radius-rounding/2,0,0])
                union()
                {
                    translate([0,0,tile_height-rounding/2])
                        sphere(r=rounding/2);
                    translate([0,0,rounding/2])
                        sphere(r=rounding/2);
                }
            }
        }

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
