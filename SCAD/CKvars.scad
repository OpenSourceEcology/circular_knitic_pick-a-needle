
//////////////////////////////////////
///// Circular Knitic Variables //////
//////////////////////////////////////


//////////////////////////////////////
///////  CHOOSE MAIN SETTINGS  ///////

//select the needle size file that will be used
include <CKvarsNeedle-KH260.scad>;

//select the settings profile file
include <CKvarsProfile_36in_201906.scad>;

//////////////////////////////////////






//////////////////////////////////////
///////   ADVANCED SETTINGS    ///////

//number of "p2" parts around circle                          //Jan2019  //small
p2number=UPp2number;        //12                //36  ///36   //12       //8

//number of needles mounted on each "p2" part
p2needles=UPp2needles;      //5                 //10  ///5    //5        //7

//number of "p3" parts around circle
p3number=UPp3number;        //4                 //18  ///4    //4        //2

//number of "p4" parts around circle
p4number=UPp4number;        //4                 //18  ///4    //4        //2

//distance from the inside face of one needle to the next
needle2needle=UPneedle2needle; //default=14.35615             //13.5334  //9.25

//number of mountains aka number of thread spools being used at a time
numberMountain=UPnumberMountain;

//calculated diameter from inside edge of needles
p2needlegrooveID=((needle2needle*p2number*p2needles)/PI);


//nnumber of Z bearing mounts
c1zmounts=max(p3number,4);           //p3number  //4

c1steppersnumber=UPc1steppersnumber;  //number of stepper motors driving the gear

c1Sides=max(6,c1steppersnumber);  //number of sides of plate


Td=5; //tooth depth-ish? - used to calculate # teeth large gear and pitch

////MATERIALS////

//thread diameter
threadD=UPthreadD;
//approx fabric circumference
echo("estimated fabric circumference", threadD*2*1.3*p2number*p2needles);

//thread feeder stand above mountain
TF=UPTF;    //  0=none  1=angle iron  2=makerbeamm
TFW=60;  //distance between outside edge of makerbream
aaX=UPaaX;   //12.7 = 1/2in
aaT=UPaaT;    //1.5875 = 1/16in
aaboltD=3;
aaboltHD=5.68;
aaboltHH=3;
aanutH=4;
aasqNutW=5.5;
aasqNutH=1.8;
aasqNutSlop=0.25;
pM2slop=0.35;
pM2H=aaX*3;
pM2mink=4;
pM2fH=10;
tipHole=3;    //hole Size 
tipOpenX=10;
tipOpenZ=10;
tipcylD=1.75;  //1.5
tipcy2D=tipcylD*1.5;


//-(tipOpenX/2)+(tipcylD/2)

//thickness of upper rotating plate  ///5  //6.35= 1/4"inch
upper_surfaceH=UPupper_surfaceH;  
//thickness of geared rotating plate
bottom_surface_motor_gearsH=UPbottom_surface_motor_gearsH;  
//thickness of plate of main table
table_surface=UPtable_surface;  
//thickness of support board below main table
table_support=UPtable_support;

woodbeamW=UPwoodbeamW; //table leg wood beam width  1.0 inch
woodbeamScrewOD=UPwoodbeamScrewOD;   // 1/4" screw hole

////PART SETTINGS////

//plate 
pPplate1=bottom_surface_motor_gearsH;  //thickness of geared plated
pPplate2=upper_surfaceH;
pPplate3=upper_surfaceH;

/*
//"connector0912" connects upper_surface plate to bottom_surface geared plate
connector0912H=12;
connector0912L=25;
connector0912W=8;
connector0912HoleOD=3;   //hole diameter
connector0912HoleC2C=17; //center of hole to center of other hole
*/

//p5 BearringSmall1312_x_4.stl
bearingholderSmallB2C=5.5;  //from base of bearing holder to center of bearing
bearingholderSmallBOD=10;   //Outside Diameter of bearing
bearingholderSmallBID=4.9;    //Inside Diameter of bore hole of bearing
bearingholderSmallBW=4;     //Width of bearing
bearingholderSmallgaproll=0.05; //extra space to leave below bearing for rolling
bearingholderSmallgapclear=0.5; //extra space to leave above bearing inside holder


