include <CKvars.scad>;

//TO DO//
//*use cylinder for main shape, uniform thickness
//*use cylinder wall thickness to calc mounting holes
/////////

CKpM(); //mountain

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
    
        
//cut main end 
        //need to calc exactly so height of path entrance matches bottom of top plate
        rotate([0,0,(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2+CKpMd1-CKpMd0)])
        mirror([1,0,0])
        cube([CKpMID*4,CKpMID*4,pMH]);
        
        mirror([1,0,0])
        rotate([0,0,(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2+CKpMd1-CKpMd0)])
        mirror([1,0,0])
        cube([CKpMID*4,CKpMID*4,pMH]);
        
        //left needle path cut
needlepathLEFT();
            
        //right needle path cut
mirror([1,0,0]) 
needlepathLEFT();   
         
    } //end main difference

pMsidetab();
    
mirror([1,0,0])
pMsidetab();

} //end main union
} //end main translate
} //end main module

module pMsidetab(){
        translate([0,0,pPspace2+pPplate2])
    difference(){
    rotate([0,0,-(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2+CKpMd1-CKpMd0)])
    difference(){
        union(){
    cube([12.5,(pMbwOD*2),4]);
    translate([0,0,4])
    difference(){
    cube([4,(pMbwOD*2),4]);
    translate([4,0,0])
    rotate([0,-45,0])
    cube([8,(pMbwOD*2),8]);  
    }
}
    translate([4+(8.5/2),(CKpMID/2)+13.5,0])
    cylinder($fn=36,d=3,h=5);
    translate([4+(8.5/2),(pMbwOD*(1/cos(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2+CKpMd1-CKpMd0)))-5.5,0])
    cylinder($fn=36,d=3,h=5);  
}
translate([0,-50,0])
cube([(CKpMID/2),((CKpMID/2)+3.5)*cos(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2+CKpMd1-CKpMd0)+50,(CKpMID/2)]);
translate([0,pMbwOD,0])
cube([(pMbwOD*2),(pMbwOD*2),(pMbwOD*2)]);
}
} //end sidetab module

module needlepathLEFT(){
    
    
          //////////////////////              
      //   needle path    //
      //////////////////////  

        
        //7
        for(i=[(0.1):(0.2):CKpMd7-(0.1)]){
            hull(){
                //odd
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)])
        rotate([270,0,i-(0.1)])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
                //even
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
            }//end hull 1
                hull(){
                //even
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
                //odd
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)])
        rotate([270,0,i+(0.1)])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
            }//end hull 2
            
        }//end fors
        
        
            
        //6
        for(i=[(CKpMd7)+(0.1):(0.2):(CKpMd7+(CKpMd6))-(0.1)]){
            
            hull(){
                //odd
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((i-CKpMd7-(0.1))*(PI*CKpMID)/360)/CKpMgrooveturnR))-CKpMgrooveturnR)])
        rotate([270,0,i-(0.1)])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
                //even
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((i-CKpMd7)*(PI*CKpMID)/360)/CKpMgrooveturnR))-CKpMgrooveturnR)])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
            }//end hull 1
                hull(){
                //even
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((i-CKpMd7)*(PI*CKpMID)/360)/CKpMgrooveturnR))-CKpMgrooveturnR)])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
                //odd
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((i-CKpMd7+(0.1))*(PI*CKpMID)/360)/CKpMgrooveturnR))-CKpMgrooveturnR)])
        rotate([270,0,i+(0.1)])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
            }//end hull 2
            
        }//end fors
        
        //5
          for(i=[(CKpMd7+CKpMd6)+(0.1):(0.2):(CKpMd7+CKpMd6+CKpMd5+CKpMd4)-(0.1)]){     
              
              hull(){
             //odd
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((((CKpMd7+(CKpMd6))-(0.0))-CKpMd7)*(PI*CKpMID)/360)/CKpMgrooveturnR))-CKpMgrooveturnR)-((tan(CKpMcutA)*(i-0.1-(CKpMd7+CKpMd6))*mi))])
        rotate([270,0,i-(0.1)])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);              
                 //even 
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((((CKpMd7+(CKpMd6))-(0.0))-CKpMd7)*(PI*CKpMID)/360)/CKpMgrooveturnR))-CKpMgrooveturnR)-((tan(CKpMcutA)*(i-(CKpMd7+CKpMd6-0.0))*mi))])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
          } //end hull 1
      hull(){
//even
            translate([0,0,pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((((CKpMd7+(CKpMd6))-(0.0))-CKpMd7)*(PI*CKpMID)/360)/CKpMgrooveturnR))-CKpMgrooveturnR)-((tan(CKpMcutA)*(i-(CKpMd7+CKpMd6-0.0))*mi))])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
    //odd
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((((CKpMd7+(CKpMd6))-(0.0))-CKpMd7)*(PI*CKpMID)/360)/CKpMgrooveturnR))-CKpMgrooveturnR)-((tan(CKpMcutA)*(i+0.1-(CKpMd7+CKpMd6))*mi))])
        rotate([270,0,i+(0.1)])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);  
      } //end hull 2
  } //end for
  
