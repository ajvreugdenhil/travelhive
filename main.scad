// Official version is 12 mm thick, and 38 mm wide measured between parallel edges (twice the inradius)
// To match official size in x and y, we use `r = cos(30)R` where R is the cirumradius and r is the inradius.
// 38/2 / (sqrt(3)/2) comes out to be 21.93

tile_circumradius = 21.9;
tile_height = 4;

rounding = 2;

show_tile = "all"; // [all, bee, ant, grasshopper, spider, beetle, mosquito, ladybug, pillbug, blank]

/* [Hidden] */

// Images
image_bee = "images/base/bee.svg";
image_beetle = "images/base/beetle.svg";
image_spider = "images/base/spider.svg";
image_ant = "images/base/ant.svg";
image_grasshopper = "images/base/grasshopper.svg";

image_mosquito = "images/expansion/mosquito.svg";
image_ladybug = "images/expansion/ladybug.svg";
image_pillbug = "images/expansion/pillbug.svg";

image_magic_xy = 0.20;

FN = 32;

// --- Start of code ---

// use default fn for editor or fn given by makefile
$fn=FN;

// make all objects for editor
make();

// --- Modules ---

module make() 
{
    if (show_tile == "all")
    {
        // TODO
    }
    else if (show_tile == "bee")
    {
        tile_bee();
    }
    else if (show_tile == "ant")
    {
        tile_ant();
    }
    else if (show_tile == "grasshopper")
    {
        tile_grasshopper();
    }
    else if (show_tile == "beetle")
    {
        tile_beetle();
    }
    else if (show_tile == "spider")
    {
        tile_spider();
    }
    else if (show_tile == "mosquito")
    {
        tile_mosquito();
    }
    else if (show_tile == "ladybug")
    {
        tile_ladybug();
    }
    else if (show_tile == "pillbug")
    {
        tile_pillbug();
    }
    else
    {
        blank_tile();
    }
}

module blank_tile()
{
    hull()
    {
        for (i = [0:(360/6):360])
        {
            rotate([0,0,i])
            translate([tile_circumradius-rounding/2,0,0])
            union()
            {
                translate([0,0,tile_height-rounding/2])
                    sphere(r=rounding/2);
                translate([0,0,rounding/2])
                    sphere(r=rounding/2);
            }
        }
    }
}

module tile(image)
{
    difference()
    {
        blank_tile();
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

module tile_mosquito() // make me
{
    tile(image_mosquito);
}

module tile_ladybug() // make me
{
    tile(image_ladybug);
}

module tile_pillbug() // make me
{
    tile(image_pillbug);
}
