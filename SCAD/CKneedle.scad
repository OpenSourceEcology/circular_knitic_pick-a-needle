//needle variable file is selected in CKvars.scad file
include <CKvars.scad>;

needle();

module needle(){

mH=0.00001;
bP=1.6;
bN=0.6;    


$fn=36;
translate([nX/2,0,(nX/2)]){
    
    //flipper cut diff
    difference(){

union(){    
minkowski(){
union(){
//tail
translate([0,nX/2,0])
cube([nY-nX,nB-(nY*bN),mH]);


//bottom curve of butt 
translate([-(nY*bP)+nY,nB-(nY*bN)+nX/2,0]){   
    intersection(){
    difference(){
cylinder(r=(nY*bP)-nX,h=mH);    
cylinder(r=(nY*bN),h=mH);    
    }//end diff
    cube([(nY*bP)-nX,(nY*bP)-nX,mH]);
} //end inters
} //end bottom curve of butt translate

translate([-(nH-(nC/2)-(nY*1.4))-(nY*1.4)+nY,nB+(nC/2)-((nC-nX)/2),0])
cube([nH-(nC/2)-(nY*bP),nY-nX,mH]);


//C curve
translate([-(nH-(nC/2)-(nY*bP))-(nY*bP)+nY,nB+(nC/2),0]){   
    difference(){
cylinder(d=nC-nX,h=mH);    
cylinder(d=(nC-nX)-((nY-nX)*2),h=mH);    
    translate([0,-nC/2,0])
    cube([nC,nC,mH]);
    }//end diff

} //end C curve translate


//second horz
translate([-(nH-(nC/2)-(nY*bP))-(nY*bP)+nY,nB+(nC/2)+(((nC-nX)-((nY-nX)*2))/2),0])
cube([nH-(nC/2)-(nY*bP),nY-nX,mH]);
//end second horz

//upper curve of butt 
translate([-(nY*bP)+nY,nB+nC+(nY*bN)-(nX/2),0]){   
    intersection(){
    difference(){
cylinder(r=(nY*bP)-nX,h=mH);    
cylinder(r=(nY*bN),h=mH);    
    }//end diff
    translate([0,-((nY*bP)-nX),0])
    cube([(nY*bP)-nX,(nY*bP)-nX,mH]);
} //end inters
} //end upper curve of butt translate

//mid section
translate([0,nB+(nC/2)+(((nC-nX)-((nY-nX)*2))/2)+(nY*bP)-nX,0])
cube([nY-nX,nA-(nE*2)-(nB+(nC/2)+(((nC-nX)-((nY-nX)*2))/2)+(nY*bP)-nX),mH]);
//end mid section


} //end union
//traveling minkowski shape
sphere(d=nX);

    
} //end minkowski

//transition to hook
hull(){
    minkowski(){
    translate([0,nA-(nE*2),0])
    cube([nY-nX,mH,mH]);
    sphere(d=nX);
    }    
        
    translate([nY-(nG/2)-(nX/2),nA-(nD/2),0])
    sphere(d=nG);    
}
//end transition to hook


//hook body

minkowski(){
difference(){
translate([nY-(nD/2)-(nX/2),nA-(nD/2),0])
    cylinder($fn=36,d=nD-nG,h=mH);

translate([nY-(nD/2)-(nX/2),nA-(nD/2),0])
    cylinder($fn=36,d=nD-nG-0.001,h=mH);
    
translate([(nY-(nD/2)-(nX/2))-(nD/2),(nA-(nD/2))-nD,0])
    cube([nD,nD,mH]);
}
 sphere(d=nG);   
}
//end hook body

//hook tip
hull(){
    translate([nY-(nG/2)-(nX/2)-nD+nG,nA-(nD/2),0])
    sphere(d=nG);

    translate([nY-nD-(nG/4),nA-nE+(nG/4),0])
    sphere(d=nG/2);
}
//end hook tip

} //end union
translate([-15-(nX/2)+(nY/3),nA-nF+(nY/2),-(nX/2)])
cylinder($fn=360,d=30,h=nX);

} //end flipper cut difference

//flipper
hull(){
    minkowski(){
    translate([-nX/3,nA-(nF/2)-(nD/3),0])
    cube([nY-nX,mH,mH]);
    sphere(d=nX/3);
    }    
        
    translate([-(nY/2),nA-nF+(nX/3),0])
    sphere(d=nX/3);    
}
//end flipper


} //end main translate
} //end module
