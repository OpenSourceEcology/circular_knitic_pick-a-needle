include <CKvars.scad>;
use <CKpM1--mountain.scad>
use <CKc3--topplate.scad>

    rez=p2number*p2needles*2*2;  //calculate desired rezolution
    $fn=rez; //defines resolution of circles.

pi=3.1415926535897932384626433832795;


//c3 for review
//translate([0,0,10])
//CKc3();

/*
translate([0,-c3OD/2,0])
translate([0,p3wallOD/2,c2H])
CKpM(0);
*/

TF=2;  //2 for optional maker beam holes

projection(cut = false)
CKc2();

module CKc2(){
    
translate([0,-c2OD/2,0]){
rotate([0,0,-((360/c2connectors))])
difference(){
gear (circular_pitch=pCir,
	gear_thickness = c2H,
	rim_thickness = c2H,
	hub_thickness = c2H,
	circles=0);

        //p3 - "outer" holes
        for(i=[1:p3baseholenumber*p3number]){
            rotate([0,0,(((360/p3number/p3baseholenumber))/2)-((360/p3number/p3baseholenumber)*i)]){
            translate([-(p3baseOD/2)+p3baseholefromODID,0,0])
                cylinder(h=c1H+2,d=p3baseholeD,$fn=18);
            }   //end rotate
        }    //end outer hole set for   

cylinder(h=c2H+2,d=p3baseID);  // donut hole TODO change ID number

//calculate number of holes to skip in for() using arc of mountain?

echo("mountain shelf end cut",atan((((((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))+(pMshelfX/2)))/((cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)))));



}//end main difference
}//end main translate
}//end module

// Parametric Involute Bevel and Spur Gears by GregFrost
// It is licensed under the Creative Commons - GNU LGPL 2.1 license.
// © 2010 by GregFrost, thingiverse.com/Amp
// http://www.thingiverse.com/thing:3575 and http://www.thingiverse.com/thing:3752

//==================================================
// Bevel Gears:
// Two gears with the same cone distance, circular pitch (measured at the cone distance)
// and pressure angle will mesh.

module gear (
	number_of_teeth=Tn,
	circular_pitch=false, diametral_pitch=false,
	pressure_angle=28,
	clearance = 0.2,
	gear_thickness=5,
	rim_thickness=8,
	rim_width=5,
	hub_thickness=10,
	hub_diameter=15,
	bore_diameter=5,
	circles=0,
	backlash=0,
	twist=0,
	involute_facets=0,
	flat=false)
{
	if (circular_pitch==false && diametral_pitch==false)
		echo("MCAD ERROR: gear module needs either a diametral_pitch or circular_pitch");

	//Convert diametrial pitch to our native circular pitch
	circular_pitch = (circular_pitch!=false?circular_pitch:180/diametral_pitch);

	// Pitch diameter: Diameter of pitch circle.
	pitch_diameter  =  number_of_teeth * circular_pitch / 180;
	pitch_radius = pitch_diameter/2;
	echo ("Teeth:", number_of_teeth, " Pitch radius:", pitch_radius);

CKc2_pitch_radius=pitch_radius;

	// Base Circle
	base_radius = pitch_radius*cos(pressure_angle);

	// Diametrial pitch: Number of teeth per unit length.
	pitch_diametrial = number_of_teeth / pitch_diameter;

	// Addendum: Radial distance from pitch circle to outside circle.
	addendum = 1/pitch_diametrial;

	//Outer Circle
	outer_radius = pitch_radius+addendum;

//Use if statement and mix/max to select tooth count and circular pitch that creates a radius that is smaller than the OD of the CKp3
//circular pitch defined bt ckp3OD. number of teeth calculated for target addendum.

echo("radius",outer_radius);



	// Dedendum: Radial distance from pitch circle to root diameter
	dedendum = addendum + clearance;

	// Root diameter: Diameter of bottom of tooth spaces.
	root_radius = pitch_radius-dedendum;
	backlash_angle = backlash / pitch_radius * 180 / pi;
	half_thick_angle = (360 / number_of_teeth - backlash_angle) / 4;

	// Variables controlling the rim.
	rim_radius = root_radius - rim_width;

	// Variables controlling the circular holes in the gear.
	circle_orbit_diameter=hub_diameter/2+rim_radius;
	circle_orbit_curcumference=pi*circle_orbit_diameter;

	// Limit the circle size to 90% of the gear face.
	circle_diameter=
		min (
			0.70*circle_orbit_curcumference/circles,
			(rim_radius-hub_diameter/2)*0.9);

	difference()
	{
		union ()
		{
			difference ()
			{
				linear_exturde_flat_option(flat=flat, height=rim_thickness, convexity=10, twist=twist)
				gear_shape (
					number_of_teeth,
					pitch_radius = pitch_radius,
					root_radius = root_radius,
					base_radius = base_radius,
					outer_radius = outer_radius,
					half_thick_angle = half_thick_angle,
					involute_facets=involute_facets);

				if (gear_thickness < rim_thickness)
					translate ([0,0,gear_thickness])
					cylinder (r=rim_radius,h=rim_thickness-gear_thickness+1);
			}
			if (gear_thickness > rim_thickness)
				linear_exturde_flat_option(flat=flat, height=gear_thickness)
				circle (r=rim_radius);
			if (flat == false && hub_thickness > gear_thickness)
				translate ([0,0,gear_thickness])
				linear_exturde_flat_option(flat=flat, height=hub_thickness-gear_thickness)
				circle (r=hub_diameter/2);
		}
		translate ([0,0,-1])
		linear_exturde_flat_option(flat =flat, height=2+max(rim_thickness,hub_thickness,gear_thickness))
		circle (r=bore_diameter/2);
		if (circles>0)
		{
			for(i=[0:circles-1])
				rotate([0,0,i*360/circles])
				translate([circle_orbit_diameter/2,0,-1])
				linear_exturde_flat_option(flat =flat, height=max(gear_thickness,rim_thickness)+3)
				circle(r=circle_diameter/2);
		}
	}
}

