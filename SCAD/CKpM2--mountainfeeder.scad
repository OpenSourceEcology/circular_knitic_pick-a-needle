include <CKvars.scad>;

use <CKneedle.scad>;
use <CKpM1--mountain.scad>;
use <mb10.scad>;

translate([0,0,-pM2mink/8/2])
CKpM2();

/*
translate([0,-p3wallOD/2,0]) //main translate
translate([0,0,-nA])
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC3-nC-(pMgrooveD-nC))])
rotate([0,0,-90])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();
*/

wXtrans=pMbodyXr-pMshelfchamfR-(aaX-aaT);  //(sin(pMd4s)*(pMID/2))-(aaX/2)

module CKpM2(){
    
    difference(){
    union(){
translate([0,-p3wallOD/2,0]){ //main translate

        translate([wXtrans,((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),0])
    difference(){
    minkowski(){
        union(){
    difference(){
        cube([aaX,aaX,pM2H]);  //cube 
        cube([aaX-aaT,aaX-aaT,pM2H]);
        
    } //end angle iron
  translate([0,aaX,0])  
    #cube([aaX,aasqNutH+3,pM2H]);

} //end union
sphere(d=pM2mink, $fn=10);  //,h=0.01  $fn=72
 } //end minkowski
     }//end difference
 
 mirror([1,0,0])
        translate([wXtrans,((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),0])
    difference(){
    minkowski(){
        union(){
    difference(){
        cube([aaX,aaX,pM2H]);  //cube 
        cube([aaX-aaT,aaX-aaT,pM2H]);
        
    } //end angle iron
  translate([0,aaX,0])  
    #cube([aaX,aasqNutH+3,pM2H]);

} //end union
sphere(d=pM2mink, $fn=10);  //,h=0.01  $fn=72
 } //end minkowski
     }//end difference
     
     
     
     minkowski(){
     difference(){
     
         //main wall between supports 
     translate([-M2inX/2,((c2ID+(pMgroove*2)+(pMwallT*2))/2)+aaT,pM2mink/2])
 mirror([0,1,0])
     cube([M2inX,M2inY,M2inZ]);    
     
         //right side cylinder cut
     translate([M2inX/2,M2backwallOD-M2inY,0])    
     resize([M2inX-(tipOpenX),(M2inY-aaT)*2])
    cylinder(d=200,h=pM2H,$fn=72);
         
         //left side cylinder cut
         mirror([1,0,0])
     translate([M2inX/2,M2backwallOD-M2inY,0])    
     resize([M2inX-(tipOpenX),(M2inY-aaT)*2])
    cylinder(d=200,h=pM2H,$fn=72);
         
         //main cylinder cut
translate([0,M2backwallOD,M2inZ])
rotate([90,0,0])
              resize([M2inX,(M2inZ-tipOpenZ+(pM2mink/2))*2])
    cylinder(d=200,h=M2inY,$fn=72);
    
    //thread entrance cut
    translate([0,M2backwallOD-M2inY,0])
              hull(){
     cylinder(d=tipOpenX,h=pM2H);    
         translate([0,((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)/2)/4,0])
     cylinder(d=tipOpenX,h=pM2H,$fn=72);    
         
     }
         
         }//end diff
         
         sphere(d=pM2mink,$fn=10);
     } //end mink


//tip try 2

translate([0,M2backwallOD-M2inY,0]){  //(p2OD/2)+(tipOpenX/2)

hull(){
    //right back
    translate([tipOpenX/2,0,(tipcylD*1.5/2)])
    cylinder(d=tipcylD*1.5, h=tipOpenZ-(tipcylD*1.5), $fn=36);
    //right front
    translate([(tipcylD/2)+(tipHole/2),-(tipOpenX/2)+1,(tipOpenX/2)-(nE/2)]) //?
    cylinder(d=tipcylD,h=(tipcylD/2)+tipHole+(tipcylD/2),$fn=36);    
}

mirror([1,0,0])
hull(){
    //left back
    translate([tipOpenX/2,0,(tipcylD*1.5/2)])
    cylinder(d=tipcylD*1.5, h=tipOpenZ-(tipcylD*1.5), $fn=36);
    //left front
    translate([(tipcylD/2)+(tipHole/2),-(tipOpenX/2)+1,(tipOpenX/2)-(nE/2)])
    cylinder(d=tipcylD,h=(tipcylD/2)+tipHole+(tipcylD/2),$fn=36);    
}




hull(){
//bottom front   
translate([-(tipcylD+tipHole+tipcylD)/2,-(tipOpenX/2)+(tipcylD/2),((tipOpenZ-tipHole)/2)-(tipcylD/2)])
rotate([0,90,0])
cylinder(d=tipcylD,h=tipcylD+tipHole+tipcylD,$fn=36);    
    //center sphere bottom back
    translate([cos(90)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(90)*(tipOpenX/2)*0.5),tipcy2D/2])    
    translate([0,-tipOpenX/2,0])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=8);
//center sphere bottom back
mirror([1,0,0])
    translate([cos(90)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(90)*(tipOpenX/2)*0.5),tipcy2D/2])    
    translate([0,-tipOpenX/2,0])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=8);
} //end full

for(i=[0:90]){
hull(){
//bottom back
    translate([cos(i)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(i)*(tipOpenX/2)*0.5),tipcy2D/2])    
    translate([0,-tipOpenX/2,0])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=8);
//bottom front
translate([((tipcylD+tipHole+tipcylD)/2)-0.1,-(tipOpenX/2)+(tipcylD/2),((tipOpenZ-tipHole)/2)-(tipcylD/2)])
rotate([0,90,0])
cylinder(d=tipcylD,h=0.1,$fn=36);     //change from nG to something else?
} //end hull
} //end for

mirror([1,0,0])
for(i=[0:90]){
hull(){
//bottom back
    translate([cos(i)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(i)*(tipOpenX/2)*0.5),tipcy2D/2])    
    translate([0,-tipOpenX/2,0])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=8);
//bottom front
translate([((tipcylD+tipHole+tipcylD)/2)-0.1,-(tipOpenX/2)+(tipcylD/2),((tipOpenZ-tipHole)/2)-(tipcylD/2)])
rotate([0,90,0])
cylinder(d=tipcylD,h=0.1,$fn=36);     //change from nG to something else?
} //end hull
} //end for






