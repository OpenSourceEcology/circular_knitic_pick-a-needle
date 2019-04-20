include <CKvars.scad>;
p2Gap=(p2W+(p3wiggle*2));

translate([-p2Gap-1,0,-p3ridgeH])
cube([1,1,p3ridgeH])

echo(
"degree",
atan((nH-nY-(nC/2))/(nB+(nC/2)))
);

echo(
"small side",
sqrt((nH-nY-(nC/2))*(nH-nY-(nC/2))+(nB+(nC/2))*(nB+(nC/2)))
);

echo(
"small degree",
asin((nC/2)/(sqrt((nH-nY-(nC/2))*(nH-nY-(nC/2))+(nB+(nC/2))*(nB+(nC/2)))))
);

echo("nB",nB);

sitDeg=((atan((nH-nY-(nC/2))/(nB+(nC/2))))+(asin((nC/2)/(sqrt((nH-nY-(nC/2))*(nH-nY-(nC/2))+(nB+(nC/2))*(nB+(nC/2)))))));

sitH=(p2Gap- ( (sin(sitDeg)*(sin(sitDeg)*nY))  +  (cos(sitDeg)*nY)  ))/tan(sitDeg);

/*
trvH=min(
((p2Gap- ( (sin(i)*(sin(i)*nY))  +  (cos(i)*nY)  ))/tan(i))
,
nH
);
*/

translate([0,0,0])
for(i=[0:0.1:sitDeg]){
translate([0,0,
    -
    min(
    ((p2Gap- ( (sin(sitDeg-i)*(sin(sitDeg-i)*nY))  +  (cos(sitDeg-i)*nY)  ))/tan(sitDeg-i))
    ,
    (nB/1.5)  //could replace with groove p3 groove height
    )
    ])
rotate([0,-sitDeg+i,0])
translate([(nH)-(nC/2),0,nB+(nC/2)])
union(){
translate([-nH+(nC/2),p3grooveW/2,0])
rotate([90,0,0])
hull(){    
    cylinder(d=nC,h=p3grooveW,$fn=36);
    translate([nH-(nC),0,0])
    cylinder(d=nC,h=p3grooveW,$fn=26);   
} //end hull

translate([-nH,-p3grooveW/2,-(nC/2)-nB])
cube([nY,p3grooveW,nC+nB]);
}

}