//BearringZ
bearingholderZBOD=10;   //Outside Diameter of bearing
bearingholderZBID=4.9;    //Inside Diameter of bore hole of bearing
bearingholderZBW=4;     //Width of bearing  //4

//p1 - stepper gear
NEMAshaftOD=5;
NEMAshaftCut=0.5;
NEMAshaftL=20;   //length of shaft from motor face
NEMAshaftFL=15;  //length of flat side of shaft

NEMAboltOD=3;
NEMAboltHeadH=3;
NEMAboltHeadOD=5.68;
NEMAboltHexOD=2.87;
NEMAfaceCricOD=22;
NEMAboltDis=31;
NEMAmotorW=42;

NEMAsetboltL=8;  //length of M3 botl used for set screw
NEMAsetboltOD=3;
NEMAsetHeadOD=5.68;
NEMAsqNutW=5.5;
NEMAsqNutH=1.8;
NEMAsqNutSlop=0.25;


spurgearTn=16;  //number of teeth on bull gear

//p2 - inner needle wall holder
needleWidthslop=0.4;  //exta thickness
needleWidth=nX+needleWidthslop;
p2needlegroovefromID=2.0;
p2ID=p2needlegrooveID-(p2needlegroovefromID*2);
p2needlegrooveDepthslop=0.4;  //exta thickness
p2needlegrooveDepth=nY+p2needlegrooveDepthslop;
//p2H calculated below;
p2W=p2needlegroovefromID+p2needlegrooveDepth;
p2OD=p2ID+(p2W*2);
//p2holeH calculated below
p2holeD=2;  //depricate
p2holeCSD=4.01726;  //depricate
p2holeCSL=1.5;  //depricate
p2endtrim=0.5;  //trim end of wall to give room between p2's
p2p3boltType=2;  //1 = reg cap screw, 2 = flat cap screw
//type 1
p2p3boltD=3;
p2p3boltHH=3;
p2p3boltHD=5.68;
//type 2
p2p3flatD=3;
p2p3flatHA=90;
p2p3flatHD=6.72;  //listed as 6.72 max 5.54 min
p2p3flatHH=1.86;
p2p3nutH=4;
p2p3nutOD=6.01;

p2p4type=0;  //0 for regular, 1 for flat
p2p4flatD=2;
p2p4boltD=2;
p2p4flatHA=90; //angle between head's slopes
p2p4flatHD=6.72;  //listed as 6.72 max 5.54 min
p2p4boltHD=4.16;  //head Diameter
p2p4flatHH=1.86;
p2p4boltHH=2;  //head height
p2p4nutH=1.6;

echo("p2 lower bolt L",p2W+p3upperwallW+0); //fix
echo("p2ID", p2ID);

//p3 - outer needle wall slide
p3wiggle=0.1;
p3baseH=3; //height of outer base
p3wallW=(nH-nY)/2;  //half of needle butt
p3upperwallW=3;
p3baseholeD=3;
p3baseholeScrewHeadD=5.68;
p3baseholefromODID=p3baseholeScrewHeadD/2;
p3baseholenumber=4;
p3ridgeW1=3;
p3ridgeW2=5;
p3ridgeH=5;
p3wallholefromtop=5;
p3wallchamfW=2;
p3wallchamfH=3;
//p3wallH in calculations below
//p3grooveH1 in calculations below
//p3grooveH2 in calculations below
p3grooveHslop=1;
p3grooveWslop=0.8;  //extra Width in needle groove
p3grooveW=nX+p3grooveWslop;
p3clear=5;   //distance from top of p3 to needle flipper in down position
p3baseID2N=2; //clearance between baseID and needles
p3baseID=p2OD+(p3baseID2N*2);
p3baseOD=p2OD+(p3wiggle*2)+(p3wallW*2)+(p3wallchamfW*2)+(p3baseholeScrewHeadD*2); 
centerlineD=p2ID+(p2W+(p3wiggle*2));
p3wallOD=centerlineD+(p3wallW*2)+((p2W+(p3wiggle*2)/2));
p3wallID=centerlineD+((p2W+(p3wiggle*2)/2));
p3base45W=p3ridgeW2+p3wiggle+p2W+p3wiggle+p3baseID2N;
p3base45H=p3base45W; //height of 45 degree overhang
p3needleholefactorW=1.5; //multiply width of needle tail hole in base by this
p3endtrim=0.5;

