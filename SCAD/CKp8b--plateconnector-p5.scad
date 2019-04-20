include <CKvars.scad>;

CKp8b(); //small bearing holder

p8BbaseL=(p5wingL-p5mounthole2back-p5mounthole2front)+(p8holeend2C*2);

module CKp8b(){
    translate([0,0,0]){
        difference(){
            
 //           cube([p8baseW,p8baseL,pPspace2]);

            hull(){
            translate([0,p8baseW/2,0])
            cylinder(d=p8baseW,h=p8H,$fn=36);

            translate([0,p8BbaseL-(p8baseW/2),0])
            cylinder(d=p8baseW,h=p8H,$fn=36);
                
            }

            translate([0,p8holeend2C,-0.1])
            cylinder(d=p8holeD,h=p8H+0.2,$fn=36);

            translate([0,p8BbaseL-p8holeend2C,-0.1])
            cylinder(d=p8holeD,h=p8H+0.2,$fn=36);
            
        } //end main difference
    } //end translate
} //end main module
