include <CKvars.scad>;

use <CKpM--mountain.scad>;
use <mb10.scad>;

//TO DO//
//*add integrated yarn feeder based on needle height
//*function func6 not right? working with 45 angle but not others
//*pMd4 not placing groove properly when not at 45 degrees
///////

//values CKpM(X,X,X) defined as follows:
//render needle path groove 1 == yes, 0 == no
//render thread feeder stand using  0=none  1=angle iron  2=makerbeamm
//render beam and angle of the feed holder yes == 1, no == 0
mirror([0,0,1])
translate([0,0,-(pMgrooveC3+nA-nC-nB+aaX-5)])
CKpM(0,1,1); 

CKpM2();


pM2Dc1=(((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*(((sin(pMd4s)*(pMID/2))-(aaX/2)-(0))))/(pM2H-pM2fH))+(pM2H-pM2fH);
//pM2D=(((((sin(pMd4s)*(pMID/2)+2)))*(((sin(pMd4s)*(pMID/2)+2))))/(pM2H-pM2fH))+(pM2H-pM2fH);

//pM2Dc2=(((((((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4))/2)*((((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4))/2))/(pM2H-tipOpenX))+(pM2H-tipOpenX);

//((((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4))/2)

pM2Dc2=(((((((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4))/2))*(((((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4))/2)))/((pM2H-tipOpenX)))+((pM2H-tipOpenX));

//(((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*(((sin(pMd4s)*(pMID/2))-(aaX/2)-(0))))/(pM2H-pM2fH))+(pM2H-pM2fH);


module CKpM2(){
    
    difference(){
    union(){
translate([0,-p3wallOD/2,]){ //main translate


        translate([(sin(pMd4s)*(pMID/2))-(aaX/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),0])
    difference(){
    minkowski(){
    difference(){
        cube([aaX,aaX,pM2H]);  //cube 
        cube([aaX-aaT,aaX-aaT,pM2H]);
        
    } //end angle iron
cylinder(d=pM2mink,h=0.01, $fn=36);
 } //end minkowski
     }//end difference
 
 mirror([1,0,0])
        translate([(sin(pMd4s)*(pMID/2))-(aaX/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),0])
    difference(){
    minkowski(){
    difference(){
        cube([aaX,aaX,pM2H]);  //cube 
        cube([aaX-aaT,aaX-aaT,pM2H]);
        
    } //end angle iron
cylinder(d=pM2mink,h=0.01, $fn=36);
 } //end minkowski
     }//end difference

minkowski(){
difference(){
 translate([-(sin(pMd4s)*(pMID/2))+(aaX/2)+(0),((c2ID+(pMgroove*2)+(pMwallT*2))/2),0])
    cube([((sin(pMd4s)*(pMID/2))-(aaX/2)-(0))*2,aaT,pM2H]);
 translate([0,((c2ID+(pMgroove*2)+(pMwallT*2))/2),(pM2Dc1/2)+pM2fH])
rotate([270,0,0])
    // AP == PB == ((sin(pMd4s)*(pMID/2))-(aaX/2)-(pM2mink/2))
    // CP == pM2H-pM2fH
    // DIAMETER == CD == (((AP)*(PB))/(CP))+(CP)
    // pM2D=(((((sin(pMd4s)*(pMID/2))-(aaX/2)-(pM2mink/2)))*(((sin(pMd4s)*(pMID/2))-(aaX/2)-(pM2mink/2))))/(pM2H-pM2fH))+(pM2H-pM2fH)
    
#cylinder(d=pM2Dc1,h=aaT,$fn=360);
 
} //end difference
cylinder(d=pM2mink-1,h=0.01, $fn=36);
} //end minkowski


//((tipOpenX+(tipcylD*1.5))/2)

//curved wall
translate([(((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))-((tipcylD*1.5)/2)
,(p2OD/2)+aaT,0]){
minkowski(){
    difference(){
resize([
        ((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4)
        ,((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2
        ])
    cylinder(d=200,h=pM2H,$fn=360);

resize([
        ((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4)-(aaT*2)
        ,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2)-(aaT*2)
        ])
    cylinder(d=200,h=pM2H,$fn=360);
        
        translate([0,-((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2))/2,0])
        #cube([
        (((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4))/2
        ,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2)
        ,pM2H
        ]);

        translate([-(((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4))/2,-((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2))/2,0])
        #cube([
        (((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4))
        ,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2)/2
        ,pM2H
        ]);


translate([-pM2Dc2/2,0,tipOpenX+(pM2Dc2/2)])
rotate([270,0,0])
#cylinder(d=pM2Dc2,h=((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2))/2,$fn=360);


    } //end difference
    
    cylinder(d=pM2mink/3,h=0.01, $fn=18);
} //end minkowski
} //end translate
// end verticle support

//curved wall
mirror([1,0,0])
translate([(((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))-((tipcylD*1.5)/2)
,(p2OD/2)+aaT,0]){
minkowski(){
    difference(){
resize([
        ((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4)
        ,((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2
        ])
    cylinder(d=200,h=pM2H,$fn=360);

resize([
        ((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4)-(aaT*2)
        ,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2)-(aaT*2)
        ])
    cylinder(d=200,h=pM2H,$fn=360);
        
        translate([0,-((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2))/2,0])
        #cube([
        (((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4))/2
        ,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2)
        ,pM2H
        ]);

        translate([-(((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4))/2,-((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2))/2,0])
        #cube([
        (((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4))
        ,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2)/2
        ,pM2H
        ]);


translate([-pM2Dc2/2,0,tipOpenX+(pM2Dc2/2)])
rotate([270,0,0])
#cylinder(d=pM2Dc2,h=((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2))/2,$fn=360);


    } //end difference
    
    cylinder(d=pM2mink/3,h=0.01, $fn=18);
} //end minkowski
} //end translate
// end verticle support


//flat base section
translate([0,(p2OD/2)+aaT,0]){
    difference(){
        translate([-(((sin(pMd4s)*(pMID/2))-(aaX/2)-(0))*2)/2,0,0])
        cube([((sin(pMd4s)*(pMID/2))-(aaX/2)-(0))*2,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2)/2,3]);
        
        translate([(((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))-((tipcylD*1.5)/2),0,0])
        resize([
        ((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4)-(aaT*2)
        ,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2)-(aaT*2)
        ])
    #cylinder(d=200,h=pM2H,$fn=360);

mirror([1,0,0])
        translate([(((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))-((tipcylD*1.5)/2),0,0])
        resize([
        ((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4)-(aaT*2)
        ,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2)-(aaT*2)
        ])
    #cylinder(d=200,h=pM2H,$fn=360);
     
     hull(){
     cylinder(d=tipOpenX,h=pM2H);    
         translate([0,((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2))*2)/2)/4,0])
     cylinder(d=tipOpenX,h=pM2H,$fn=36);    
         
     }
     
        
    } //end difference

} //end translate
//end flat base section






/*
//tip try 1
tipHole=1.5;
translate([-5,p2OD/2,0]){
difference(){
hull(){
    cube([10,1,10]);
    translate([5,-4,5])
    rotate([90,0,0])
    cylinder(d=tipHole+2,h=1,$fn=36);    
}
hull(){
    translate([2,1,2])
    cube([6,1,6]);
    translate([5,-4,5])
    rotate([90,0,0])
    cylinder(d=tipHole,h=1,$fn=36);    
}

} //end tip difference
difference(){
translate([0,0,1])
rotate([0,90,0])
cylinder(d=2.8282,h=10,$fn=360);

translate([0,-3,0])
cube([10,4,3]);
translate([0,-3,-3])
cube([10,8,3]);

} //end bottom roller diff

} //end tip translate
//end tip try 1
*/

//tip try 2
tipHole=1.5;
tipOpenX=10;
tipcylD=1.5;
translate([0,p2OD/2,0]){

hull(){
    translate([tipOpenX/2,0,0])
    cylinder(d=tipcylD*1.5, h=tipOpenX, $fn=36);
    translate([(tipcylD/2)+(tipHole/2),-(tipOpenX/2)+1,(tipOpenX/2)-(nE/2)])
    cylinder(d=tipcylD,h=nE,$fn=36);    
}

mirror([1,0,0])
hull(){
    translate([tipOpenX/2,0,0])
    cylinder(d=tipcylD*1.5, h=tipOpenX, $fn=36);
    translate([(tipcylD/2)+(tipHole/2),-(tipOpenX/2)+1,(tipOpenX/2)-(nE/2)])
    cylinder(d=tipcylD,h=nE,$fn=36);    
}

hull(){
translate([-nE/2,-(tipOpenX/2),(tipOpenX/2)-(nE/2)])
rotate([0,90,0])
cylinder(d=nG,h=nE,$fn=36);    

translate([-(tipOpenX+(tipcylD*1.5))/2,0,0])
rotate([0,90,0])    
cylinder(d=tipcylD*1.5,h=tipOpenX+(tipcylD*1.5),$fn=36);    
}

translate([0,0,(((tipOpenX/2)-(nE/2))*2)+tipHole+(tipcylD/2)])
mirror([0,0,1])
hull(){
translate([-nE/2,-(tipOpenX/2),(tipOpenX/2)-(nE/2)])
rotate([0,90,0])
cylinder(d=nG,h=nE,$fn=36);    

translate([-(tipOpenX+(tipcylD*1.5))/2,0,0])
rotate([0,90,0])    
cylinder(d=tipcylD*1.5,h=tipOpenX+(tipcylD*1.5),$fn=36);    

}

} //end tip translate
//end tip try 2


} //end translate
} //end main union

translate([0,-p3wallOD/2,]){

     translate([(sin(pMd4s)*(pMID/2))-(aaX/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),0]){
 translate([-pM2mink,-pM2mink,pM2H])
#        cube([aaX+(3*2),aaX+(3*2),1]);  //cube 
 
 
 translate([-(pM2slop/2),-(pM2slop/2),0])
     difference(){
        cube([aaX+(pM2slop),aaX+(pM2slop),pM2H]);  //cube 
        cube([aaX-aaT-(pM2slop/4),aaX-aaT-(pM2slop/4),pM2H]);
     }
         
     } //end difference

mirror([1,0,0])     
          translate([(sin(pMd4s)*(pMID/2))-(aaX/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),0]){
 translate([-pM2mink,-pM2mink,pM2H])
#        cube([aaX+(3*2),aaX+(3*2),1]);  //cube 
 
 
 translate([-(pM2slop/2),-(pM2slop/2),0])
     difference(){
        cube([aaX+(pM2slop),aaX+(pM2slop),pM2H]);  //cube 
        cube([aaX-aaT-(pM2slop/4),aaX-aaT-(pM2slop/4),pM2H]);
     }
         
     } //end difference
     
 } //end cut translate
 
} //end main difference

} //end module

