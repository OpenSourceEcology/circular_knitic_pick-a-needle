include <CKvars.scad>;

//translate(0,p8dOD/2,0)
CKp8d(); //bottom stand

module CKp8d(){

difference(){
union(){
rotate([0,0,p8dD/2])
translate([0,(p8dID/2)+(((p8dOD-p8dID)/2)/2),0])
cylinder(d=((p8dOD-p8dID)/2),h=pPspace1+pPplate2+pPspace1);    

mirror([1,0,0])
rotate([0,0,p8dD/2])
translate([0,(p8dID/2)+(((p8dOD-p8dID)/2)/2),0])
cylinder(d=((p8dOD-p8dID)/2),h=pPspace1+pPplate2+pPspace1);    
    
    difference(){
cylinder(d=p8dOD,h=p8dH, $fn=90);
cylinder(d=p8dID,h=p8dH, $fn=90);

rotate([0,0,-p8dD/2]) 
translate([0,-p8dOD,0])       
cube([p8dOD*2,p8dOD*2,p8dH]);
    
mirror([1,0,0])        
rotate([0,0,-p8dD/2]) 
translate([0,-p8dOD,0])       
cube([p8dOD*2,p8dOD*2,p8dH]);        

        
    } //end diff
} //end union

rotate([0,0,(p8dD-2)/2])
translate([-(p8dsqNutW+p8dsqNutSlop)/2,-(p8dOD+2)/2,5])
#cube([p8dsqNutW+p8dsqNutSlop,p8dOD+2,p8dsqNutH+p8dsqNutSlop]);

rotate([0,0,(p8dD-2)/2])
translate([-(p8dsqNutW+p8dsqNutSlop)/2,-(p8dOD+2)/2,p8dH-5-(p8dsqNutH+p8dsqNutSlop)])
#cube([p8dsqNutW+p8dsqNutSlop,p8dOD+2,p8dsqNutH+p8dsqNutSlop]);

rotate([0,0,(p8dD-2)/2])
translate([0,(p8dID/2)+(((p8dOD-p8dID)/2)/2),0])
cylinder(d=p8dboltD,h=p8dH, $fn=36);

mirror([1,0,0]){
    
rotate([0,0,(p8dD-2)/2])
translate([-(p8dsqNutW+p8dsqNutSlop)/2,-(p8dOD+2)/2,5])
#cube([p8dsqNutW+p8dsqNutSlop,p8dOD+2,p8dsqNutH+p8dsqNutSlop]);

rotate([0,0,(p8dD-2)/2])
translate([-(p8dsqNutW+p8dsqNutSlop)/2,-(p8dOD+2)/2,p8dH-5-(p8dsqNutH+p8dsqNutSlop)])
#cube([p8dsqNutW+p8dsqNutSlop,p8dOD+2,p8dsqNutH+p8dsqNutSlop]);

rotate([0,0,(p8dD-2)/2])
translate([0,(p8dID/2)+(((p8dOD-p8dID)/2)/2),0])
cylinder(d=p8dboltD,h=p8dH, $fn=36);

}


rotate([0,0,0])
translate([-(p8dsqNutW+p8dsqNutSlop)/2,-(p8dOD+2)/2,p8dH-(p8dsqNutH+p8dsqNutSlop)])
#cube([p8dsqNutW+p8dsqNutSlop,p8dOD+2,p8dsqNutH+p8dsqNutSlop]);

translate([0,(p8dID/2)+(((p8dOD-p8dID)/2)/2),p8dH/2])
cylinder(d=p8dboltD,h=p8dH, $fn=36);




} //end diff


    
} //end module