hull(){
//top front
translate([-(tipcylD+tipHole+tipcylD)/2,-(tipOpenX/2)+(tipcylD/2),tipOpenZ-((tipOpenZ-tipHole)/2)+(tipcylD/2)])
rotate([0,90,0])
cylinder(d=tipcylD,h=tipcylD+tipHole+tipcylD,$fn=36);     //change from nG to something else?
//center sphere top back
    translate([cos(90)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(90)*(tipOpenX/2)*0.5),-tipcy2D/2])    
    translate([0,-tipOpenX/2,tipOpenZ])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=18);
//center sphere top back
mirror([1,0,0])
    translate([cos(90)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(90)*(tipOpenX/2)*0.5),-tipcy2D/2])    
    translate([0,-tipOpenX/2,tipOpenZ])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=18);
} //end full


for(i=[0:90]){
hull(){
//top back
    translate([cos(i)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(i)*(tipOpenX/2)*0.5),-tipcy2D/2])    
    translate([0,-tipOpenX/2,tipOpenZ])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=18);



//top front
translate([((tipcylD+tipHole+tipcylD)/2)-0.1,-(tipOpenX/2)+(tipcylD/2),tipOpenZ-((tipOpenZ-tipHole)/2)+(tipcylD/2)])
rotate([0,90,0])
cylinder(d=tipcylD,h=0.1,$fn=36);     //change from nG to something else?


} //end hull
} //end for

mirror([1,0,0])
for(i=[0:90]){
hull(){
//top back
    translate([cos(i)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(i)*(tipOpenX/2)*0.5),-tipcy2D/2])    
    translate([0,-tipOpenX/2,tipOpenZ])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=18);



//top front
translate([((tipcylD+tipHole+tipcylD)/2)-0.1,-(tipOpenX/2)+(tipcylD/2),tipOpenZ-((tipOpenZ-tipHole)/2)+(tipcylD/2)])
rotate([0,90,0])
cylinder(d=tipcylD,h=0.1,$fn=36);     //change from nG to something else?

  
} //end hull
} //end for


hull(){
    translate([cos(0)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(0)*(tipOpenX/2)*0.5),-tipcy2D/2])    
    translate([0,-tipOpenX/2,tipOpenZ])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=18);
    
           translate([tipOpenX/2,((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)/2)/4,tipOpenZ-(pM2mink/2)])
         sphere(d=pM2mink,$fn=10);
}
mirror([1,0,0])
hull(){
    translate([cos(0)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(0)*(tipOpenX/2)*0.5),-tipcy2D/2])    
    translate([0,-tipOpenX/2,tipOpenZ])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=18);
    
           translate([tipOpenX/2,((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)/2)/4,tipOpenZ-(pM2mink/2)])
         sphere(d=pM2mink,$fn=10);
}


