include <CKvars.scad>;

CKp8(); //small bearing holder

module CKp8(){
    translate([0,0,0]){
        difference(){
            
 //           cube([p8baseW,p8baseL,pPspace2]);

            hull(){
            translate([0,p8baseW/2,0])
            cylinder(d=p8baseW,h=p8H,$fn=36);

            translate([0,p8baseL-(p8baseW/2),0])
            cylinder(d=p8baseW,h=p8H,$fn=36);
                
            }

            translate([0,p8holeend2C,-0.1])
            cylinder(d=p8holeD,h=p8H+0.2,$fn=36);

            translate([0,p8baseL-p8holeend2C,-0.1])
            cylinder(d=p8holeD,h=p8H+0.2,$fn=36);
            
        } //end main difference
    } //end translate
} //end main module
