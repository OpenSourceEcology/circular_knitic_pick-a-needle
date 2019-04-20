include <CKvars.scad>;

//use <CKp1.scad>;
use <CKp2--inner.scad>;
use <CKp3--outer.scad>;
use <CKp4--yardHolder.scad>;
use <CKp5--smallbearingholder.scad>;
use <CKp6--bigbearingholder.scad>;
use <CKp7--Zbearingholder.scad>;
use <CKp8--plateconnector.scad>;
use <CKp9--outerconnector.scad>;
use <CKpM--mountain.scad>;

use <CKc1--tabletop.scad>;
use <CKc2--bottom_surface_motor_gears.scad>;
//use <CKc3.scad>;


//p2
for(i=[1:p2number]){
    rotate([0,0,i*(360/p2number)])
    translate([-p2OD/2,0,0])
    CKp2();
}

//p3
for(i=[1:p3number]){
    rotate([0,0,i*(360/p3number)])
    translate([-p3baseOD/2,0,0])
    CKp3();
}

//p4
for(i=[1:p4number]){
    rotate([0,0,i*(360/p4number)])
    translate([-(p4baseOD/2)+((p4baseW-p4basegapW)/2),0,0])
    CKp4();
}

//p5

//p6

//p7

//p8

//p9
for(i=[1:p3number]){
    rotate([0,0,i*(360/p3number)])
    translate([-p3baseOD/2,0,(p2holeH+p3baseH)+(p9H/2)])
    rotate([0,0,180])
    CKp9();
}

//pM
////CKpM();
