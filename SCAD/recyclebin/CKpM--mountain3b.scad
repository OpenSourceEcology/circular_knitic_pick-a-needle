include <CKvars.scad>;

//lol woops cant print this, going back to style 1


CKpM(); //mountain

    mult=2;                //rough multiplier 5-30
    grez=rez*mult;          //number of sides of groove path main circle
    gdeg=360/grez;          //groove rez in fractions of a degree
    glen=(pMID*PI)/grez;    //length of arc of each rez's fraction of a degree
    
    echo("rez", rez);
    echo("grez", grez);
    echo("gdeg", gdeg);
    echo("glen", glen);
    
    CKpMgrooveturnR=15; //radius of upper curved path in groove
    CKpMgrooveturnR2=8; //radius of lower curved path in groove
    CKpMgrooveD=nC+pMgrooveSlop; //Y plane diamter of groove cut
 
    CKpMp3X=2.5;  //length of flat area of section 3
    CKpMcutRez=2; //cuts per degree
 //   CKpMcutDeg=(((CKpMp7X/2)*360/(PI*CKpMID))/CKpMp7X); //degrees per unit diameter
    CKpMcutcylRez=36;  //number of sides on groove cutting clylinder
    CKpMcutA=45;    //angle of cut path

    CKpMp7X=5;  //half of length of plateu of groove. preferably whole number 
    CKpMd7=(CKpMp7X/glen)*gdeg; //number of degrees for entire groove7
    grez7=CKpMd7/grez/(CKpMp7X/(pMID*PI));     //degrees of section 7
    
    echo("CKpMd7", CKpMd7);
    echo("grez7", grez7);
    
    CKpMp6X=cos(CKpMcutA)*CKpMgrooveturnR; 
    CKpMd6=(CKpMp6X/glen)*gdeg;
    grez6=CKpMd6/grez/(CKpMp6X/(pMID*PI));
    
    echo("CKpMp6X", CKpMp6X);
    echo("CKpMd6", CKpMd6);
    echo("grez6", grez6);
     //CKpMp5X=(pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((CKpMd6)*(CKpMp6X/CKpMd6))/CKpMgrooveturnR))-CKpMgrooveturnR))/(1/cos(90-CKpMcutA));
    //CKpMp5X=(pMgrooveC3-(sin(CKpMcutA)*CKpMgrooveturnR))*tan(CKpMcutA)
    
    CKpMp5X=(pMgrooveC3)*tan(CKpMcutA);
    CKpMd5=(CKpMp5X/glen)*gdeg;
    grez5=CKpMd5/grez/(CKpMp5X/(pMID*PI));
    
    echo("pMgrooveC3", pMgrooveC3);
    echo("CKpMp5X", CKpMp5X);
    echo("CKpMd5", CKpMd5);
    echo("grez5", grez5);    
    
    CKpMp4X=cos(CKpMcutA)*CKpMgrooveturnR2;
    CKpMd4=(CKpMp4X/glen)*gdeg;
    grez4=CKpMd4/grez/(CKpMp4X/(pMID*PI));
    
    CKpMd3=1; //define later
    CKpMd2=1; //define later
    CKpMd1=1; //define later
    CKpMd0=1; //define later
    
    pMshelfX=25;  //length of shelf in mm
    pMshelfd=(pMshelfX/glen)*gdeg; //number of degrees for entire groove7
    
    
module CKpM(){
translate([0,-p3wallOD/2,0]){
difference(){

//main wall structure
difference(){
union(){    
difference(){    
union(){    
cylinder(d=pMODwall,h=pMH,$fn=rez);  //cylidner of main wall 
translate([0,0,pPspace2+pPplate2])    
cylinder(d=pMODshelf,h=pMshelfH,$fn=rez);  //cylinder of shelf behind wall  
}
        //need to calc exactly so height of path entrance matches bottom of top plate
        rotate([0,0,(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2+CKpMd1-CKpMd0)])
        mirror([1,0,0])
        cube([CKpMID*4,CKpMID*4,pMH]);
        mirror([1,0,0])
        rotate([0,0,(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2+CKpMd1-CKpMd0)])
        mirror([1,0,0])
        cube([CKpMID*4,CKpMID*4,pMH]);

} //end first wall cut difference
translate([0,0,pPspace2+pPplate2])    
cylinder(d=pMODshelf,h=pMshelfH,$fn=rez);  //cylinder of shelf behind wall  

////
//shelf chamfer
minkowski(){
translate([0,0,pPspace2+pPplate2+pMshelfH])
union(){
difference(){        
cylinder(d=pMODwall,h=0.0001,$fn=rez);  //cylidner of main wall 
        //need to calc exactly so height of path entrance matches bottom of top plate
        rotate([0,0,(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2+CKpMd1-CKpMd0)])
        mirror([1,0,0])
        cube([CKpMID*4,CKpMID*4,0.001]);
        mirror([1,0,0])
        rotate([0,0,(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2+CKpMd1-CKpMd0)])
        mirror([1,0,0])
        cube([CKpMID*4,CKpMID*4,0.001]);
} //end difference
} //end union for translate    
//minkowski shape
cylinder(h = 4, r1 = 4, r2 = 0, $fn=36);

//end shape    
}
//end shelf chamfer
////

} //end second wall union
cylinder(d=pMID,h=pMH+1,$fn=rez);

        //need to calc exactly so height of path entrance matches bottom of top plate
        rotate([0,0,(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2+CKpMd1-CKpMd0+pMshelfd)])
        mirror([1,0,0])
        cube([CKpMID*4,CKpMID*4,pMH]);
        mirror([1,0,0])
        rotate([0,0,(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2+CKpMd1-CKpMd0+pMshelfd)])
        mirror([1,0,0])
        cube([CKpMID*4,CKpMID*4,pMH]);

} //end second wall difference




/////test rotate
 
    //rotate([270,0,CKpMd7+CKpMd6+CKpMd5])
    //#cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD+5,h=pMgrooveOR);
    
/////end test

//begin groove cuts

        //7
        for(i=[0:grez7:CKpMd7]){

            translate([0,0,pMgrooveC3-(CKpMgrooveD/2)])
            rotate([270,0,i])
            #cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);

        }//end for
        
        //6
        for(i=[CKpMd7:grez6:CKpMd7+CKpMd6]){
            translate([0,0,pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((i-CKpMd7)*(CKpMp6X/CKpMd6))/CKpMgrooveturnR))-CKpMgrooveturnR)])  //need to fix
            rotate([270,0,i])
            #cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
        } //end for   
        
        //5
                  for(i=[CKpMd7+CKpMd6:grez5:CKpMd7+CKpMd6+CKpMd5]){     
              
                translate([0,0,((pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((CKpMd6)*(CKpMp6X/CKpMd6))/CKpMgrooveturnR))-CKpMgrooveturnR)))-((i-(CKpMd7+CKpMd6))*cos(CKpMcutA)*((CKpMd7+CKpMd6))*(CKpMp5X/CKpMd5))])
        rotate([270,0,i])
        #cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
                  } //end for
                  
//4
        for(i=[CKpMd7+CKpMd6+CKpMd5:grez4:CKpMd7+CKpMd6+CKpMd5+CKpMd4]){ 
        translate([0,0,(CKpMgrooveD/2)-(CKpMgrooveturnR2*cos(asin(((i-(CKpMd7+CKpMd6+CKpMd5)-(0.0))*(PI*CKpMID)/360)/CKpMgrooveturnR2))-CKpMgrooveturnR2)])
        rotate([270,0,i])
        #cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
               
           }                  
                      
                      
} //end main difference
} //end main translate
}  //end main module
    