include <CKvars.scad>;

CKp8c(); //small bearing holder


module CKp8c(){
    translate([0,0,0]){
        difference(){
            
 //           cube([p8baseW,p8baseL,pPspace2]);

            cylinder(d=10-1,h=p8H,$fn=36);
            
            translate([0,0,-0.1])
            cylinder(d=p8holeD,h=p8H+0.2,$fn=36);
            
        } //end main difference
    } //end translate
} //end main module
