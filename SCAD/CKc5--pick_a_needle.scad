include <CKvars.scad>;

//projection(cut = false)
CKc5();

translate([(pMID/2)+pMgroove,-c3OD/2,c5H+1])
translate([0,-33-(pS1W/2)-5,0])
cube([42,33,42]);

c5stepperL=33;
c5stepperX=42;
c5gearoffset=5; //distance from stepper face to begining of gear

module CKc5(){
    
    
    rez=p2number*p2needles*2*2;  //calculate desired rezolution
    $fn=rez; //defines resolution of circles.
    
translate([0,-c3OD/2,0]){     //[c3OD/2,0,0]       
    difference(){  
        
        union(){
            cylinder(h=c5H,d=c5OD);
            
                    //mountain
    rotate([0,0,0]){
    difference(){
    translate([-(pMbodyXr-pMshelfchamfR),0,0])
      cube([((pMbodyXr-pMshelfchamfR)*2),((c2ID+(pMgroove*2)+(pMwallT*2))/2),c5H]);

        translate([-(pMbodyXr-pMshelfchamfR),((c2ID+(pMgroove*2)+(pMwallT*2))/2),0])
        rotate([0,0,45])
        cube([pMshelfBoltD,pMshelfBoltD,pMH], center=true);
        
        mirror([1,0,0])
        translate([-(pMbodyXr-pMshelfchamfR),((c2ID+(pMgroove*2)+(pMwallT*2))/2),0])
        rotate([0,0,45])
        cube([pMshelfBoltD,pMshelfBoltD,pMH], center=true);
    } //end diff
} //end rotate
        //////

translate([0,-(c5stepperX+c5gearoffset+((pS1W+c2gap)/2))*2/2,0])
        cube([c5stepperX+(pMID/2)+pMgroove,(c5stepperX+c5gearoffset+((pS1W+c2gap)/2))*2,c5H]);

mirror([1,0,0])
translate([0,-(c5stepperX+c5gearoffset+((pS1W+c2gap)/2))*2/2,0])
        cube([c5stepperX+(pMID/2)+pMgroove,(c5stepperX+c5gearoffset+((pS1W+c2gap)/2))*2,c5H]);
        } //end main union
        
        
        
        cylinder(h=c5H+2,d=c3ID);  // donut hole
 

//pick-a-needle
rotate([0,0,0])
translate([0,-(pS1W+c2gap)/2,0])        
#cube([(pMID/2)+pMgroove+pS1T+(c2gap/2)+6,pS1W+c2gap,c5H+2]);        

translate([(pMID/2)+pMgroove-(c2gap/2),pS1W-(pS1W/2)+(c2gap/2),0])
#cube([pS1wallT+c2gap,pS1wallW+c2gap,c5H+2]);

mirror([1,0,0]){
rotate([0,0,0])
translate([0,-(pS1W+c2gap)/2,0])        
#cube([(pMID/2)+pMgroove+pS1T+(c2gap/2)+6,pS1W+c2gap,c5H+2]);        

translate([(pMID/2)+pMgroove-(c2gap/2),pS1W-(pS1W/2)+(c2gap/2),0])
#cube([pS1wallT+c2gap,pS1wallW+c2gap,c5H+2]);
}
        
        //plate connector holes
/*        
        if(atan((((((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))+(pMshelfX/2)))/((cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)))) > 45){
            
        for(i=[1:2]){
            rotate([0,0,(90*i)+45]){
          
                        translate([0,p8innerboltO2C,-0.1])
                            cylinder(d=p8holeD,h=c3H+0.2,$fn=36);
                        translate([0,p8outerboltO2C,-0.1])
                            cylinder(d=p8holeD,h=c3H+0.2,$fn=36);
 
            } //end rotate i
        } //end for
    }else
    {
                for(i=[1:c2connectors-1]){
            rotate([0,0,((360/c2connectors)*i)]){
          
                        translate([0,p8innerboltO2C,-0.1])
                            cylinder(d=p8holeD,h=c3H+0.2,$fn=36);
                        translate([0,p8outerboltO2C,-0.1])
                            cylinder(d=p8holeD,h=c3H+0.2,$fn=36);
 
            } //end rotate i
        } //end for
    }//end else

//small bearing holder holes to optionally connect through
    if(atan((((((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))+(pMshelfX/2)))/((cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)))) > 45){
    
for(i=[1:3]){
    rotate([0,0,(90*i)]){
        translate([0,((p3baseOD/2)+1),0]){ 
            
    //smallbearingholder holes
                translate([-(p5wingW+p5bodyW+p5wingW)/2,0,0]){
        translate([p5wingW+p5bodyW,0,0]){            
        //wing right holes
            translate([p5wingW/2,p5mounthole2back,0])
                cylinder(d=p5mountholeOD,h=c2H+0.1,$fn=36);
                translate([p5wingW/2,p5wingL-p5mounthole2front,0])
                cylinder(d=p5mountholeOD,h=c2H+0.1,$fn=36);
        } //end wing right translate  
        
        //wing left holes
            translate([p5wingW/2,p5mounthole2back,0])
                cylinder(d=p5mountholeOD,h=c2H+0.1,$fn=36);
                translate([p5wingW/2,p5wingL-p5mounthole2front,0])
                cylinder(d=p5mountholeOD,h=c2H+0.1,$fn=36);
    }//end translate - center X of holes
        }//end translate to ring
    }//end for rotate
}//end small bearing holder for       
} //end if    
        


    
       
        
        
        //makerbeam holes
        
    if(TF==2){
translate([(TFW/2)-(10/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)+(10/2),0])

        cylinder(d=3, h=pMH, $fn=36);

mirror([1,0,0])
    translate([(TFW/2)-(10/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)+(10/2),0])
        cylinder(d=3, h=pMH, $fn=36);
    }
        */
        
    }  //end main difference


    
}  //end main translate

} //end CKc3 module