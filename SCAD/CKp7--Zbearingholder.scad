include <CKvars.scad>;

rotate([0,90,0])
CKp7(0); //small bearing holder

module CKp7(B){
    translate([-p7baseW/2,0,0]){
        difference(){
        union(){
        cube([p7baseW,p7baseL,p7baseH]);
            
        cube([p7baseW,p7baseL/2,p7baseH+p7mountnutH]);    
   
        translate([0,(p7baseL/2)-(p7wallW/2),0])
        cube([p7baseW,p7wallW,bearingholderZB2C+(p7mountH/2)]);
        
        translate([0,(p7baseL/2)-(p7wallW/2)-p7mountL,bearingholderZB2C-(p7mountH/2)])
        cube([p7baseW,p7mountL,p7mountH]);
            
            //diagnal brace
            translate([0,((p7baseL-p7wallW)/2)+p7wallW,p7baseH]){
         difference(){   
         cube([p7baseW,(p7baseL-p7wallW)/2,bearingholderZB2C*2/3]);
             translate([0,(p7baseL-p7wallW)/2,0])
         rotate([1/tan(((bearingholderZB2C*2/3))/((p7baseL-p7wallW)/2)),0,0])
         cube([p7baseW,bearingholderZB2C*2,bearingholderZB2C*2]);    
         } //end brace translate
         } //end brace difference
        } //end main union
        
        //bore hole
                translate([(p7baseW)/2,((p7baseL/2)-(p7wallW/2)-p7mountL)-0.1,bearingholderZB2C])
                rotate([270,0,0])
                cylinder(d=bearingholderZBID,h=p7mountL+p7wallW+0.2,$fn=36);
        
//bearing cutout       
                translate([((p7baseW)/2)-((bearingholderZBOD+p7wiggleW)/2),(p7baseL/2)-(p7wallW/2)-p7mountL+p7bearingfromfront,bearingholderZB2C-(p7mountH/2)-0.1])
            cube([bearingholderZBOD+p7wiggleW,bearingholderZBW+p7wiggleL,p7mountH+0.2]);
       
        
        ////mount holes
        
        // hole 1
            translate([p7mounthole2edge,p7mounthole2edge,0])
            cylinder(d=p7mountholeOD,h=p7baseH+0.1,$fn=36);        
        // hole 2
            translate([p7baseW-p7mounthole2edge,p7mounthole2edge,0])
            cylinder(d=p7mountholeOD,h=p7baseH+0.1,$fn=36);
        // hole 3
            translate([p7baseW/2,p7baseL-p7mounthole2edge,0])
                cylinder(d=p7mountholeOD,h=p7baseH+0.1,$fn=36);      
            translate([p7baseW/2,p7baseL-p7mounthole2edge,p7baseH])
                cylinder(d=p7mountholeHeadOD,h=bearingholderZB2C+(p7mountH/2),$fn=36);      
        // hole 1 hex head
            translate([p7mounthole2edge,p7mounthole2edge,p7baseH])
            cylinder(d=p7mountnutOD,h=p7mountnutH+0.1,$fn=6);        
        // hole 2 hex head
            translate([p7baseW-p7mounthole2edge,p7mounthole2edge,p7baseH])
            cylinder(d=p7mountnutOD,h=p7mountnutH+0.1,$fn=6);
    
    
    
    
    } //end main difference
    
                    //bearing
if(B==1){
  translate([p7baseW/2,p7bearingfromfront+(p7wiggleL/2),bearingholderZB2C])
  rotate([270,0,0])
  difference(){
    cylinder(d=bearingholderSmallBOD,h=bearingholderSmallBW, $fn=36);
    cylinder(d=bearingholderSmallBID,h=bearingholderSmallBW, $fn=36);
  }


  //bolt
translate([p7baseW/2,0,bearingholderZB2C])
rotate([-90,0,0])
rotate([0,0,360/6])
CKbolt(p7boltD,p7boltL,p7boltHeadH,p7boltHeadOD);

  //nut
translate([p7baseW/2,((p7baseL-p7wallW)/2)+p7wallW,bearingholderZB2C])
rotate([-90,0,0])
rotate([0,0,360/6])
CKnut(p7boltD,p7nutH,p7boltHeadOD);

} //end if


    } //end main translate
} //end main module


module CKbolt(D,BL,HH,HSD){  
    cylinder(d=D,h=BL,$fn=32);

    fudge = 1/cos(180/(6));
   translate([0,0,-HH])
   rotate([0,0,360/6/2])         
   cylinder(h=HH,r=HSD/2*fudge,$fn=(6));
    }
    
module CKnut(BD,H,SD){ 

    fudge = 1/cos(180/(6));
   difference(){ 

   translate([0,0,0])
   rotate([0,0,360/6/2])         
   cylinder(h=H,r=SD/2*fudge,$fn=(6));

    cylinder(d=BD,h=H,$fn=32);
   }
    }    
    
