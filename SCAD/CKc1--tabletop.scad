include <CKvars.scad>;
use <CKc2--bottom_surface_motor_gears.scad>;
use <CKp1--motor_gear.scad>;

////TODO
//move Z mounts to corners
//place a Z next to stepper, or on either side
//need to reduce to 380 OD width side to side
//need to reduce wasted space around the edges

c1Sides=6;

c1polyOD=c6OD;  //need to calculate stepper OD later

projection(cut = false)
translate([c1polyOD/2,0,0])
CKc1();


//need to make first Z mount less than 45 if there is room
//make sure to update full assembly

//((p3baseOD/2)+1+((p5wingL)-(p5bearingfromwall+(p5wiggleL/2)+p5boltHeadH)))*2; //length to outside of outter bearing


module CKc1(){
    
echo("c2c of gears",CKp1_pitch_radius+CKc2_pitch_radius);    
    
    rez=p2number*p2needles*2;  //calculate desired rezolution
    $fn=rez; //defines resolution of circles.
    
translate([0,0,0]){            
    difference(){  

//translate([-c1W/2,-c1OD/2,0])
//cube([c1W,c1OD,c1H]);

        
//        union(){
//octogon
      difference(){
              translate([0,0,c1H/2])
    cube([c1polyOD*1.5,c1polyOD*1.5,c1H],center=true);  //use C1OD stepper side, use new number for Z side
          for(i=[1:c1Sides]){
              rotate([0,0,((360/c1Sides)*i)+(360/c1Sides)])
              translate([c1polyOD/2,-c1polyOD/2,0])
              #cube([c1polyOD,c1polyOD,c1H]);
          }
          
//                    for(i=[1]){
//              rotate([0,0,(45*i)+90])
//              translate([c1OD/2,-c1OD/2,0])
//              #cube([c1OD,c1OD,c1H]);
//          }
    
      } //end diff      
               
        cylinder(h=c1H+2,d=p3baseID);  // donut hole

//leg mounting holes
for(i=[1:c1Sides]){
rotate([0,0,((360/c1Sides)*i)+(360/c1Sides)])
translate([(c1polyOD/2)-(woodbeamW/2),0,0]) 
#cylinder(d=woodbeamScrewOD,h=c1H);
}

    //small bearing holder
if(atan((((((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))+(pMshelfX/2)))/((cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)))) > 45){
    
for(i=[1:4]){
    rotate([0,0,(90*i)]){
        translate([0,((p3baseOD/2)+1),0]){ 
            
    //smallbearingholder holes
                translate([-(p5wingW+p5bodyW+p5wingW)/2,0,0]){
        translate([p5wingW+p5bodyW,0,0]){            
        //wing right holes
            translate([p5wingW/2,p5mounthole2back,0])
                cylinder(d=p5mountholeOD,h=c1H+0.1,$fn=36);
                translate([p5wingW/2,p5wingL-p5mounthole2front,0])
                cylinder(d=p5mountholeOD,h=c1H+0.1,$fn=36);
        } //end wing right translate  
        
        //wing left holes
            translate([p5wingW/2,p5mounthole2back,0])
                cylinder(d=p5mountholeOD,h=c1H+0.1,$fn=36);
                translate([p5wingW/2,p5wingL-p5mounthole2front,0])
                cylinder(d=p5mountholeOD,h=c1H+0.1,$fn=36);
    }//end translate - center X of holes
        }//end translate to ring
    }//end for rotate
}//end small bearing holder for    
}else
{
for(i=[1:c2bmounts]){
    rotate([0,0,((360/c2bmounts)*i)]){
        translate([0,((p3baseOD/2)+1),0]){ 
            
    //smallbearingholder holes
                translate([-(p5wingW+p5bodyW+p5wingW)/2,0,0]){
        translate([p5wingW+p5bodyW,0,0]){            
        //wing right holes
            translate([p5wingW/2,p5mounthole2back,0])
                cylinder(d=p5mountholeOD,h=c1H+0.1,$fn=36);
                translate([p5wingW/2,p5wingL-p5mounthole2front,0])
                cylinder(d=p5mountholeOD,h=c1H+0.1,$fn=36);
        } //end wing right translate  
        
        //wing left holes
            translate([p5wingW/2,p5mounthole2back,0])
                cylinder(d=p5mountholeOD,h=c1H+0.1,$fn=36);
                translate([p5wingW/2,p5wingL-p5mounthole2front,0])
                cylinder(d=p5mountholeOD,h=c1H+0.1,$fn=36);
    }//end translate - center X of holes
        }//end translate to ring
    }//end for rotate
}//end small bearing holder for
} //end if-else
    
    //base mounting holes

//spacer mounts
for(i=[1:max(4,c1steppersnumber)]){
    rotate([0,0,((360/(max(4,c1steppersnumber)))/2)+((360/(max(4,c1steppersnumber)))*i)]){
        
rotate([0,0,(p8dD-2)/2])
translate([0,(p8dID/2)+(((p8dOD-p8dID)/2)/2),0])
cylinder(d=p8dboltD,h=c1H, $fn=36);

mirror([1,0,0])
rotate([0,0,(p8dD-2)/2])
translate([0,(p8dID/2)+(((p8dOD-p8dID)/2)/2),0])
cylinder(d=p8dboltD,h=c1H, $fn=36);
    }
}


        //Stepper Mount
for(i=[1:c1steppersnumber]){
rotate([0,0,((360/c1steppersnumber)*i)-(90)])
translate([-(CKp1_pitch_radius+CKc2_pitch_radius),0,0]){
cylinder(d=NEMAfaceCricOD+0.25,h=c1H);
translate([NEMAboltDis/2,NEMAboltDis/2,0])
    cylinder(d=NEMAboltOD,h=c1H);
translate([-NEMAboltDis/2,NEMAboltDis/2,0])
    cylinder(d=NEMAboltOD,h=c1H);
translate([NEMAboltDis/2,-NEMAboltDis/2,0])
    cylinder(d=NEMAboltOD,h=c1H);
translate([-NEMAboltDis/2,-NEMAboltDis/2,0])
    cylinder(d=NEMAboltOD,h=c1H);
}
    
}

//mounting wood beams
    for(i=[1:4]){
translate([(((c1W+(c1W/5))/5)*i)-((c1W+(c1W/5))/2),-(c1OD/2)+(woodbeamW/2),0])
cylinder(d=woodbeamScrewOD,h=c1H);
    }
mirror([0,1,0])
    for(i=[1:4]){
translate([(((c1W+(c1W/5))/5)*i)-((c1W+(c1W/5))/2),-(c1OD/2)+(woodbeamW/2),0])
cylinder(d=woodbeamScrewOD,h=c1H);
    }
    
    for(i=[1:2]){
translate([(c1W/2)-(woodbeamW/2),-(((c1W+(c1W/5))/5)*i)+((c1OD+(c1W/5))/2),0])
cylinder(d=woodbeamScrewOD,h=c1H);
    }
mirror([1,0,0])
    for(i=[1:2]){
translate([(c1W/2)-(woodbeamW/2),-(((c1W+(c1W/5))/5)*i)+((c1OD+(c1W/5))/2),0])
cylinder(d=woodbeamScrewOD,h=c1H);
    }
    
    mirror([0,1,0]){   
    for(i=[1:2]){
translate([(c1W/2)-(woodbeamW/2),-(((c1W+(c1W/5))/5)*i)+((c1OD+(c1W/5))/2),0])
cylinder(d=woodbeamScrewOD,h=c1H);
    }
mirror([1,0,0])
    for(i=[1:2]){
translate([(c1W/2)-(woodbeamW/2),-(((c1W+(c1W/5))/5)*i)+((c1OD+(c1W/5))/2),0])
cylinder(d=woodbeamScrewOD,h=c1H);
    }
    }
           
    }  //end main difference
}  //end main translate

} //end CKc1 module