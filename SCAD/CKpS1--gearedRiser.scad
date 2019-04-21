include <CKvars.scad>;

//rotate([0,90,0])
CKpS1();

//TODO
//add gear rack

module CKpS1(){
translate([0,-pS1W/2,0]){
difference(){
union(){
hull(){    
cube([pMgroove+pS1T,pS1W,pS1Z]);
translate([0,0,-pPspace1/2])
cube([(pMgroove+pS1T)/2,pS1W/2,1]);
} //end hull
translate([pMgroove,pS1W,pPplate1])
cube([pS1wallT,pS1wallW,pS1Z-pPplate1]);
} //end union
translate([0,0,pPplate1])
 cube([pMgroove,pS1W,pPspace2]); 

translate([0,0,pPplate1+pMH+pPplate3])
 cube([pMgroove,pS1W,pS1Z-(pPplate1+pMH+pPplate3)]); 


translate([0,pS1W/2,-pPspace1/2])
rotate([45,0,0]) 
mirror([0,1,0])
cube([pMgroove+pS1T,pS1W,pS1W]);    

} //end diff
} //end trans
} //end module