//p4
p4rampH=14.57;
p4rampfromID=2.5;
p4rampoverhangH=4;
p4rsH=p4rampH-p4rampoverhangH;  //height of ramp surface
p4rampfromOD=1.34;
p4rampC1=10;
p4rampC2=40;
p4rampC2transX=10;
p4rampC2transZ=3.82;
p4basegapH=max(p2p4flatD*3,8);
p4baseH=p4basegapH+nD;  //sin(45) of angle from front of needle??
p4baseW=11.2;
p4basegapW=p2W+0.2; //5.09
p4clawW=min((needle2needle-(nX*2)),9);
p4holesnumber=3;
p4holeH=p4basegapH/2;
p4rampW=max(min(p4clawW-3,4),2.5);
p4rampMinkD=(p4rampW/3)*2;  //minkoski diameter 
p4rampWm=p4rampW-p4rampMinkD;
p4clear=-0.5;  //distance above top of p4 from flipper in down position //need to fix -0.5?  //-p4rampH*(1/3) or -5?
//p4clear maybe need to calculate sin(45) distnace from top of baseH, distance from OD of needle to ID of base
p4endtrim=0.5;
p4clawWslanttop=1;   //0 = slant to rampW, p4rampW = no slant

echo("rampW", p4rampW);


//space between rotating plates
pPextra=1;   //extra room below nC at lowest point
pPspace2=nC+(p4baseH-p4basegapH)+pPextra; //space between geared plate and mountain plate, needle nC?  //12

//p5 small bearing holder
p5boltHeadOD=8; //look up sales drawing - used to cut mountain
p5boltHeadH=3.65;  //look up sales drawing - used to cut mountain
p5nutH=3;  //jam nut
p5boltD=5;
p5boltL=25;  //bolt to hold bearings
p5wingW=7;
p5wingL=p5boltHeadH+p5boltL;
p5wingH=3;
p5bodyW=bearingholderSmallBOD+6;
p5bodyL=p5boltL-p5nutH;
p5bearCl=1.5; //distance from top of body to OD of bearing
p5bodyH=bearingholderSmallgapclear+bearingholderSmallBOD-p5bearCl;
p5wiggleL=0.4;  //clearnace around bearing
p5wiggleW=0.25; //clearnace around bearing
p5bearingfromwall=4.25;
p5mountholeOD=3;     //mounting bolt OD
p5mountBoltHeadOD=5.68;

pPspace1=bearingholderSmallgapclear+bearingholderSmallBOD+bearingholderSmallgaproll; //? space from main table top to first plate - calc w/ bearing holder height, stepper motor shaft length?
//made max of bearing holder, and p3wall45H?

echo("pPspace1",pPspace1);

p1H=pPspace1+pPplate1+1;

//p6 big bearing holder - depricated
p6wingW=30;
p6wingL=25;
p6wingH=3;
p6bodyW=16;
p6bodyL=25;
p6bodyH=9.5;
p6wiggleL=0.4;
p6wiggleW=0.6;
p6bearingfromwall=4.25;
p6mountholeOD=3;
p6mountholeHeadOD=5.68;  //OD of socket screw head
p6mounthole2front=8;
p6mounthole2side=3;

//p7 Z bearing holder - need to tweak more for different size bearings

    //bearing bolt
p7boltHeadOD=8; //look up sales drawing - used to cut mountain
p7boltHeadH=3.65;  //look up sales drawing - used to cut mountain
p7nutH=2.7;  //jam nut
p7boltD=5;
p7boltL=16;  //bolt to hold bearings