//bottom fade to wall
hull(){
    translate([cos(0)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(0)*(tipOpenX/2)*0.5),tipcy2D/2])    
    translate([0,-tipOpenX/2,0])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=8);
    
           translate([tipOpenX/2,((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)/2)/4,(pM2mink/2)])
         sphere(d=pM2mink,$fn=10);
}
mirror([1,0,0])
hull(){
    translate([cos(0)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(0)*(tipOpenX/2)*0.5),tipcy2D/2])    
    translate([0,-tipOpenX/2,0])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=8);
    
           translate([tipOpenX/2,((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)/2)/4,(pM2mink/2)])
         sphere(d=pM2mink,$fn=10);
}


} //end tip translate
//end tip try 2



} //end translate
} //end main union


//cut slot for angle iron in sliding section
translate([0,-p3wallOD/2,]){

     translate([wXtrans,((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),0]){
 translate([-pM2mink,-pM2mink,pM2H])
#        cube([aaX+(3*2),aaX+(3*2),pM2mink]);  //cube 
 
 
 translate([-(pM2slop/2),-(pM2slop/2),0])
     difference(){
        cube([aaX+(pM2slop),aaX+(pM2slop),pM2H]);  //cube 
        cube([aaX-aaT-(pM2slop/4),aaX-aaT-(pM2slop/4),pM2H]);
     }
      
  
  translate([(aaX/2)-((aasqNutW+NEMAsqNutSlop)/2),aaX,0])  
 #cube([aasqNutW+NEMAsqNutSlop,aasqNutH+NEMAsqNutSlop,aasqNutW+NEMAsqNutSlop+2]);
 
 translate([(aaX/2),aaX,2+(aasqNutW+NEMAsqNutSlop)/2])  
     rotate([270,0,0])
 #cylinder(d=aaboltD,h=aaX,$fn=36);    
     
     translate([0,0,pM2H])
     mirror([0,0,1]){
       translate([(aaX/2)-((aasqNutW+NEMAsqNutSlop)/2),aaX,0])  
 #cube([aasqNutW+NEMAsqNutSlop,aasqNutH+NEMAsqNutSlop,aasqNutW+NEMAsqNutSlop+2]);
 
 translate([(aaX/2),aaX,2+(aasqNutW+NEMAsqNutSlop)/2])  
     rotate([270,0,0])
 #cylinder(d=aaboltD,h=aaX,$fn=36);  
     
     }
     
     } //end difference

mirror([1,0,0])     
          translate([wXtrans,((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),0]){
 translate([-pM2mink,-pM2mink,pM2H])
#        cube([aaX+(3*2),aaX+(3*2),pM2mink]);  //cube 
 
 
 translate([-(pM2slop/2),-(pM2slop/2),0])
     difference(){
        cube([aaX+(pM2slop),aaX+(pM2slop),pM2H]);  //cube 
        cube([aaX-aaT-(pM2slop/4),aaX-aaT-(pM2slop/4),pM2H]);
     }
     
     
       translate([(aaX/2)-((aasqNutW+NEMAsqNutSlop)/2),aaX,0])  
 #cube([aasqNutW+NEMAsqNutSlop,aasqNutH+NEMAsqNutSlop,aasqNutW+NEMAsqNutSlop+2]);
 
 translate([(aaX/2),aaX,2+(aasqNutW+NEMAsqNutSlop)/2])  
     rotate([270,0,0])
 #cylinder(d=aaboltD,h=aaX,$fn=36);    
     
     translate([0,0,pM2H])
     mirror([0,0,1]){
       translate([(aaX/2)-((aasqNutW+NEMAsqNutSlop)/2),aaX,0])  
 #cube([aasqNutW+NEMAsqNutSlop,aasqNutH+NEMAsqNutSlop,aasqNutW+NEMAsqNutSlop+2]);
 
 translate([(aaX/2),aaX,2+(aasqNutW+NEMAsqNutSlop)/2])  
     rotate([270,0,0])
 #cylinder(d=aaboltD,h=aaX,$fn=36);  
     
     }
         
     } //end difference
     
     
     
 } //end cut translate

translate([-M2inX*2,-M2inY*2,pM2mink/8/2])
mirror([0,0,1]) 
cube([M2inX*4,M2inY*4,pM2mink]);

translate([-M2inX*2,-M2inY*2,pM2H])
cube([M2inX*4,M2inY*4,pM2mink]);


 
} //end main difference

} //end module

