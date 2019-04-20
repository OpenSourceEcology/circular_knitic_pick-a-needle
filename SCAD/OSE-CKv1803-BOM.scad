include <CKvars.scad>;

use <CKneedle.scad>;

use <CKp1--motor_gear.scad>;
use <CKp2--inner.scad>;
use <CKp3--outer.scad>;
use <CKp4--yardHolder.scad>;
use <CKp5--smallbearingholder.scad>;
//use <CKp6--bigbearingholder.scad>;
use <CKp7--Zbearingholder.scad>;
use <CKp8--plateconnector.scad>;
use <CKp9--outerconnector.scad>;
use <CKpM1--mountain.scad>;

use <CKc1--tabletop.scad>;
use <CKc2--bottom_surface_motor_gears.scad>;
use <CKc3--topplate.scad>;

echo("===Bill of Materials===");

//needle
echo("Needles:", p2number*p2needles);


//c1
//Wood Mount Screws
echo("c1 Wood Screws","Size:",woodbeamScrewOD,"x",c1H+6,"mm","Count:",(16));
  
echo("c1 Stepper Socket Cap Screws","Size: M",NEMAboltOD,"x",c1H+4,"mm","Count:",(c1steppersnumber*4));


//p1 - motor gear
echo("p1 Bolts","Size: M",NEMAsetboltOD,"x",NEMAsetboltL,"mm","Count:",(c1steppersnumber));
//M3 Base Nuts
echo("p1 Square Nuts","Size: M",NEMAsetboltOD,"Count:",(c1steppersnumber));

//p2 - inner wall needle guide
//see p3

//p3 - outer wall

//M3 Base Bolts - 12
echo("p3 Bolts","Size: M",p3baseholeD,"x",ceil((p3baseH+table_surface+p3baseholeD+1)/2)*2,"mm","Count:",(p3number*p3baseholenumber));
//M3 Base Nuts
echo("p3 Nuts","Size: M",p3baseholeD,"Count:",(p3number*p3baseholenumber));


echo("p3/p9 Socket Cap Screws","Size: M",p2holeD,"x",p9thickness+p3upperwallW+p2W+(p2p3flatD/6)-0.1+p2p3nutH,"mm","Count:",p3number*4);
echo("p3/p2 Socket Cap Screws","Size: M",p2holeD,"x",p3upperwallW+p2W+(p2p3flatD/6)-0.1+p2p3nutH,"mm","Count:",(p2number*2)-(p3number*2));


//p9 - connector for p3
//see p3

//p4 - yard holder at top
//M2 Flat Socket Cap Srews
echo("p4 Flat Socket Cap Screws","Size: M",p2p4flatD,"x",
((p4baseOD-p4baseID)/2)+p2p4nutH,"mm","Count:",p2number*2);


//p7 Z
//M3 Base Bolts - 12
echo("p7 Bolts","Size: M",p7mountholeOD,"x",ceil((p7baseH+table_surface+p7mountholeOD-0.25)/2)*2,"mm","Count:",(p7number*3));
//M3 Base Nuts
echo("p7 Nuts","Size: M",p7mountholeOD,"Count:",(p7number*3));

////////////////lock nut size?


//M5 Bearing Mount Bolt
echo("p7 Bearing Bolts","Size: M",p7boltD,"x",p7boltL,"mm","Count:",p7number);

//M5 Bearing Mount Nut
echo("p7 Bearing Nuts","Size: M",p7boltD,"Count:",p7number);

//Bearing  (bore 5mm x 10mm x 4mm)
echo("p7 Bearings","Bore:",bearingholderZBID,"x","OD:",bearingholderZBOD,"x","Width:",bearingholderZBW,"Count:",(p7number));


//////////////////
//ROTATING SECTION

//rotate([0,0,360/c2connectors/2]){

//c2
//translate([0,c3OD/2,pPspace1])
//CKc2();

//c3
//translate([0,c3OD/2,pPspace1+pPplate1+pPspace2])
//CKc3();

//p5 - small bearing holder
//M3 mounts
echo("p5 Mount Bolts","Size: M",p5mountholeOD,"x",ceil((p5wingH+bottom_surface_motor_gearsH+p5mountholeOD-0.25)/2)*2,"mm","Count:",(c2bmounts*4));
//M5 bearing bolt
echo("p5 Bearing Bolts","Size: M",p5boltD,"x",p5boltL,"mm","Count:",(c2bmounts));


//p8
//M3
echo("p8 Mount Bolts","Size: M",p8boltD,"x",ceil((upper_surfaceH+p8H+bottom_surface_motor_gearsH+p8nutH)/2)*2,"mm","Count:",((c2connectors-1)*2));



//mountain
echo("pM Top Plate Connector","Size: M",pMshelfBoltD,"x",ceil((pMshelfH+pMshelfBoltD)/2)*2,"mm","Count:",4);

    //If using angle iron
//Bolt Through Mountain
echo("pM angle iron Mount Bolts","Size: M",p8boltD,"x",ceil((((((pMID/2)-(cos(pMd4s)*(pMID/2)))+pMwallT+pMgroove)-(sin(pMd4s)*(aaboltHD))-2-aaboltHH)+p8boltD+aaT)/2)*2,"mm","Count:",2);
//Bolt Through Peg - remove if new mount works
echo("pM angle iron TopMount Bolts","Size: M",p8boltD,"x",ceil((aaX+p8boltD)/2)*2,"mm","Count:",2);

    