p7baseH=4;
p7wallW=3;
p7mountH=bearingholderZBOD-2;
p7mountholeOD=3;
p7mountholeHeadOD=5.68;
p7mountnutOD=6.01;
p7mountnutH=3;
p7mounthole2edge=4.5;
p7bearingfromfront=3;
p7wiggleL=0.4;
p7wiggleW=0.25;
p7baseW=bearingholderZBOD+8;  //16
p7baseL=max((((p7bearingfromfront+bearingholderZBW+p7bearingfromfront)*2)+p7wallW),(p7mountholeHeadOD*2)+p7wallW,(p7mounthole2edge*2)+p7wallW);  //23
p7mountL=(p7baseL-p7wallW)/2;  //13

echo("suggested boltL for Z bearing", ceil(((((p7baseL-p7wallW)/2)+p7wallW+p7nutH)/2))*2   );

//p8 plate connector
p8boltHeadOD=5.68; //look up sales drawing - used to cut mountain
p8boltHeadH=3;  //look up sales drawing - used to cut mountain
p8nutH=4;  //jam nut
p8boltD=3;
p8boltL=30;  //bolt to hold bearings  ????

p8baseW=8;
p8holeD=p8boltD;
p8H=pPspace2;


echo("suggested boltL for spacer", ceil((upper_surfaceH+pPspace2+bottom_surface_motor_gearsH+p8nutH)/5)*5   );  //20,22,25,30 commonly availabble

//p9 outer connector
p9thickness=3;
p9H=10;

//mountain
pMwallT=9;  //min thickness from groove to back wall  //7.5  //10
pMgroove=nH-nY-p3wallW+1;  //depth of groove
pMgrooveSlop=0.5;  //height slop of groove
pMgrooveD=nC+pMgrooveSlop; //Z plane diamter of groove cut 
pMgrooveAngle=45;  // only 45 is working
pMgrooveC1=pPspace2;    //top of groove at position 1 "entrance"  pPspace2 ///////////
pMgrooveC2=nC+pPextra;        //top of groove at position 2 "push down"  nC+2 ////////////
echo("pushdown distance",pPspace2-(nC+pPextra));
threadthickness=0.5;    //approx used to leave space above p2

pMgrooveC3=pMgrooveC2+(pMgrooveD-nC)-(nG+threadthickness)+(p4baseH-p4basegapH)+p4rampH+p4clear+nF;       //top of groove at position 3 "top center" calc! //44.25
pMwallHextra=3.75;      //extra height above groove at heighest point
pMH=pMwallHextra+pMgrooveC3; //total height of mountain
pMshelfH=4; //thickness of shelf resting on top of c3 - depricated
pMshelfchamfR=3; //radius of chamfer at join shelf/wall
pMshelfBoltD=3;

pM3c2c=(pMH-(aaboltHD/2)-5)-((pPspace2+pPplate2+1)+(aaboltHD/2)+bearingholderZBOD);
pM3c2e=min(
pMH-(pMH-(aaboltHD/2)-5)
,
((pPspace2+pPplate2+1)+(aaboltHD/2)+bearingholderZBOD)
-(pMshelfchamfR+pPspace2+pPplate2)
);
//distance between bolts + 2X the min distance from bolt to top or bolt to bottom
pM3H=(
pM3c2c
+(2*min(
pMH-(pMH-(aaboltHD/2)-5)
,
((pPspace2+pPplate2+1)+(aaboltHD/2)+bearingholderZBOD)
-(pMshelfchamfR+pPspace2+pPplate2)
))
);
pM3mink=6;
pM3slop=0.25;

pMsqNutW=5.5;
pMsqNutH=1.8;
pMsqNutSlop=0.25;

//pS1 - pick a needle geared riser
pS1W=(needle2needle-nX)/2;  //width
pS1wallT=4; //Cross section to fit in guide groove
pS1wallW=pS1W+8;
pS1T=8; //thickness of vertical section without gears
pS1GearD=10; //filler for now, TODO calculate
pS1Z=pPplate1+pMH+pPplate3+pMgrooveD+pS1GearD;


