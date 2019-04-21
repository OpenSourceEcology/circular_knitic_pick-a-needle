include <CKvars.scad>;
use <CKc2--bottom_surface_motor_gears.scad>;
use <CKp1--motor_gear.scad>;

////TODO
//move Z mounts to corners
//place a Z next to stepper, or on either side
//need to reduce to 380 OD width side to side
//need to reduce wasted space around the edges


projection(cut = false)
translate([c1W/2,0,0])
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

translate([-c1W/2,-c1OD/2,0])
cube([c1W,c1OD,c1H]);

/*        
//        union(){
//octogon
      difference(){
              translate([-c1zOD/2,-c1zOD/2,0])
    cube([c1zOD,c1zOD,c1H]);  //use C1OD stepper side, use new number for Z side
          for(i=[2:8]){
              rotate([0,0,(45*i)+90])
              translate([c1zOD/2,-c1zOD/2,0])
              #cube([c1zOD,c1zOD,c1H]);
          }
          
                    for(i=[1]){
              rotate([0,0,(45*i)+90])
              translate([c1OD/2,-c1OD/2,0])
              #cube([c1OD,c1OD,c1H]);
          }
    
      } //end diff      
  */          
            
            
        
        cylinder(h=c1H+2,d=p3baseID);  // donut hole
 
    
    //base mounting holes


        //Z bearing mount holes
        for(i=[0:(p7number/2)-1]){
    rotate([0,0,45-((90/((p7number/2)-1))*i)]){
        translate([0,(c3OD/2)-p7bearingfromfront-(p7wiggleL/2)-bearingholderZBW,0]){  
                translate([-p7baseW/2,0,0]){
                // hole 1
            translate([p7mounthole2edge,p7mounthole2edge,0])
            cylinder(d=p7mountholeOD,h=c1H+0.1,$fn=36);        
        // hole 2
            translate([p7baseW-p7mounthole2edge,p7mounthole2edge,0])
            cylinder(d=p7mountholeOD,h=c1H+0.1,$fn=36);
        // hole 3
            translate([p7baseW/2,p7baseL-p7mounthole2edge,0])
            cylinder(d=p7mountholeOD,h=c1H+0.1,$fn=36);        
                }//end translate
                }//end translate
    }//end rotate
}//end for

mirror([0,1,0])
        for(i=[0:(p7number/2)-1]){
    rotate([0,0,45-((90/((p7number/2)-1))*i)]){
        translate([0,(c3OD/2)-p7bearingfromfront-(p7wiggleL/2)-bearingholderZBW,0]){  //close enough?
                translate([-p7baseW/2,0,0]){
                // hole 1
            translate([p7mounthole2edge,p7mounthole2edge,0])
            cylinder(d=p7mountholeOD,h=c1H+0.1,$fn=36);        
        // hole 2
            translate([p7baseW-p7mounthole2edge,p7mounthole2edge,0])
            cylinder(d=p7mountholeOD,h=c1H+0.1,$fn=36);
        // hole 3
            translate([p7baseW/2,p7baseL-p7mounthole2edge,0])
            cylinder(d=p7mountholeOD,h=c1H+0.1,$fn=36);        
                }//end translate
                }//end translate
    }//end rotate
}//end for


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