include <CKvars.scad>;

projection(cut = false)
CKc4();

module CKc4(){
        
    rez=p2number*p2needles*2;  //calculate desired rezolution
    $fn=rez; //defines resolution of circles.
    
translate([0,-c3OD/2,0]){     //[c3OD/2,0,0]       
    difference(){  
        cylinder(h=c3H,d=c4OD);
        cylinder(h=c3H+2,d=3,$fn=36);  // donut hole
 
        //paperclip connector holes
for(i=[1:p2number*p2needles/2]){
  rotate([0,0,((360/(p2number*p2needles/2))*i)]){
    translate([0,(c4OD/2)-c4paperclipholetoEdge-(c4paperclipholeD/2),-0.1])
    resize([c4paperclipholeW,c4paperclipholeD,c3H+0.2])
    cylinder(d=c4paperclipholeD,h=c3H+0.2,$fn=36);
  } //end rotate i
} //end for
        
}  //end main difference
}  //end main translate
} //end CKc3 module