//c2 geared plate - clean up below, not used to generate gear
c2H=bottom_surface_motor_gearsH;
c2gap=0.5;  //gap between c2ID and p3wallOD  // 0.7?  0.5?  0.35? how low can you go?
c2t2t=6.858;
c2width=50;  //depricated?
c2OD=p3baseOD+(p5boltL*2)+(p5boltHeadH*2)+(Td*2)+(2*2);
c2ID=(c2gap*2)+p2OD+(p3wiggle*2)+(p3wallW*2);   //should this be p3wallOD+(c2gap*2)
c2teeth=((c2OD*PI)/c2t2t);
c2dipitch=c2teeth/(c2OD*PI);

cWiggle=0.1; //extra height on mountaint cutout for c3 to sit in  ?? is this used ??




/////////////////////
//calculated settings
/////////////////////

bearingholderZB2C=(bearingholderZBOD/2)+pPspace1+pPplate1+pPspace2+pPplate2;  //from base of bearing holder to center of bearing

rez=p2number*p2needles*2;

centerlineD=p2ID+(p2W+(p3wiggle*2));


p3grooveH1=pPspace1+pPplate1; //bottom of verticle groove in p3
p3grooveH2=pPspace1+pPplate1+pMH+pPplate3+pMgrooveD;  //top of groove in p3

p4baseOD=centerlineD+p4baseW;
p4baseID=centerlineD-p4baseW;
p4basegapOD=centerlineD+p4basegapW;
p4basegapID=centerlineD-p4basegapW;

//firstcenter=(((((360/p2number/p2needles/2)/360*(p2OD*PI))-(needleWidth/2))/((360/p2number/p2needles/2)/360*(p2OD*PI)))*(360/p2number/p2needles/2))/2;
//doesnt work on narrow needle arrangement, moved to second gap

p2H=pPspace1+pPplate1+pMgrooveC2+(nA-nC-nB-nG)-threadthickness-p3base45H;

p3wallH=pPspace1+pPplate1+pMgrooveC2+nA-nB-nC-nF-p3clear;

p2holeH=p3grooveH2+((p3wallH-p3grooveH2)/2);  //hight from table top

//c3
c3ID=c2ID;
c3H=upper_surfaceH;

//c6
c6H=c3H;

pMID=c2ID;
pMODwall=c2ID+(pMgroove*2)+(pMwallT*2);

//c4 paper clip connecting weight holder plate
c4OD=p2ID-(p3ridgeW2*2)-(20*2);
c4paperclipholeD=5;
c4paperclipholeW=2;
c4paperclipholetoEdge=3;


   /////////////////////////////////
pMgrooveOR=pMgroove+(pMID/2); //center to OD of groove
    // is this supposed to be the radius? 
    /////////////////////////////////

c5OD=pMgrooveOR*2;
c5H=upper_surfaceH;

////////////////////////
// MOUNTAIN VARIABLES //
////////////////////////


    mult=20;                //rough multiplier 5-30
    grez=rez*mult;          //number of sides of groove path main circle
    gdeg=360/grez;          //standard fraction of a degree per groove rez
    glen=(pMID*PI)/grez;    //length of arc of each rez's fraction of a degree
    glnd=glen/gdeg;         //length of standard fraction of a degree

    gcho=2*(pMID/2)*sin(gdeg/2);  //chord length of glnd
    garc=gdeg*(pMID/2);           //arc length... too close to get to smaller digits that are diff?
    
    echo("rez", rez);
    echo("grez", grez);
    echo("gdeg", gdeg);
    echo("glen", glen);
    echo("glnd", glnd);

    echo("pMgrooveC3", pMgrooveC3);
    
    //radius of upper curved path in groove //14  //10
    pMgrooveturnR=UPpMgrooveturnR; 
    //radius of lower curved path in groove //7
    pMgrooveturnR2=UPpMgrooveturnR2; 
    pMgrooveturnR3=7; // radius of entrance curved path - not used
 
    pMcutRez=2; //cuts per degree
    pMcutcylRez=36;  //number of sides on groove cutting clylinder

    pMcutA=45;    //angle of cut path