//4
        for(i=[(CKpMd7+CKpMd6+CKpMd5)-(0.1):(0.2):(CKpMd7+CKpMd6+CKpMd5+CKpMd4)+(0.1)]){ 
                       translate([0,0,(CKpMgrooveD/2)-(CKpMgrooveturnR2*cos(asin(((i-(CKpMd7+CKpMd6+CKpMd5)-(0.0))*(PI*CKpMID)/360)/CKpMgrooveturnR2))-CKpMgrooveturnR2)])
        rotate([270,0,((CKpMd7+CKpMd6+CKpMd5+CKpMd4)+(CKpMd7+CKpMd6+CKpMd5))-i])
        #cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
               
           }
               
               
          
          ///3
             
        for(i=[((CKpMd7+CKpMd6+CKpMd5+CKpMd4)+(0.1)):(0.2):((CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3)-(0.1))]){
            hull(){
                //even
        translate([0,0,(CKpMgrooveD/2)])
        rotate([270,0,i-(0.1)])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
                //even
        translate([0,0,(CKpMgrooveD/2)])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
            }//end hull 1
                hull(){
                //even
        translate([0,0,(CKpMgrooveD/2)])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
                //odd
        translate([0,0,(CKpMgrooveD/2)])
        rotate([270,0,i+(0.1)])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
            }//end hull 2
            
        }//end fors    
          
          
          //2
        for(i=[(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3)+(0.1):(0.2):(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2)-(0.1)]){
            
            hull(){
                //even
        translate([0,0,(CKpMgrooveD/2)-(CKpMgrooveturnR2*cos(asin(((i-(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3)-(0.1))*(PI*CKpMID)/360)/CKpMgrooveturnR2))-CKpMgrooveturnR2)])
        rotate([270,0,i-(0.1)])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
                //even
        translate([0,0,(CKpMgrooveD/2)-(CKpMgrooveturnR2*cos(asin(((i-(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3))*(PI*CKpMID)/360)/CKpMgrooveturnR2))-CKpMgrooveturnR2)])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
            }//end hull 1
                hull(){
                //even
        translate([0,0,(CKpMgrooveD/2)-(CKpMgrooveturnR2*cos(asin(((i-(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3))*(PI*CKpMID)/360)/CKpMgrooveturnR2))-CKpMgrooveturnR2)])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
                //odd
        translate([0,0,(CKpMgrooveD/2)-(CKpMgrooveturnR2*cos(asin(((i-(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3)+(0.1))*(PI*CKpMID)/360)/CKpMgrooveturnR2))-CKpMgrooveturnR2)])
        rotate([270,0,i+(0.1)])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
            }//end hull 2
            
        }//end fors
             
                difference(){
        for(i=[(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3)+(0.1):(0.2):(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2)-(0.1)]){   
              
        translate([0,0,0])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
          }
          cylinder($fn=180,d=CKpMID, h=pMH);  
      }
      
        
        //1   
        
        hull(){
            difference(){
          for(i=[(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2)+(0.1):(0.2):(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2+CKpMd1+1)-(0.1)]){     
              

        translate([0,0,((CKpMgrooveD/2)+((sin(CKpMcutA)*CKpMgrooveturnR2)*360/(PI*CKpMID)))+((tan(CKpMcutA)*(i-(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2-0.0))*mi))])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
          }
          cylinder($fn=180,d=CKpMID, h=pMH);    
      } //end diff
          
          difference(){
          for(i=[(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2)+(0.1):(0.2):(CKpMd7+CKpMd6+CKpMd5+CKpMd4+CKpMd3+CKpMd2+CKpMd1)-(0.1)]){     
              
        translate([0,0,0])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
          }
          cylinder($fn=180,d=CKpMID, h=pMH);    
      } //end difference
             } //end hull

              
          
       /////////////////////////// 
}  //end needlepathLEFT module