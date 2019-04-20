include <CKvars.scad>;

CKp3();

echo("p3wallH",p3wallH);

module CKp3(){
    
    rez=p2number*p2needles*2;
    //p2number*p2needles*2
    //p2number*2*2;
    
    $fn=rez; //defines resolution of circles.

    centerlineD=p2ID+(p2W+(p3wiggle*2));
    
    
    echo(centerlineD); 
    
    
    translate([p3baseOD/2,0,0]){
        
    
    difference(){  
        union(){
    cylinder(h=p3baseH,d=p3baseOD);
        
            difference(){
                    cylinder(h=p3ridgeH+p3baseH,d=centerlineD-((p2W+(p3wiggle*2)/2)));
                translate([0,0,p3baseH])
                cylinder(h=p3ridgeH,d1=centerlineD-(p3ridgeW2*2)-((p2W+(p3wiggle*2)/2)),d2=centerlineD-(p3ridgeW1*2)-((p2W+(p3wiggle*2)/2)));
                
            }
            
                        difference(){
                                            translate([0,0,p3baseH])
                       cylinder(h=p3wallchamfH,d1=centerlineD+((p3wallchamfW+p3wallW)*2)+((p2W+(p3wiggle*2)/2)),d2=centerlineD+(p3wallW*2)+((p2W+(p3wiggle*2)/2)));
                    cylinder(h=p3wallchamfH+p3baseH,d=centerlineD+((p2W+(p3wiggle*2)/2)));

 
                
            }
            
                                    difference(){
                                            
                       cylinder(h=p3wallH,d=centerlineD+(p3wallW*2)+((p2W+(p3wiggle*2)/2)));
                    cylinder(h=p3wallH,d=centerlineD+((p2W+(p3wiggle*2)/2)));

 
                
            }
            
            
        } //end main union
    cylinder(h=p3wallH,d=p3baseID);
    translate([-p3baseOD/2,-p3baseOD/2,0]){    
    cube([p3baseOD,p3baseOD/2,p3wallH]);
    }
    rotate([0,0,-360/p3number]){
    translate([-p3baseOD/2,0,0])    
    cube([p3baseOD,p3baseOD/2,p3wallH]);        
    }

        //slots
    
        for(i=[1:p2needles*(p2number/p3number)]){
        rotate([0,0,(360/p2number/p2needles/2)-(360/p2number/p2needles*i)]){
        translate([((-centerlineD-(p3wallW*2)-((p2W+(p3wiggle*2)/2)))/2)-0.1,-p3grooveW/2,p3grooveH1])
   cube([p3wallW+0.2,p3grooveW,p3grooveH2-p3grooveH1]);
        }
    }
    
    //base needle holes
    
    for(i=[1:p2needles*(p2number/p3number)]){
        rotate([0,0,(360/p2number/p2needles/2)-(360/p2number/p2needles*i)]){
        translate([-p2OD/2,-needleWidth/2,-0.01])
   cube([p2needlegrooveDepth,needleWidth,p3wallH+0.02]);
        }
    }
    
    //base mounting holes
    
        for(i=[1:p3baseholenumber]){
        rotate([0,0,(((360/p3number/p3baseholenumber))/2)-((360/p3number/p3baseholenumber)*i)]){
        translate([-(p3baseID/2)-p3baseholefromODID,0,0])
   cylinder(h=p3baseH,d=p3baseholeD,$fn=18);
        }
    }

        for(i=[1:p3baseholenumber]){
        rotate([0,0,(((360/p3number/p3baseholenumber))/2)-((360/p3number/p3baseholenumber)*i)]){
        translate([-(p3baseOD/2)+p3baseholefromODID,0,0])
   cylinder(h=p3baseH,d=p3baseholeD,$fn=18);
        }
    }    
    
  //first and last holes

        rotate([0,0,-(360/p2number/p2needles)*2]){
        translate([((-centerlineD-(p3wallW*2)-((p2W+(p3wiggle*2)/2)))/2)-0.1,0,p2holeH+p3baseH])
            rotate([0,90,0]){

   cylinder(h=p2OD-p2ID+0.2, d=p2holeD, $fn=18);
            }
        } 
        
        rotate([0,0,-(360/(p3number))+((360/p2number/p2needles)*2)]){
        translate([((-centerlineD-(p3wallW*2)-((p2W+(p3wiggle*2)/2)))/2)-0.1,0,p2holeH+p3baseH])
            rotate([0,90,0]){

   #cylinder(h=p2OD-p2ID+0.2, d=p2holeD, $fn=18);
            }
        } 
    
    //middle holes
    
        for(i=[0:(p2number/p3number)-1]){
         rotate([0,0,(-360/p2number/p2needles)+(i*-360/p2number)]){
        translate([((-centerlineD-(p3wallW*2)-((p2W+(p3wiggle*2)/2)))/2)-0.1,0,p2holeH+p3baseH])
            rotate([0,90,0]){
   cylinder(h=p2OD-p2ID+0.2, d=p2holeD,$fn=18);
            }
        }       
    } //end for
        
        for(i=[0:(p2number/p3number)-1]){
                rotate([0,0,(-360/p2number/p2needles*(p2needles-1))+(i*-360/p2number)]){
        translate([((-centerlineD-(p3wallW*2)-((p2W+(p3wiggle*2)/2)))/2)-0.1,0,p2holeH+p3baseH])
            rotate([0,90,0]){
   cylinder(h=p2OD-p2ID+0.2, d=p2holeD, $fn=18);
            }
        } 
    }//end for
        
        //end middle holes
        
    }
}
    
    
} //end module