//7
    pMp7X=UPpMp7X;  //half of length of plateu of groove. preferably whole number  //3  //2
    pMd7=pMp7X/glnd; //number of degrees for entire groove7
    pMd7s=0;                          //degree turn to center of groove
    pMd7e=pMd7;                       //highest degree turn for section 7
    pMh7s=pMgrooveC3-(pMgrooveD/2);   //height of center of groove
    pMh7e=pMgrooveC3-(pMgrooveD/2);
    
//6    
    pMp6X=cos(90-pMcutA)*pMgrooveturnR; 
    pMd6=pMp6X/glnd;
    pMd6s=pMd7e;
    pMd6e=pMd7e+pMd6;
    function func6(i) = (pMgrooveturnR*cos(asin(((i-pMd6s)*(pMp6X/pMd6))/pMgrooveturnR))-pMgrooveturnR);
    pMh6s=pMh7e;
    pMh6e=pMh7e+func6(pMd6e);

//5    
    pMh5s=pMh6e;
    pMh5e=0;
    pMp5X=(pMh5s-pMh5e)*tan(90-pMcutA);
    pMd5=pMp5X/glnd;
    pMd5s=pMd6e;
    pMd5e=pMd6e+pMd5;

//4    
    pMh4e=pMgrooveC2-(pMgrooveD/2);
    
    pMp55X=(pMgrooveturnR2*tan(90-pMcutA))-(pMgrooveturnR2*sin(90-pMcutA))+(pMh4e/tan(90-pMcutA));
    pMd55=pMp55X/glnd;

    pMp4X=cos(90-pMcutA)*pMgrooveturnR2;  /////////problem with non-45 angles, p55X?
    pMd4=pMp4X/glnd;
    pMd4s=pMd5e-pMd55;
    pMd4e=pMd5e-pMd55+pMd4;
    function func4(i) = -(pMgrooveturnR2*cos(asin(((pMd4e-i)*(pMp4X/pMd4))/pMgrooveturnR2))-pMgrooveturnR2);
    pMh4s=func4(pMd4s);

//3    
    pMp3X=UPpMp3X;            //length of lower plateu of groove  //2.5   //2
    pMd3=pMp3X/glnd;      //number of degrees for groove section 3
    pMd3s=pMd4e;          //degree turn to center of groove
    pMd3e=pMd4e+pMd3;     //highest degree turn for section 7
    pMh3s=pMh4e;          //height of center of groove
    pMh3e=pMh4e;

//2    
    pMp2X=cos(pMcutA)*pMgrooveturnR2;
    pMd2=pMp2X/glnd;    
    pMd2s=pMd3e;
    pMd2e=pMd3e+pMd2;
    function func2(i) = -(pMgrooveturnR2*cos(asin(((i-pMd2s)*(pMp2X/pMd2))/pMgrooveturnR2))-pMgrooveturnR2);
    pMh2e=pMh3e+func2(pMd2s);
    pMh2s=pMh3e;

//1
    pMh1s=pMh2e;
    pMh1e=pMgrooveC1-(pMgrooveD)+((pMgrooveD/2)-(sin(pMcutA)*(pMgrooveD/2)));  //-(cos(pMcutA)*pMgrooveturnR3); //-(pMgrooveD/2)
    pMp1X=((pMh1e)-(pMh1s))*tan(90-pMcutA);  //-sin(45)*grooveD/2  ??
    pMd1=pMp1X/glnd;
    pMd1s=pMd2e;
    pMd1e=pMd2e+pMd1;

echo("extra to subtract??",sin(pMcutA)*(pMgrooveD/2));

//0
//    pMp0X=pMgrooveD/2;  //pMgrooveD
//    pMd0=pMp0X/glnd;     //pMgrooveD/glnd; //define later

    pMp0X=0; 
    pMd0=pMp0X/glnd;
    pMd0s=pMd1e;
    pMd0e=pMd1e+pMd0;

//pM0 attempt to make curve below
/*
    pMp0X=cos(90-pMcutA)*pMgrooveturnR3; 
    pMd0=pMp0X/glnd;
    pMd0s=pMd1e;
    pMd0e=pMd1e+pMd0;
    function func0(i) = (pMgrooveturnR3*cos(asin(((i-pMd0e)*(pMp0X/pMd0))/pMgrooveturnR3))-pMgrooveturnR3);
    pMh0s=pMh1e;
    pMh0e=pMh1e+func0(pMd0e);
*/

