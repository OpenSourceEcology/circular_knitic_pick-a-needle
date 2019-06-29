PCL04();

module PCL04(){
    
x=36.576;
y=41.402;
z=51.308;

topz=28.448;  ///distance from base to center of top mount hole
top2stroke0=42.7482;
top2stroke1=68.1482;  
plungerholeD=2.4384;
plungercutZ=9.652;
plungercutY=3.556;    
plungertop2c=3.9624;

holeOD=4.1656;
botz=topz-12.7;

D=12.7;

translate([-x/2,-y/2,-topz-top2stroke0])
difference(){
    union(){
cube([x,y,z]);
translate([x/2,y/2,topz])
    difference(){
cylinder(d=D,h=top2stroke0+plungertop2c);
translate([0,D/2,top2stroke0])
rotate([90,0,0])     
#cylinder(d=plungerholeD,h=D);     
translate([-D/2,-plungercutY/2,top2stroke0+plungertop2c-plungercutZ])
#cube([D,plungercutY,plungercutZ]);       
    }
}
translate([23.7998/2,0,0]){
translate([x/2,y,topz])
    rotate([90,0,0])
cylinder(d=holeOD,h=y);

translate([x/2,y,botz])
    rotate([90,0,0])
cylinder(d=holeOD,h=y);
}
translate([-23.7998/2,0,0]){
translate([x/2,y,topz])
    rotate([90,0,0])
cylinder(d=holeOD,h=y);

translate([x/2,y,botz])
    rotate([90,0,0])
cylinder(d=holeOD,h=y);
}


}//end main diff    
    
    
}//end module