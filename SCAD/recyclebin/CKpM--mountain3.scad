include <CKvars.scad>;

/////////
//mouatin3.scad
//attempt #3 will use fully round geometry for main body


CKpM();

//////////////////////////////////////////////////////////
//variables to be moved to CKvars later
/////////

    mult=2;

    CKpMgrooveturnR=15; //radius of upper curved path in groove
    CKpMgrooveturnR2=8; //radius of lower curved path in groove
    CKpMgrooveD=nC+pMgrooveSlop; //Y plane diamter of groove cut
 
    CKpMp7X=5;  //half of length of plateu of groove. preferably whole number
    CKpMp3X=2.5;  //length of flat area of section 3
    CKpMcutRez=2; //cuts per degree
    CKpMcutDeg=(((CKpMp7X/2)*360/(PI*CKpMID))/CKpMp7X); //degrees per unit diameter
    CKpMcutcylRez=8;  //number of sides on groove cutting clylinder default=36
    CKpMcutA=45;    //angle of cut path
    
    //calc'd
    
        mi=(CKpMID*PI)/360;  //degrees in mm at CKpMID
    
    echo("mi=",mi);
    
    CKpMd7=round((CKpMp7X)*360/(PI*CKpMID)*10)/10;  //degrees around ID
    
    echo(CKpMd7);
    
    CKpMd6=round((cos(CKpMcutA)*CKpMgrooveturnR)*360/(PI*CKpMID)*10)/10;
   
    echo(CKpMd6);
    
    CKpMp6Y=0;
    
    CKpMd5=round((tan(CKpMcutA)*(((pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin((((CKpMd7+CKpMd6)-CKpMd7)*(PI*CKpMID)/360)/CKpMgrooveturnR))-CKpMgrooveturnR))-((CKpMgrooveD/2)+((sin(CKpMcutA)*CKpMgrooveturnR2)*360/(PI*CKpMID))))))*360/(PI*CKpMID)*10)/10;
    
    // not good code CKpMd5=round((cos(CKpMcutA)*(pMgrooveC3+pMwallHextra+(CKpMgrooveD/2)))*360/(PI*CKpMID)*10)/10;
    
    //height of center of circle at top of 5 //pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin((((CKpMd7+CKpMd6)-CKpMd7)*(PI*CKpMID)/360)/CKpMgrooveturnR))-CKpMgrooveturnR)
    
    //height of center of circle at bottom of 5
    //CKpMgrooveD+((sin(CKpMcutA)*CKpMgrooveturnR2)*360/(PI*CKpMID))
    
    //total height of 5 //((pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin((((CKpMd7+CKpMd6)-CKpMd7)*(PI*CKpMID)/360)/CKpMgrooveturnR))-CKpMgrooveturnR))-(CKpMgrooveD+((sin(CKpMcutA)*CKpMgrooveturnR2)*360/(PI*CKpMID))))
    
    echo(CKpMd5);
    //center to center degrees in section 4
    CKpMd4=round((cos(CKpMcutA)*CKpMgrooveturnR2)*360/(PI*CKpMID)*10)/10;
    //old bad code CKpMd4=(cos(CKpMcutA)*((pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((((CKpMd7+(CKpMd6))-(0.1))-CKpMd7)*(PI*CKpMID)/360)/CKpMgrooveturnR))-CKpMgrooveturnR))-((cos(CKpMcutA)*CKpMgrooveturnR))));

    echo(CKpMd4);
    
    CKpMd3=round((CKpMp3X)*360/(PI*CKpMID)*10)/10;  //degrees around ID
    
    echo(CKpMd3);
    
    CKpMd2=round((cos(CKpMcutA)*CKpMgrooveturnR2)*360/(PI*CKpMID)*10)/10;
    
    echo(CKpMd2);
    
        //height of center of circle at top of 2
    //CKpMgrooveD+((sin(CKpMcutA)*CKpMgrooveturnR2)*360/(PI*CKpMID))
    
    //need to fix below
    CKpMd1=round(((cos(CKpMcutA)*((pMgrooveC1-(((((CKpMgrooveD/2)-(CKpMgrooveturnR2*cos(asin((((CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2)-(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3))*(PI*CKpMID)/360)/CKpMgrooveturnR2))-CKpMgrooveturnR2)))))-(sin(CKpMcutA)*(CKpMgrooveD/2)))*(1/sin(CKpMcutA)))))*360/(PI*CKpMID)*10)/10;
    
    echo("degrees 1:");
    echo(CKpMd1);
  
    CKpMd0=(cos(CKpMcutA)*(CKpMgrooveD/2))*360/(PI*CKpMID);
    
    pMH=pMgrooveC3+pMwallHextra;

    pMbwOD=((p2OD+2)/2)+pMwallT+pMgroove;
    
    echo(pMbwOD);

//
//////////////////////////////////////////////////////////

module CKpM(){
    translate([0,-p3wallOD/2,0]){
    
    //test cube
//    translate([-71.4,120,0])
//    cube([pMgrooveC1,pMgrooveC1,pMgrooveC1]);
    
    union(){
    
    difference(){
        translate([-(p2OD+2),0,0])
        cube([(p2OD+2)*2,((p2OD+2)/2)+pMwallT+pMgroove,pMH]);
cylinder($fn=180,d=CKpMID, h=pMH);    
        
    }//end difference
    }//end union
    }//end main translate
    }//end module