//mounting shelf and holes settings   
    pMshelfX=pMshelfBoltD*4;  //length of shelf in mm
    pMshelfd=pMshelfX/glnd; //number of degrees of shelf
    pMdS=(pMgrooveD/2)/glnd; //to trim half
    pMdSs=pMd1e+pMdS;    
    
    pMshelfHole1X=pMshelfchamfR+(pMshelfBoltD*1.5);  //distance to hole center from main body
    pMshelfHole1d=(pMshelfHole1X/glen)*gdeg; //number of degrees from edge to hole center

    pMshelfHole2X=pMshelfX-(pMshelfBoltD*1.5);  //distance to hole center from main body
    pMshelfHole2d=(pMshelfHole2X/glen)*gdeg; //number of degrees from edge to hole center

    pMextman=0.0002; //increase size of filler piece to make part manifold correctly

pMbodyXr=(((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)));  //half the X of back wall

//END MOUNTAIN VARS
///////////////////////

//c3 - redo with extra mountian tab/shelf distance
c3OD=
max(
((pow((pow((pMbodyXr+pMshelfX),2)+pow((((c2ID+(pMgroove*2)+(pMwallT*2))/2)),2)),1/2))*2)+((p7mountL+p7boltHeadH)*2)
,
((((p3baseOD/2)+1+p5wingL+1+p7bearingfromfront+(p7wiggleL/2)+bearingholderZBW))*2)
);

//removed following, going to shrink p8 as needed
//(((pMID/2)+(pMgroove)+1+(p8baseL/2)+(p8holeC2C/2)+(p8holeD*1.25)+(p7mountL))*2)


//MAX() of distance from mountain, and distance from plate spacers bolts
//need to consider tooth size on plate c2 ??

echo("X", (pMbodyXr+pMshelfX));
echo("Y", ((c2ID+(pMgroove*2)+(pMwallT*2))/2));
echo("c3OD=", c3OD);

echo("pMID less pMbodyXr*2",pMID-(pMbodyXr*2)); //needs to be positive




pMODshelf=c3OD; 

pMarcL=((PI*c2ID)*((pMd1e-pMd0)*2)/360); //approx arc length of mountain - could get more accurate number

echo("pMarcL",pMarcL);

pMmaxNum=floor((PI*c2ID)/pMarcL); //max number of mountains around circumference

echo("pMmaxNum",pMmaxNum);

pMnum=floor(pMmaxNum/2);

echo("pMnum",pMnum);

//number of sets of bearings mounted to geared plated
c2bmounts=max(3,pMnum*2);   //p3number  //probably should be higher

echo("c2bmounts",c2bmounts);

p7number=(ceil(max(
c2bmounts*1.3,
4
)/4))*4;

echo("p7number", p7number);

//number of plate connectors
//c2connectors=pMnum*3; // need to tweak so does not overlap mountain footprint
c2connectors=numberMountain;

    /////gear calcs/////


//solve for # of teeth and circ_pitch that gives proper tooth whole depth

Tn=floor(((-2*c2OD)/((c2OD-Td)-c2OD))-2); //number of teeth? - for big gear

pCir=180*(c2OD-(Td))/Tn; //circular pitch - use for both big and small gear

    CKp1_circular_pitch=pCir;
    CKp1_number_of_teeth=spurgearTn;
	CKp1_pitch_diameter  =  CKp1_number_of_teeth * CKp1_circular_pitch / 180;
	CKp1_pitch_radius = CKp1_pitch_diameter/2;

    CKc2_circular_pitch=pCir;
    CKc2_number_of_teeth=Tn;
	CKc2_pitch_diameter  =  CKc2_number_of_teeth * CKc2_circular_pitch / 180;
	CKc2_pitch_radius = CKc2_pitch_diameter/2;

echo("c2OD",c2OD);
echo("Tn",Tn);
echo("pitch",180*(c2OD-(Td))/Tn);
echo("pCir",pCir);


