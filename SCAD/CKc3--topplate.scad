include <CKvars.scad>;
use <CKp8--plateconnector.scad>
use <CKpM1--mountain.scad>
use <CKc4--weightplate.scad>

use <mb10.scad>;

TF=2;  //2 for optional maker beam holes

projection(cut = false)
CKc3();

projection(cut = false)
CKc4();

/*
translate([0,-c3OD/2,0])
translate([0,p3wallOD/2,-pPspace2])
rotate([0,0,0])
CKpM(0,0,0);
*/

//translate([0,0,c3H])
//rotate([0,0,-90])
//CKp8();

echo((c3OD-c3ID)/2);

module CKc3(){
    
    
    rez=p2number*p2needles*2*2;  //calculate desired rezolution
    $fn=rez; //defines resolution of circles.
    
translate([0,-c3OD/2,0]){     //[c3OD/2,0,0]       
    difference(){  
        
        union(){
            cylinder(h=c3H,d=c3OD);
        } //end main union
        
        cylinder(h=c3H+2,d=c3ID);  // donut hole
 
        //plate connector holes
        
        if(atan((((((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))+(pMshelfX/2)))/((cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)))) > 45){
            
        for(i=[1:2]){
            rotate([0,0,(90*i)+45]){
          
                        translate([0,p8innerboltO2C,-0.1])
                            cylinder(d=p8holeD,h=c3H+0.2,$fn=36);
                        translate([0,p8outerboltO2C,-0.1])
                            cylinder(d=p8holeD,h=c3H+0.2,$fn=36);
 
            } //end rotate i
        } //end for
    }else
    {
                for(i=[1:c2connectors-1]){
            rotate([0,0,((360/c2connectors)*i)]){
          
                        translate([0,p8innerboltO2C,-0.1])
                            cylinder(d=p8holeD,h=c3H+0.2,$fn=36);
                        translate([0,p8outerboltO2C,-0.1])
                            cylinder(d=p8holeD,h=c3H+0.2,$fn=36);
 
            } //end rotate i
        } //end for
    }//end else

//small bearing holder holes to optionally connect through
    if(atan((((((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))+(pMshelfX/2)))/((cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)))) > 45){
    
for(i=[1:3]){
    rotate([0,0,(90*i)]){
        translate([0,((p3baseOD/2)+1),0]){ 
            
    //smallbearingholder holes
                translate([-(p5wingW+p5bodyW+p5wingW)/2,0,0]){
        translate([p5wingW+p5bodyW,0,0]){            
        //wing right holes
            translate([p5wingW/2,p5mounthole2back,0])
                cylinder(d=p5mountholeOD,h=c2H+0.1,$fn=36);
                translate([p5wingW/2,p5wingL-p5mounthole2front,0])
                cylinder(d=p5mountholeOD,h=c2H+0.1,$fn=36);
        } //end wing right translate  
        
        //wing left holes
            translate([p5wingW/2,p5mounthole2back,0])
                cylinder(d=p5mountholeOD,h=c2H+0.1,$fn=36);
                translate([p5wingW/2,p5wingL-p5mounthole2front,0])
                cylinder(d=p5mountholeOD,h=c2H+0.1,$fn=36);
    }//end translate - center X of holes
        }//end translate to ring
    }//end for rotate
}//end small bearing holder for       
} //end if    
        
        //mountain cutout
for(i=[1:numberMountain]){
    rotate([0,0,i*(360/numberMountain)]){
    rotate([0,0,0]){
    translate([-pMbodyXr,0,0])
      cube([(pMbodyXr*2),((c2ID+(pMgroove*2)+(pMwallT*2))/2),c3H]);

translate([-(pMbodyXr),((c2ID+(pMgroove*2)+(pMwallT*2))/2),0])
        translate([pMshelfBoltD/2,0,0])
        cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
        
        mirror([1,0,0])
        translate([-(pMbodyXr),((c2ID+(pMgroove*2)+(pMwallT*2))/2),0])
        translate([pMshelfBoltD/2,0,0])
        cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
    }
        //////
//mountain bolt holes
        rotate([0,0,0]){
            //1
translate([0,(cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),0])
translate([(pMbodyXr+(pMshelfX/2)),0,0])
  cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
            //2
translate([0,(c2ID/2)+pMgroove+pMwallT-(pMshelfBoltD*1.5),0])
translate([(pMbodyXr+(pMshelfX/2)),0,0])
  cylinder(d=pMshelfBoltD, h=pMH, $fn=36);  
                        
        mirror([1,0,0]){
            //1
translate([0,(cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),0])
translate([(pMbodyXr+(pMshelfX/2)),0,0])
  cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
            //2
translate([0,(c2ID/2)+pMgroove+pMwallT-(pMshelfBoltD*1.5),0])
translate([(pMbodyXr+(pMshelfX/2)),0,0])
  cylinder(d=pMshelfBoltD, h=pMH, $fn=36);        
        } //end mirror
    } //end rotate
//end of bolt holes
//////////////
    
       
        
        
        //makerbeam holes
        
    if(TF==2){
translate([(TFW/2)-(10/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)+(10/2),0])

        cylinder(d=3, h=pMH, $fn=36);

mirror([1,0,0])
    translate([(TFW/2)-(10/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)+(10/2),0])
        cylinder(d=3, h=pMH, $fn=36);
    }
}//end mountina for rotate    
}//end mountain for
        
    }  //end main difference


    
}  //end main translate

} //end CKc3 module