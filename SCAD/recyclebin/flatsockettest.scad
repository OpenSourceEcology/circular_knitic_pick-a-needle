p2p4flatD=3;
p2p4flatHA=90;
p2p4flatHD=6.72;  //listed as 6.72 max 5.54 min
p2p4flatHH=1.86;


c2ID=400;
//AP=(p2p4flatHD/2)
//PB=p2p4flatHD/2
//CD=c2ID

echo(
"CP",
((c2ID-sqrt((-4*(p2p4flatHD/2)*(p2p4flatHD/2))+((c2ID)*(c2ID))))/2)

);

p2p4flatORmax=((c2ID-sqrt((-4*(p2p4flatHD/2)*(p2p4flatHD/2))+((c2ID)*(c2ID))))/2)/2; //maximum radius to be within c2ID

rotate([0,270,0])
translate([0,0,p2p4flatORmax])
union(){
cylinder(d1=p2p4flatHD,d2=0,h=(p2p4flatHD/2)/tan(45),$fn=36);
translate([0,0,-(p2p4flatHD)/tan(45)])
cylinder(d1=p2p4flatHD*3,d2=p2p4flatHD,h=(p2p4flatHD)/tan(45),$fn=36);
cylinder(d=p2p4flatD,h=20,$fn=36);
}
translate([p2p4flatD/2,0,0])
cube(p2p4flatHH);