p5mounthole2front=(p5mountBoltHeadOD/2)+Td;
p5mounthole2back=
max(
(p5mountBoltHeadOD/2)+(((pMID+(pMgroove*2))-(p3baseOD+2))/2)
,
(p5mountBoltHeadOD/2)+4
);


//p8
p8holeend2C=4;

p8innerboltO2C=(c2ID/2)+pMgroove+1+p8holeend2C;   //radius of origin to center of inner bolt

p8outerboltO2C=min(
(c3OD/2)-p7bearingfromfront-(p7wiggleL/2)-bearingholderZBW-p7boltHeadH-1-(p8boltHeadOD/2)
,
CKc2_pitch_radius-(Td/2)-1-p8holeend2C
);   //radius of origin to center of outer bolt

p8holeC2C=p8outerboltO2C-p8innerboltO2C;  //p8baseL-(p8holeend2C*2)

p8baseL=p8holeC2C+(p8holeend2C*2); //25

p8dsqNutW=5.5;
p8dID=c2OD+3;

p8dH=pPspace1+pPplate2+pPspace1;
p8dD=15; //degrees around circle for each p8d
p8dboltD=3;
p8dsqNutH=1.8;
p8dsqNutSlop=0.25;

p8eNutH=5;
p8eboltD=3;

//p8d
p8dminT=p8dsqNutW+1;

//c1
c1H=table_surface;
c1width=c2width+91.36;  //depricated?
c1OD=(CKp1_pitch_radius+CKc2_pitch_radius+(NEMAmotorW/2)+woodbeamW+2)*2;  // c2OD + (c1width-c2width);
c1zOD=(((c3OD/2)-p7bearingfromfront-(p7wiggleL/2)-bearingholderZBW+(p7baseL-p7mounthole2edge))+woodbeamW+2)*2; //outside diameter of plate at Z mounts
c1W=max(
c1OD*(-ceil(1/(floor( (2-c1steppersnumber)*(c1steppersnumber/(2/c1steppersnumber)) )+1))+1)
,
c3OD
);


test=1;

echo("floor",
(-ceil(1/(floor( (2-c1steppersnumber)*(c1steppersnumber/(2/c1steppersnumber)) )+1))+1)
);  //if there are more than 2 steppers = 1

echo("c3OD",c3OD);

echo("c1W",c1W);




c6OD=c3OD+(p8dminT*2);
p8dOD=c6OD;

UPc1W=c6OD;

c1polyOD=c6OD;  //need to calculate stepper OD later


//p2 flat socket head screw
p2p3flatORmax=((c2ID+sqrt((-4*(p2p3flatHD/2)*(p2p3flatHD/2))+((c2ID)*(c2ID))))/2)/2; //maximum radius to be within c2ID

//thread feeder
M2tipY=tipOpenX/2;  //pM2mink
M2tipZ=(((tipOpenX/2)-(nE/2))*2)+tipHole+(tipcylD/2);
M2tiptopC=(((tipOpenX/2)-(nE/2))*2)+tipHole+(tipcylD/2)-(pM2mink/4);
M2inX=((((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))-pMshelfchamfR-(aaX-aaT))*2;
M2inY=(((c2ID+(pMgroove*2)+(pMwallT*2))/2))-((p3wallID/2)-(p2needlegrooveDepthslop/2))-(nD-nY)-nD;  //(M2tipY) //(nD-nY) //tipcylD/2
M2inZ=pM2H-pM2mink;
M2backwallOD=((c2ID+(pMgroove*2)+(pMwallT*2))/2)+aaT;


////SETTINGS OUTPUT ECHOS///

echo("Total Needles:", p2number*p2needles);

echo("Millimeters Between Needles:", PI*p2needlegrooveID/(p2number*p2needles));

echo("OD of p3:", p3baseOD);

echo("OD of c1:", c2OD+(c1width-c2width));


/////BOM COUNT///////

if(TF==1){
echo("Thread Feeder Mount Bolt: (2)", (ceil(((((pMID/2)-(cos(pMd4s)*(pMID/2)))+pMwallT+pMgroove)-(sin(pMd4s)*(aaboltHD))-2-aaboltHH+aaT+aanutH)/2)*2) );
}
