include <CKvars.scad>;

use <CKneedle.scad>;

use <CKp1--motor_gear.scad>;
use <CKp2--inner.scad>;
use <CKp3--outer.scad>;
use <CKp4--yardHolder.scad>;
use <CKp5--smallbearingholder.scad>;
use <CKp7--Zbearingholder.scad>;
use <CKp8--plateconnector.scad>;
use <CKp8d--plateconnector-bottomStand.scad>;
use <CKp9--outerconnector.scad>;
use <CKpM1--mountain.scad>;
use <CKpS1--gearedRiser.scad>;

use <CKc1--tabletop.scad>;
use <CKc2--bottom_surface_motor_gears.scad>;
use <CKc3--topplate.scad>;
use <CKc5--pick_a_needle.scad>;
use <CKc6-lowerplate.scad>;

/*
//needle
rotate([0,0,0]){  //-(360/p2number*p2needles)/2

//needle at lowest position - on top of geared plate    
translate([0,0,-nB+(pPspace1+pPplate1)])
rotate([0,0,-((360/p2number/p2needles)*3.5)+((360/p4number))])  //(360/(p2number*p2needles))*1
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

//needle below plate
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC1-nC)])
rotate([0,0,((360/(p2number*p2needles))*1)-((360/p2number/p2needles)*3.5)+((360/p4number))])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

//needle below push down
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC2-nC)])
rotate([0,0,((360/(p2number*p2needles))*2)-((360/p2number/p2needles)*3.5)+((360/p4number))])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

//needle at top of groove
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC3-nC-(pMgrooveD-nC))])
rotate([0,0,((360/(p2number*p2needles))*3)-((360/p2number/p2needles)*3.5)+((360/p4number))])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

//needle above PaN plate
translate([0,0,-nB+(pPspace1+pPplate1+pMH+pPplate3)])
rotate([0,0,((360/(p2number*p2needles))*4)-((360/p2number/p2needles)*3.5)+((360/p4number))])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();


} //end needle rotate
*/



//c1 - table top
translate([0,0,-c2H-pPspace1-c1H])
CKc1();



//pS1 - pick a needle
rotate([0,0,0])
translate([pMID/2,0,pPspace1])
CKpS1();

mirror([1,0,0])
rotate([0,0,0])
translate([pMID/2,0,pPspace1])
CKpS1();

//stepper
translate([(pMID/2)+pMgroove,0,c5H+1])
translate([0,-33-(pS1W/2)-5,pPspace1+pPplate1+pMH])
cube([42,33,42]);


//p8d - outer plate connector
for(i=[1:max(4,c1steppersnumber)]){
rotate([0,0,((360/(max(4,c1steppersnumber)))/2)+((360/(max(4,c1steppersnumber)))*i)])
translate([0,0,-c2H-pPspace1])
CKp8d(); 
}

//////////////////
//ROTATING SECTION

rotate([0,0,0]){

//c2 - geared plate
translate([0,c2OD/2,-c2H])
CKc2();

//c6 - mountain base
translate([0,c6OD/2,pPspace1])
CKc6();

//c3 - mountain insert
translate([0,c3OD/2,pPspace1+pPspace2])
CKc3();

//c5 - pick-a-needle off plate
translate([0,c3OD/2,pPspace1+pPplate1+pMH])
CKc5();    


//p8
translate([0,0,pPspace1+pPplate1])
        for(i=[1:c2connectors-1]){
            rotate([0,0,((360/c2connectors)*i)]){
                translate([0,(pMID/2)+(pMgroove)+1+(p8baseL/2),0]){          
                        translate([0,-p8baseL/2,-0.1])
                        CKp8();
                }//end translate
            }//end rotate
        }//end for


/*
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC3-nC-(pMgrooveD-nC))])
rotate([0,0,-90])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();
*/

    } //end rotate
    //END ROTATING SECTION
    //////////////////////
    
    