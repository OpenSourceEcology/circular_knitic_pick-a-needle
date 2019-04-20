include <CKvars.scad>;

//rotate([0,90,0])
CKpS1(0);

module CKpS1(){

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



 
    

} //end diff
} //end module