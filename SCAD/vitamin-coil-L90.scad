PCL90();

module PCL90(){
    
x=41.91;
y=46.228;
z=66.802;

topz=37.3126;  ///distance from base to center of top mount hole
top2stroke0=38.354;
top2stroke1=70.104;  
plungerholeD=2.4384;
plungercutZ=9.652;
plungercutY=3.556;    

holeOD=4.1656;
botz=topz-25.4;

D=12.7;

difference(){
    union(){
cube([x,y,z]);
translate([x/2,y/2,topz])
    difference(){
cylinder(d=D,h=top2stroke0+(plungerholeD)+1);
translate([0,D/2,top2stroke0])
rotate([90,0,0])     
#cylinder(d=plungerholeD,h=D);     
translate([-D/2,-plungercutY/2,top2stroke0+(plungerholeD)+1-plungercutZ])
#cube([D,plungercutY,plungercutZ]);       
    }
}
translate([x/2,0,topz])
    rotate([90,0,0])
cylinder(d=holeOD,h=y);

translate([x/2,0,botz])
    rotate([90,0,0])
cylinder(d=holeOD,h=y);


}//end main diff    
    
    
}//end module