include <CKvars.scad>;

projection(cut = false)
CKc5();

module CKc5(){
    
    
    rez=p2number*p2needles*2*2;  //calculate desired rezolution
    $fn=rez; //defines resolution of circles.
    
translate([0,-c3OD/2,0]){     //[c3OD/2,0,0]       
    difference(){  
        
        union(){
            cylinder(h=c5H,d=c5OD);
            
                    //mountain cutout
    rotate([0,0,0]){
    difference(){
    translate([-pMbodyXr,0,0])
      cube([(pMbodyXr*2),((c2ID+(pMgroove*2)+(pMwallT*2))/2),c5H]);

        translate([-(pMbodyXr),((c2ID+(pMgroove*2)+(pMwallT*2))/2),0])
        rotate([0,0,45])
        cube([pMshelfBoltD,pMshelfBoltD,pMH], center=true);
        
        mirror([1,0,0])
        translate([-(pMbodyXr),((c2ID+(pMgroove*2)+(pMwallT*2))/2),0])
        rotate([0,0,45])
        cube([pMshelfBoltD,pMshelfBoltD,pMH], center=true);
    } //end diff
} //end rotate
        //////
        } //end main union
        
        cylinder(h=c5H+2,d=c3ID);  // donut hole
 
        //plate connector holes
        
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
        
    }  //end main difference


    
}  //end main translate

} //end CKc3 module