module linear_exturde_flat_option(flat =false, height = 10, center = false, convexity = 2, twist = 0)
{
	if(flat==false)
	{
		linear_extrude(height = height, center = center, convexity = convexity, twist= twist) child(0);
	}
	else
	{
		child(0);
	}

}

module gear_shape (
	number_of_teeth,
	pitch_radius,
	root_radius,
	base_radius,
	outer_radius,
	half_thick_angle,
	involute_facets)
{
	union()
	{
		rotate (half_thick_angle) circle ($fn=number_of_teeth*2, r=root_radius);

		for (i = [1:number_of_teeth])
		{
			rotate ([0,0,i*360/number_of_teeth])
			{
				involute_gear_tooth (
					pitch_radius = pitch_radius,
					root_radius = root_radius,
					base_radius = base_radius,
					outer_radius = outer_radius,
					half_thick_angle = half_thick_angle,
					involute_facets=involute_facets);
			}
		}
	}
}

module involute_gear_tooth (
	pitch_radius,
	root_radius,
	base_radius,
	outer_radius,
	half_thick_angle,
	involute_facets)
{
	min_radius = max (base_radius,root_radius);

	pitch_point = involute (base_radius, involute_intersect_angle (base_radius, pitch_radius));
	pitch_angle = atan2 (pitch_point[1], pitch_point[0]);
	centre_angle = pitch_angle + half_thick_angle;

	start_angle = involute_intersect_angle (base_radius, min_radius);
	stop_angle = involute_intersect_angle (base_radius, outer_radius);

	res=(involute_facets!=0)?involute_facets:($fn==0)?5:$fn/4;

	union ()
	{
		for (i=[1:res])
		assign (
			point1=involute (base_radius,start_angle+(stop_angle - start_angle)*(i-1)/res),
			point2=involute (base_radius,start_angle+(stop_angle - start_angle)*i/res))
		{
			assign (
				side1_point1=rotate_point (centre_angle, point1),
				side1_point2=rotate_point (centre_angle, point2),
				side2_point1=mirror_point (rotate_point (centre_angle, point1)),
				side2_point2=mirror_point (rotate_point (centre_angle, point2)))
			{
				polygon (
					points=[[0,0],side1_point1,side1_point2,side2_point2,side2_point1],
					paths=[[0,1,2,3,4,0]]);
			}
		}
	}
}

// Mathematical Functions
//===============

// Finds the angle of the involute about the base radius at the given distance (radius) from it's center.
//source: http://www.mathhelpforum.com/math-help/geometry/136011-circle-involute-solving-y-any-given-x.html

function involute_intersect_angle (base_radius, radius) = sqrt (pow (radius/base_radius, 2) - 1) * 180 / pi;

// Calculate the involute position for a given base radius and involute angle.

function rotated_involute (rotate, base_radius, involute_angle) =
[
	cos (rotate) * involute (base_radius, involute_angle)[0] + sin (rotate) * involute (base_radius, involute_angle)[1],
	cos (rotate) * involute (base_radius, involute_angle)[1] - sin (rotate) * involute (base_radius, involute_angle)[0]
];

function mirror_point (coord) =
[
	coord[0],
	-coord[1]
];

function rotate_point (rotate, coord) =
[
	cos (rotate) * coord[0] + sin (rotate) * coord[1],
	cos (rotate) * coord[1] - sin (rotate) * coord[0]
];

function involute (base_radius, involute_angle) =
[
	base_radius*(cos (involute_angle) + involute_angle*pi/180*sin (involute_angle)),
	base_radius*(sin (involute_angle) - involute_angle*pi/180*cos (involute_angle))
];
