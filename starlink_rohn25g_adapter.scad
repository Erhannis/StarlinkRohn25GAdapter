/**
Run get_deps.sh to clone dependencies into a linked folder in your home directory.
*/

use <deps.link/BOSL/nema_steppers.scad>
use <deps.link/BOSL/joiners.scad>
use <deps.link/BOSL/shapes.scad>
use <deps.link/erhannisScad/misc.scad>
use <deps.link/erhannisScad/auto_lid.scad>
use <deps.link/scadFluidics/common.scad>
use <deps.link/quickfitPlate/blank_plate.scad>
use <deps.link/getriebe/Getriebe.scad>
use <deps.link/gearbox/gearbox.scad>

$FOREVER = 1000;
DUMMY = false;
$fn = DUMMY ? 10 : 60;

SLOP = 0.5;
SL_BIG_D = 38.22+SLOP;
SL_SMALL_D = 36+SLOP;
SL_SMALL_H = 60.71;
// Assuming 45* slope between small and big
SL_H = 120;
SL_BOTTOM_T = 5;
SL_OVERHANG_SLOP = 1; // Extra room to account for sagging in the overhang
SL_BUTTON_D = 14; // 12.5, with wiggle room
SL_BUTTON_OZ = 5.4;

PIPE_ID = 47.8; // 47-48; kinda compromising
PIPE_LIP_T = 2.5;
PIPE_LIP_H = 10;

SL_BOTTOM_RAIN_D = SL_SMALL_D-PIPE_LIP_T*2;

// Real
difference() {
    union() {
        cylinder(d=PIPE_ID,h=SL_H+SL_OVERHANG_SLOP+SL_BOTTOM_T);
        cylinder(d=PIPE_ID+PIPE_LIP_T*2,h=PIPE_LIP_H);
    }
    intersection() {
        cylinder(d=SL_BIG_D,h=$FOREVER);
        union() {
            tz(SL_H-SL_SMALL_H) cylinder(d=SL_SMALL_D,h=SL_SMALL_H+SL_OVERHANG_SLOP);
            cylinder(d1=SL_SMALL_D+2*(SL_H-SL_SMALL_H),d2=SL_SMALL_D,h=SL_H-SL_SMALL_H);
        }
    }
    tz(SL_H-SL_SMALL_H+SL_BUTTON_D/2+SL_BUTTON_OZ) teardrop(d=SL_BUTTON_D,l=$FOREVER);
    cylinder(d=SL_BOTTOM_RAIN_D, h=$FOREVER);
    //OXp();
}

// Inner mock
*difference() {
    union() {
        minkowski() {
            intersection() {
                cylinder(d=SL_BIG_D,h=$FOREVER);
                union() {
                    tz(SL_H-SL_SMALL_H) cylinder(d=SL_SMALL_D,h=SL_SMALL_H+SL_OVERHANG_SLOP);
                    cylinder(d1=SL_SMALL_D+2*(SL_H-SL_SMALL_H),d2=SL_SMALL_D,h=SL_H-SL_SMALL_H);
                }
            }
            tz(0.5) cube(size=1,center=true);
        }
        cylinder(d=SL_BIG_D+8,h=1);
    }
    cylinder(d=SL_BIG_D,h=10,center=true);
    intersection() {
        cylinder(d=SL_BIG_D,h=$FOREVER);
        union() {
            tz(SL_H-SL_SMALL_H) cylinder(d=SL_SMALL_D,h=SL_SMALL_H+SL_OVERHANG_SLOP);
            cylinder(d1=SL_SMALL_D+2*(SL_H-SL_SMALL_H),d2=SL_SMALL_D,h=SL_H-SL_SMALL_H);
        }
    }
    tz(SL_H-SL_SMALL_H+SL_BUTTON_D/2+SL_BUTTON_OZ) teardrop(d=SL_BUTTON_D,l=$FOREVER);
    cylinder(d=SL_BOTTOM_RAIN_D, h=$FOREVER);
    //OXp();
}

// Outer mock
*difference() {
    union() {
        cylinder(d=PIPE_ID,h=SL_H+SL_OVERHANG_SLOP+SL_BOTTOM_T);
        cylinder(d=PIPE_ID+PIPE_LIP_T*2,h=PIPE_LIP_H);
    }
    cylinder(d=PIPE_ID-1,h=SL_H+SL_OVERHANG_SLOP+SL_BOTTOM_T);
    intersection() {
        cylinder(d=SL_BIG_D,h=$FOREVER);
        union() {
            tz(SL_H-SL_SMALL_H) cylinder(d=SL_SMALL_D,h=SL_SMALL_H+SL_OVERHANG_SLOP);
            cylinder(d1=SL_SMALL_D+2*(SL_H-SL_SMALL_H),d2=SL_SMALL_D,h=SL_H-SL_SMALL_H);
        }
    }
    tz(SL_H-SL_SMALL_H+SL_BUTTON_D/2+SL_BUTTON_OZ) teardrop(d=SL_BUTTON_D,l=$FOREVER);
    cylinder(d=SL_BOTTOM_RAIN_D, h=$FOREVER);
    //OXp();
}