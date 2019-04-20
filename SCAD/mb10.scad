mbL=10;

MB10(mbL);

module MB10(bmL){
    
for(i=[1:4]){
    rotate([0,0,90*i]){
mbCorner();    

mirror(1,0,0)
mbCorner();    
    }
}
}

module mbCorner(){
bmX=10;
bmCX=4;
cornerD=0.2;
innerD=0.4;
armD1=1;
armD2=1.3;
boltD=3;
hull(){
translate([(bmX/2)-(cornerD/2),(bmX/2)-(cornerD/2),0])
    cylinder(d=cornerD, h=mbL, $fn=36);
translate([(bmX/2)+(cornerD/2)-3.5,(bmX/2)-(cornerD/2),0])    
    cylinder(d=cornerD, h=mbL, $fn=36);
    
translate([(bmX/2)+(cornerD/2)-3.5,(bmX/2)+(cornerD/2)-1,0])
    cylinder(d=cornerD, h=mbL, $fn=36);
translate([(bmX/2)-(cornerD/2),(bmX/2)+(cornerD/2)-1,0])    
    cylinder(d=cornerD, h=mbL, $fn=36);
}

hull(){
translate([(bmX/2)-(armD1/2),(bmX/2)-(armD1/2),0])
    cylinder(d=armD1, h=mbL, $fn=36);
translate([(cos(45)*((boltD+armD2)/2)),(cos(45)*((boltD+armD2)/2)),0])
    cylinder(d=armD2, h=mbL, $fn=36);
}

translate([(bmX/2)-2.276,(bmX/2)-1-(innerD/2),0])
difference(){
    union(){
    rotate([0,0,45])
    translate([innerD,0,mbL/2])
    #cube([innerD*2,innerD*2,mbL],center=true);   
    }
    cylinder(d=innerD,h=mbL,$fn=36);
    
    translate([-innerD/2,0,mbL/2])
    #cube([innerD,innerD,mbL],center=true);

}


difference(){
translate([-(bmCX/2),-(bmCX/2),0])
cube([bmCX,bmCX,mbL]);
cylinder(d=boltD,h=mbL,$fn=36);
}    
    } //end corner module
