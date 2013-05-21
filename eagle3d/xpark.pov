//POVRay-Datei erstellt mit 3d41.ulp v20110101
//C:/Users/c5125630/Dropbox/Software/Xpark/xpark.brd
//10.05.2013 13:35:59

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 163;
#local cam_z = -87;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -3;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 13;
#local lgt1_pos_y = 21;
#local lgt1_pos_z = 20;
#local lgt1_intense = 0.719861;
#local lgt2_pos_x = -13;
#local lgt2_pos_y = 21;
#local lgt2_pos_z = 20;
#local lgt2_intense = 0.719861;
#local lgt3_pos_x = 13;
#local lgt3_pos_y = 21;
#local lgt3_pos_z = -13;
#local lgt3_intense = 0.719861;
#local lgt4_pos_x = -13;
#local lgt4_pos_y = 21;
#local lgt4_pos_z = -13;
#local lgt4_intense = 0.719861;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 36.500000;
#declare pcb_y_size = 38.090000;
#declare pcb_layer1_used = 0;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(929);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animationsdaten
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "Keine/zu wenig Animationsdaten vorhanden (mind. 3 Punkte) (Flugpfad)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "Keine/zu wenig Animationsdaten vorhanden (mind. 3 Punkte) (Blickpunktpfad)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//versetzt die Kamera, sodass <0,0,0> über dem Eagle-Nullpunkt ist
	//translate<-18.250000,0,-19.045000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro XPARK(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Platine
prism{-1.500000,0.000000,8
<0.000000,0.000000><36.500000,0.000000>
<36.500000,0.000000><36.500000,38.090000>
<36.500000,38.090000><0.000000,38.090000>
<0.000000,38.090000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Bohrungen(real)/Bauteile
//Bohrungen(real)/Platine
//Bohrungen(real)/Durchkontaktierungen
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Bauteile
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_ELKO_2MM5_5MM("4.7µF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<11.430000,0.000000,29.210000>}#end		//Elko 2,5mm Pitch, 5mm Durchmesser, 11,2mm Hoehe C1 4.7µF E2,5-5
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_ELKO_2MM5_5MM("4.7µF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<22.860000,0.000000,29.210000>}#end		//Elko 2,5mm Pitch, 5mm Durchmesser, 11,2mm Hoehe C2 4.7µF E2,5-5
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO41_102MM_H("1N4004",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<14.287500,0.000000,33.655000>}#end		//Diode DO35 10mm hor. D1 1N4004 DO41-10
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_DIS_DIP14("TINY24/44/84-PU","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<22.860000,0.000000,15.240000>translate<0,3.000000,0> }#end		//DIP14 IC1 TINY24/44/84-PU DIL14
#ifndef(pack_IC1) object{SOCKET_DIP14()rotate<0,-90.000000,0> rotate<0,0,0> translate<22.860000,0.000000,15.240000>}#end					//IC-Sockel 14Pin IC1 TINY24/44/84-PU
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {TR_TO92_G("LP2950Z",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<17.780000,0.000000,29.210000>}#end		//TO92 gewinckelt stehend IC2 LP2950Z TO92
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<3.810000,0.000000,5.080000>}#end		//Stiftleiste 2,54mm Raster 2Pin 1Reihe (pinhead.lib) JP1 StatusLED 1X02
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<3.810000,0.000000,10.160000>}#end		//Stiftleiste 2,54mm Raster 2Pin 1Reihe (pinhead.lib) JP2 Photoresistor 1X02
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<3.810000,0.000000,15.875000>}#end		//Stiftleiste 2,54mm Raster 2Pin 1Reihe (pinhead.lib) JP3 Red 1X02
#ifndef(pack_JP4) #declare global_pack_JP4=yes; object {CON_PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<3.810000,0.000000,19.685000>}#end		//Stiftleiste 2,54mm Raster 2Pin 1Reihe (pinhead.lib) JP4 Yellow 1X02
#ifndef(pack_JP5) #declare global_pack_JP5=yes; object {CON_PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<3.810000,0.000000,23.495000>}#end		//Stiftleiste 2,54mm Raster 2Pin 1Reihe (pinhead.lib) JP5 Green 1X02
#ifndef(pack_JP6) #declare global_pack_JP6=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<30.797500,0.000000,19.050000>}#end		//Stiftleiste 2,54mm Raster 4Pin 1Reihe (pinhead.lib) JP6 Ultrasonic 1X04
#ifndef(pack_JP7) #declare global_pack_JP7=yes; object {CON_PH_1X6()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<26.352500,0.000000,4.127500>}#end		//Stiftleiste 2,54mm Raster 6Pin 1Reihe (pinhead.lib) JP7 TTL 1X06
#ifndef(pack_Q1) #declare global_pack_Q1=yes; object {TR_TO92_G("BS250",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<29.210000,0.000000,33.020000>}#end		//TO92 gewinkelt stehend Q1 BS250 SOT54E
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<28.257500,0.000000,25.400000>}#end		//Diskreter Widerstand 0,15W 7,5MM Raster R1 10k 0204/7
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0204_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<15.240000,0.000000,6.350000>}#end		//Diskreter Widerstand 0,15W 7,5MM Raster R2 330 0204/7
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<12.700000,0.000000,13.970000>}#end		//Diskreter Widerstand 0,15W 7,5MM Raster R3 100k 0204/7
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0204_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<12.700000,0.000000,16.510000>}#end		//Diskreter Widerstand 0,15W 7,5MM Raster R4 330 0204/7
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0204_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<12.700000,0.000000,19.685000>}#end		//Diskreter Widerstand 0,15W 7,5MM Raster R5 330 0204/7
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0204_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<12.700000,0.000000,23.495000>}#end		//Diskreter Widerstand 0,15W 7,5MM Raster R6 330 0204/7
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0204_054MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<26.670000,0.000000,35.560000>}#end		//Diskreter Widerstand 0,15W 5,4MM Raster R7 10k 0204/5
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0204_054MM(texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<30.480000,0.000000,27.940000>}#end		//Diskreter Widerstand 0,15W 5,4MM Raster R8 220 0204/5
}//End union
#end
#if(pcb_pads_smds=on)
//Lötaugen&SMD/Bauteile
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<11.430000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<11.430000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<22.860000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<22.860000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<9.207500,0,33.655000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<19.367500,0,33.655000> texture{col_thl}}
#ifndef(global_pack_G1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.149600,1.117600,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<5.080000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_G1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.149600,1.117600,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<5.080000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<19.050000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<19.050000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<19.050000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<19.050000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<19.050000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<19.050000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<19.050000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.780000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<15.875000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.780000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<5.080000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<2.540000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<2.540000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<5.080000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<5.080000,0,15.875000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<2.540000,0,15.875000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<5.080000,0,19.685000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<2.540000,0,19.685000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<5.080000,0,23.495000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<2.540000,0,23.495000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.797500,0,15.240000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.797500,0,17.780000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.797500,0,20.320000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.797500,0,22.860000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.002500,0,4.127500> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<22.542500,0,4.127500> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<25.082500,0,4.127500> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<27.622500,0,4.127500> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<30.162500,0,4.127500> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<32.702500,0,4.127500> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<30.480000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<29.210000,0,31.115000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<27.940000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<32.067500,0,25.400000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<24.447500,0,25.400000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<15.240000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<15.240000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<16.510000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<8.890000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<8.890000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<16.510000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<8.890000,0,19.685000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<16.510000,0,19.685000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<8.890000,0,23.495000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<16.510000,0,23.495000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.130000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<29.210000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<27.940000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,27.940000> texture{col_thl}}
//Lötaugen/Durchkontaktierungen
#end
#if(pcb_wires=on)
union{
//Signale
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,10.160000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<2.540000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,19.685000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.540000,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,15.875000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.080000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,19.685000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.080000,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,23.495000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.080000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,16.510000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.080000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,19.685000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.890000,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,20.320000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.080000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,23.495000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.890000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,24.130000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.080000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,33.020000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.080000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.207500,-1.535000,33.655000>}
box{<0,0,-0.203200><0.709952,0.035000,0.203200> rotate<0,-63.430762,0> translate<8.890000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,-1.535000,10.160000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.080000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,5.080000>}
box{<0,0,-0.203200><6.350000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.080000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.652500,-1.535000,12.065000>}
box{<0,0,-0.203200><3.978264,0.035000,0.203200> rotate<0,-28.608571,0> translate<10.160000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,2.540000>}
box{<0,0,-0.203200><4.579050,0.035000,0.203200> rotate<0,33.687844,0> translate<11.430000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,7.620000>}
box{<0,0,-0.203200><13.970000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.540000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.652500,-1.535000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,13.970000>}
box{<0,0,-0.203200><3.434288,0.035000,0.203200> rotate<0,-33.687844,0> translate<13.652500,-1.535000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,19.685000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.510000,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,23.495000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,90.000000,0> translate<16.510000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,8.890000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.510000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,17.780000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.510000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,30.480000>}
box{<0,0,-0.203200><6.350000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.430000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,10.160000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.240000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,15.240000>}
box{<0,0,-0.203200><2.839806,0.035000,0.203200> rotate<0,-26.563298,0> translate<16.510000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,17.780000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.780000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,20.320000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.510000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,22.860000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.510000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.367500,-1.535000,33.655000>}
box{<0,0,-0.203200><3.549758,0.035000,0.203200> rotate<0,-63.430762,0> translate<17.780000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,27.940000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.780000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,27.940000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.860000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,8.890000>}
box{<0,0,-0.203200><6.350000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.780000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,8.890000>}
box{<0,0,-0.203200><16.510000,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.130000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,25.400000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.860000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.447500,-1.535000,8.890000>}
box{<0,0,-0.203200><0.317500,0.035000,0.203200> rotate<0,0.000000,0> translate<24.130000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.447500,-1.535000,25.400000>}
box{<0,0,-0.203200><0.317500,0.035000,0.203200> rotate<0,0.000000,0> translate<24.130000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.447500,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,7.620000>}
box{<0,0,-0.203200><2.559767,0.035000,0.203200> rotate<0,29.742918,0> translate<24.447500,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,22.860000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.670000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,33.020000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<24.130000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.622500,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.622500,-1.535000,4.127500>}
box{<0,0,-0.203200><0.317500,0.035000,0.203200> rotate<0,90.000000,0> translate<27.622500,-1.535000,4.127500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.622500,-1.535000,4.127500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,5.080000>}
box{<0,0,-0.203200><1.004023,0.035000,0.203200> rotate<0,-71.560328,0> translate<27.622500,-1.535000,4.127500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,27.940000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.670000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,33.020000>}
box{<0,0,-0.203200><7.184205,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.860000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,33.020000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.670000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,-1.535000,16.510000>}
box{<0,0,-0.203200><2.289525,0.035000,0.203200> rotate<0,-33.687844,0> translate<26.670000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,6.667500>}
box{<0,0,-0.203200><2.032992,0.035000,0.203200> rotate<0,-51.336803,0> translate<27.940000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,6.667500>}
box{<0,0,-0.203200><3.492500,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.210000,-1.535000,6.667500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,10.160000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.670000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,31.115000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.210000,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,34.290000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.210000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.162500,-1.535000,4.127500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,5.080000>}
box{<0,0,-0.203200><1.004023,0.035000,0.203200> rotate<0,-71.560328,0> translate<30.162500,-1.535000,4.127500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,33.020000>}
box{<0,0,-0.203200><10.160000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.480000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.797500,-1.535000,17.780000>}
box{<0,0,-0.203200><4.127500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.670000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.797500,-1.535000,20.320000>}
box{<0,0,-0.203200><4.127500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.670000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.797500,-1.535000,22.860000>}
box{<0,0,-0.203200><0.317500,0.035000,0.203200> rotate<0,0.000000,0> translate<30.480000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.067500,-1.535000,6.985000>}
box{<0,0,-0.203200><2.479754,0.035000,0.203200> rotate<0,-50.191116,0> translate<30.480000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.067500,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.067500,-1.535000,6.985000>}
box{<0,0,-0.203200><5.715000,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.067500,-1.535000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.067500,-1.535000,12.700000>}
box{<0,0,-0.203200><5.397500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.670000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.067500,-1.535000,25.400000>}
box{<0,0,-0.203200><0.317500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.750000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,27.940000>}
box{<0,0,-0.203200><6.350000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.020000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,34.290000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.210000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,16.510000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.575000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.067500,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,25.400000>}
box{<0,0,-0.203200><1.587500,0.035000,0.203200> rotate<0,0.000000,0> translate<32.067500,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,25.400000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.655000,-1.535000,25.400000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygone
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,1.219197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,36.870800>}
box{<0,0,-0.203200><35.651603,0.035000,0.203200> rotate<0,90.000000,0> translate<1.219197,-1.535000,36.870800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,1.219197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,1.219197>}
box{<0,0,-0.203200><34.061603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,1.219197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,1.219200>}
box{<0,0,-0.203200><34.061603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.502031,-1.535000,1.625600>}
box{<0,0,-0.203200><13.282834,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.095631,-1.535000,2.032000>}
box{<0,0,-0.203200><12.876434,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.071600,-1.535000,2.438400>}
box{<0,0,-0.203200><12.852403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.500666,-1.535000,2.844800>}
box{<0,0,-0.203200><12.281469,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.948191,-1.535000,3.251200>}
box{<0,0,-0.203200><0.728994,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.512794,-1.535000,3.657600>}
box{<0,0,-0.203200><0.293597,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.345831,-1.535000,4.064000>}
box{<0,0,-0.203200><0.126634,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,4.470400>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,4.876800>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,5.283200>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,5.689600>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.345834,-1.535000,6.096000>}
box{<0,0,-0.203200><0.126638,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.512800,-1.535000,6.502400>}
box{<0,0,-0.203200><0.293603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.948200,-1.535000,6.908800>}
box{<0,0,-0.203200><0.729003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.896453,-1.535000,7.315200>}
box{<0,0,-0.203200><0.677256,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.828800,-1.535000,7.721600>}
box{<0,0,-0.203200><0.609603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.828800,-1.535000,8.128000>}
box{<0,0,-0.203200><0.609603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.607547,-1.535000,8.534400>}
box{<0,0,-0.203200><0.388350,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.354738,-1.535000,8.940800>}
box{<0,0,-0.203200><0.135541,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,9.347200>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,9.753600>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,10.160000>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,10.566400>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,10.972800>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.354744,-1.535000,11.379200>}
box{<0,0,-0.203200><0.135547,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.607550,-1.535000,11.785600>}
box{<0,0,-0.203200><0.388353,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.400125,-1.535000,12.192000>}
box{<0,0,-0.203200><11.180928,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.145191,-1.535000,12.598400>}
box{<0,0,-0.203200><11.925994,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.274675,-1.535000,13.004800>}
box{<0,0,-0.203200><7.055478,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.868275,-1.535000,13.411200>}
box{<0,0,-0.203200><6.649078,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.772400,-1.535000,13.817600>}
box{<0,0,-0.203200><6.553203,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.704791,-1.535000,14.224000>}
box{<0,0,-0.203200><0.485594,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.417553,-1.535000,14.630400>}
box{<0,0,-0.203200><0.198356,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,15.036800>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,15.443200>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,15.849600>}
box{<0,0,-0.203200><1.269981,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,16.256000>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,16.662400>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.398359,-1.535000,17.068800>}
box{<0,0,-0.203200><0.179163,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.653994,-1.535000,17.475200>}
box{<0,0,-0.203200><0.434797,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.899138,-1.535000,17.881600>}
box{<0,0,-0.203200><0.679941,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.495206,-1.535000,18.288000>}
box{<0,0,-0.203200><0.276009,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.341809,-1.535000,18.694400>}
box{<0,0,-0.203200><0.122613,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,19.100800>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,19.507200>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,19.913600>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,20.320000>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.349856,-1.535000,20.726400>}
box{<0,0,-0.203200><0.130659,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.531253,-1.535000,21.132800>}
box{<0,0,-0.203200><0.312056,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.998050,-1.535000,21.539200>}
box{<0,0,-0.203200><0.778853,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.605063,-1.535000,21.945600>}
box{<0,0,-0.203200><0.385866,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.381850,-1.535000,22.352000>}
box{<0,0,-0.203200><0.162653,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,22.758400>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,23.164800>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,23.571200>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,23.977600>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.325719,-1.535000,24.384000>}
box{<0,0,-0.203200><0.106522,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.443444,-1.535000,24.790400>}
box{<0,0,-0.203200><0.224247,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.759303,-1.535000,25.196800>}
box{<0,0,-0.203200><0.540106,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.148800,-1.535000,25.603200>}
box{<0,0,-0.203200><20.929603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.136719,-1.535000,26.009600>}
box{<0,0,-0.203200><2.917522,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.730319,-1.535000,26.416000>}
box{<0,0,-0.203200><2.511122,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.323919,-1.535000,26.822400>}
box{<0,0,-0.203200><2.104722,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,27.228800>}
box{<0,0,-0.203200><1.828803,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,27.635200>}
box{<0,0,-0.203200><1.828803,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,28.041600>}
box{<0,0,-0.203200><1.828803,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,28.448000>}
box{<0,0,-0.203200><1.828803,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.120722,-1.535000,28.854400>}
box{<0,0,-0.203200><1.901525,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.527122,-1.535000,29.260800>}
box{<0,0,-0.203200><2.307925,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.933522,-1.535000,29.667200>}
box{<0,0,-0.203200><2.714325,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.182456,-1.535000,30.073600>}
box{<0,0,-0.203200><8.963259,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.121900,-1.535000,30.480000>}
box{<0,0,-0.203200><8.902703,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.182462,-1.535000,30.886400>}
box{<0,0,-0.203200><8.963266,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.861675,-1.535000,31.292800>}
box{<0,0,-0.203200><2.642478,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.455275,-1.535000,31.699200>}
box{<0,0,-0.203200><2.236078,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048875,-1.535000,32.105600>}
box{<0,0,-0.203200><1.829678,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.997200,-1.535000,32.512000>}
box{<0,0,-0.203200><1.778003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.997200,-1.535000,32.918400>}
box{<0,0,-0.203200><1.778003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.997200,-1.535000,33.324800>}
box{<0,0,-0.203200><1.778003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.997200,-1.535000,33.731200>}
box{<0,0,-0.203200><1.778003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.252078,-1.535000,34.137600>}
box{<0,0,-0.203200><2.032881,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.658478,-1.535000,34.544000>}
box{<0,0,-0.203200><2.439281,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064878,-1.535000,34.950400>}
box{<0,0,-0.203200><2.845681,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.961600,-1.535000,35.356800>}
box{<0,0,-0.203200><21.742403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.961600,-1.535000,35.763200>}
box{<0,0,-0.203200><21.742403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.087234,-1.535000,36.169600>}
box{<0,0,-0.203200><21.868037,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493634,-1.535000,36.576000>}
box{<0,0,-0.203200><22.274438,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,-1.535000,36.870800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,36.870800>}
box{<0,0,-0.203200><34.061603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,-1.535000,36.870800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,9.145378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.463347,-1.535000,8.678600>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<1.270000,-1.535000,9.145378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,11.174619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,9.145378>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.270000,-1.535000,9.145378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,11.174619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.463347,-1.535000,11.641397>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<1.270000,-1.535000,11.174619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320797,-1.535000,5.130800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,5.937953>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,-89.993839,0> translate<1.320797,-1.535000,5.130800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320797,-1.535000,5.130800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,5.130800>}
box{<0,0,-0.203200><1.168381,0.035000,0.203200> rotate<0,0.000000,0> translate<1.320797,-1.535000,5.130800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320797,-1.535000,15.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,16.732953>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,-89.993839,0> translate<1.320797,-1.535000,15.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320797,-1.535000,15.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,15.925800>}
box{<0,0,-0.203200><1.168381,0.035000,0.203200> rotate<0,0.000000,0> translate<1.320797,-1.535000,15.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320797,-1.535000,19.735800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,20.542953>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,-89.993839,0> translate<1.320797,-1.535000,19.735800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320797,-1.535000,19.735800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,19.735800>}
box{<0,0,-0.203200><1.168381,0.035000,0.203200> rotate<0,0.000000,0> translate<1.320797,-1.535000,19.735800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320797,-1.535000,23.545800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,24.352953>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,-89.993839,0> translate<1.320797,-1.535000,23.545800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320797,-1.535000,23.545800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,23.545800>}
box{<0,0,-0.203200><1.168381,0.035000,0.203200> rotate<0,0.000000,0> translate<1.320797,-1.535000,23.545800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,4.222044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,4.032500>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<1.320800,-1.535000,4.222044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,5.029194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,4.222044>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.320800,-1.535000,4.222044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,5.029194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,5.029194>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<1.320800,-1.535000,5.029194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,5.937953>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,6.127497>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<1.320800,-1.535000,5.937953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,15.017044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,14.827500>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<1.320800,-1.535000,15.017044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,15.824194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,15.017044>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.320800,-1.535000,15.017044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,15.824194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,15.824194>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<1.320800,-1.535000,15.824194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,16.732953>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,16.922497>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<1.320800,-1.535000,16.732953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,18.827044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,18.637500>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<1.320800,-1.535000,18.827044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,19.634194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,18.827044>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.320800,-1.535000,18.827044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,19.634194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,19.634194>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<1.320800,-1.535000,19.634194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,20.542953>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,20.732497>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<1.320800,-1.535000,20.542953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,22.637044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,22.447500>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<1.320800,-1.535000,22.637044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,23.444194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,22.637044>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.320800,-1.535000,22.637044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,23.444194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,23.444194>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<1.320800,-1.535000,23.444194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.320800,-1.535000,24.352953>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,24.542497>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<1.320800,-1.535000,24.352953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,4.032500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,3.849988>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<1.350822,-1.535000,4.032500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,6.127497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,6.310009>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<1.350822,-1.535000,6.127497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,14.827500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,14.644988>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<1.350822,-1.535000,14.827500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,16.922497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,17.105009>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<1.350822,-1.535000,16.922497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,18.637500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,18.454988>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<1.350822,-1.535000,18.637500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,20.732497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,20.915009>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<1.350822,-1.535000,20.732497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,22.447500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,22.264988>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<1.350822,-1.535000,22.447500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.350822,-1.535000,24.542497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,24.725009>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<1.350822,-1.535000,24.542497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,3.849988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,3.679000>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<1.410122,-1.535000,3.849988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,6.310009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,6.480997>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<1.410122,-1.535000,6.310009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,14.644988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,14.474000>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<1.410122,-1.535000,14.644988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,17.105009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,17.275997>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<1.410122,-1.535000,17.105009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,18.454988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,18.284000>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<1.410122,-1.535000,18.454988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,20.915009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,21.085997>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<1.410122,-1.535000,20.915009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,22.264988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,22.094000>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<1.410122,-1.535000,22.264988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.410122,-1.535000,24.725009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,24.895997>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<1.410122,-1.535000,24.725009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.463347,-1.535000,8.678600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.820600,-1.535000,8.321347>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<1.463347,-1.535000,8.678600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.463347,-1.535000,11.641397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.820600,-1.535000,11.998650>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.463347,-1.535000,11.641397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,3.679000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,3.523744>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<1.497247,-1.535000,3.679000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,6.480997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,6.636253>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<1.497247,-1.535000,6.480997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,14.474000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,14.318744>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<1.497247,-1.535000,14.474000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,17.275997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,17.431253>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<1.497247,-1.535000,17.275997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,18.284000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,18.128744>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<1.497247,-1.535000,18.284000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,21.085997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,21.241253>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<1.497247,-1.535000,21.085997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,22.094000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,21.938744>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<1.497247,-1.535000,22.094000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.497247,-1.535000,24.895997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,25.051253>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<1.497247,-1.535000,24.895997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,3.523744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,3.388047>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<1.610047,-1.535000,3.523744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,6.636253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,6.771950>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.610047,-1.535000,6.636253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,14.318744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,14.183047>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<1.610047,-1.535000,14.318744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,17.431253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,17.566950>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.610047,-1.535000,17.431253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,18.128744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,17.993047>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<1.610047,-1.535000,18.128744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,21.241253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,21.376950>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.610047,-1.535000,21.241253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,21.938744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,21.803047>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<1.610047,-1.535000,21.938744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610047,-1.535000,25.051253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,25.186950>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.610047,-1.535000,25.051253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,3.388047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,3.275247>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<1.745744,-1.535000,3.388047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,6.771950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,6.884750>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<1.745744,-1.535000,6.771950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,14.183047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,14.070247>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<1.745744,-1.535000,14.183047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,17.566950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,17.679750>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<1.745744,-1.535000,17.566950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,17.993047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,17.880247>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<1.745744,-1.535000,17.993047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,21.376950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,21.489750>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<1.745744,-1.535000,21.376950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,21.803047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,21.690247>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<1.745744,-1.535000,21.803047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.745744,-1.535000,25.186950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,25.299750>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<1.745744,-1.535000,25.186950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.820600,-1.535000,8.321347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.828800,-1.535000,8.317950>}
box{<0,0,-0.203200><0.008876,0.035000,0.203200> rotate<0,22.500446,0> translate<1.820600,-1.535000,8.321347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.820600,-1.535000,11.998650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.287378,-1.535000,12.191997>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<1.820600,-1.535000,11.998650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.828800,-1.535000,7.478531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.937072,-1.535000,7.217138>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,67.495725,0> translate<1.828800,-1.535000,7.478531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.828800,-1.535000,8.317950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.828800,-1.535000,7.478531>}
box{<0,0,-0.203200><0.839419,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.828800,-1.535000,7.478531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,3.275247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,3.188122>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<1.901000,-1.535000,3.275247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,6.884750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,6.971875>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<1.901000,-1.535000,6.884750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,14.070247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,13.983122>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<1.901000,-1.535000,14.070247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,17.679750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,17.766875>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<1.901000,-1.535000,17.679750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,17.880247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,17.793122>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<1.901000,-1.535000,17.880247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,21.489750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,21.576875>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<1.901000,-1.535000,21.489750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,21.690247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,21.603122>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<1.901000,-1.535000,21.690247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.901000,-1.535000,25.299750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,25.386875>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<1.901000,-1.535000,25.299750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.937072,-1.535000,7.217138>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.137138,-1.535000,7.017072>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,44.997030,0> translate<1.937072,-1.535000,7.217138> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,3.188122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.254500,-1.535000,3.128822>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,17.998271,0> translate<2.071988,-1.535000,3.188122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,6.971875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.169653,-1.535000,7.003606>}
box{<0,0,-0.203200><0.102691,0.035000,0.203200> rotate<0,-17.997626,0> translate<2.071988,-1.535000,6.971875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,13.983122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.254500,-1.535000,13.923822>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,17.998271,0> translate<2.071988,-1.535000,13.983122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,17.766875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.112381,-1.535000,17.780000>}
box{<0,0,-0.203200><0.042473,0.035000,0.203200> rotate<0,-17.999165,0> translate<2.071988,-1.535000,17.766875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,17.793122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.112381,-1.535000,17.780000>}
box{<0,0,-0.203200><0.042472,0.035000,0.203200> rotate<0,17.995156,0> translate<2.071988,-1.535000,17.793122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,21.576875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.112384,-1.535000,21.589997>}
box{<0,0,-0.203200><0.042475,0.035000,0.203200> rotate<0,-17.993853,0> translate<2.071988,-1.535000,21.576875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,21.603122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.112384,-1.535000,21.589997>}
box{<0,0,-0.203200><0.042476,0.035000,0.203200> rotate<0,17.997862,0> translate<2.071988,-1.535000,21.603122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.071988,-1.535000,25.386875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.254500,-1.535000,25.446175>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-17.998271,0> translate<2.071988,-1.535000,25.386875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.137138,-1.535000,7.017072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.169653,-1.535000,7.003606>}
box{<0,0,-0.203200><0.035194,0.035000,0.203200> rotate<0,22.494322,0> translate<2.137138,-1.535000,7.017072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.254500,-1.535000,3.128822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.444044,-1.535000,3.098800>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,8.999729,0> translate<2.254500,-1.535000,3.128822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.254500,-1.535000,13.923822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.444044,-1.535000,13.893800>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,8.999729,0> translate<2.254500,-1.535000,13.923822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.254500,-1.535000,25.446175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.444044,-1.535000,25.476197>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-8.999729,0> translate<2.254500,-1.535000,25.446175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.287378,-1.535000,12.191997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.792619,-1.535000,12.191997>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,0.000000,0> translate<2.287378,-1.535000,12.191997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.444044,-1.535000,3.098800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,3.098797>}
box{<0,0,-0.203200><0.045150,0.035000,0.203200> rotate<0,0.003965,0> translate<2.444044,-1.535000,3.098800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.444044,-1.535000,13.893800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,13.893797>}
box{<0,0,-0.203200><0.045150,0.035000,0.203200> rotate<0,0.003965,0> translate<2.444044,-1.535000,13.893800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.444044,-1.535000,25.476197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,25.476197>}
box{<0,0,-0.203200><0.045150,0.035000,0.203200> rotate<0,0.000000,0> translate<2.444044,-1.535000,25.476197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,5.130800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,5.029194>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.489178,-1.535000,5.029194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,15.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,15.824194>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.489178,-1.535000,15.824194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,19.735800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,19.634194>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.489178,-1.535000,19.634194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,23.545800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489178,-1.535000,23.444194>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.489178,-1.535000,23.444194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,3.098797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,5.029178>}
box{<0,0,-0.203200><1.930381,0.035000,0.203200> rotate<0,90.000000,0> translate<2.489194,-1.535000,5.029178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,3.251200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,3.657600>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,4.064000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,4.470400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,4.876800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,5.029178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,5.029178>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,5.029178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,13.893797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,15.824178>}
box{<0,0,-0.203200><1.930381,0.035000,0.203200> rotate<0,90.000000,0> translate<2.489194,-1.535000,15.824178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,14.224000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,14.630400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,15.036800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,15.443200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,15.824178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,15.824178>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,15.824178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,15.925819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,19.634178>}
box{<0,0,-0.203200><3.708359,0.035000,0.203200> rotate<0,90.000000,0> translate<2.489194,-1.535000,19.634178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,15.925819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,15.925819>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,15.925819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,16.256000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,16.662400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,17.068800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,17.475200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,17.881600>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,18.288000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,18.694400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,19.100800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,19.507200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,19.634178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,19.634178>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,19.634178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,19.735819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,23.444178>}
box{<0,0,-0.203200><3.708359,0.035000,0.203200> rotate<0,90.000000,0> translate<2.489194,-1.535000,23.444178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,19.735819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,19.735819>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,19.735819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,19.913600>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,20.320000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,20.726400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,21.132800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,21.539200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,21.945600>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,22.352000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,22.758400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,23.164800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,23.444178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,23.444178>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,23.444178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,23.545819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,25.476197>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,90.000000,0> translate<2.489194,-1.535000,25.476197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,23.545819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,23.545819>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,23.545819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,23.571200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,23.977600>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,24.384000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,24.790400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.489194,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,25.196800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<2.489194,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,3.098800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.635953,-1.535000,3.098800>}
box{<0,0,-0.203200><0.045153,0.035000,0.203200> rotate<0,0.000000,0> translate<2.590800,-1.535000,3.098800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,5.029178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,3.098800>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.590800,-1.535000,3.098800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,13.893800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.635953,-1.535000,13.893800>}
box{<0,0,-0.203200><0.045153,0.035000,0.203200> rotate<0,0.000000,0> translate<2.590800,-1.535000,13.893800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,15.824178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,13.893800>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.590800,-1.535000,13.893800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,17.856197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,15.925819>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.590800,-1.535000,15.925819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,19.634178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,17.856197>}
box{<0,0,-0.203200><1.777981,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.590800,-1.535000,17.856197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,21.513800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,19.735819>}
box{<0,0,-0.203200><1.777981,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.590800,-1.535000,19.735819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,23.444178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,21.513800>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.590800,-1.535000,21.513800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,25.476197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,23.545819>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.590800,-1.535000,23.545819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590800,-1.535000,25.476197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.635953,-1.535000,25.476197>}
box{<0,0,-0.203200><0.045153,0.035000,0.203200> rotate<0,0.000000,0> translate<2.590800,-1.535000,25.476197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,5.029194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,5.130800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,90.000000,0> translate<2.590819,-1.535000,5.130800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,5.029194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,5.029194>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<2.590819,-1.535000,5.029194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,5.130800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,5.130800>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<2.590819,-1.535000,5.130800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,15.824194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,15.925800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,90.000000,0> translate<2.590819,-1.535000,15.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,15.824194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,15.824194>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<2.590819,-1.535000,15.824194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,15.849600>}
box{<0,0,-0.203200><1.219181,0.035000,0.203200> rotate<0,0.000000,0> translate<2.590819,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,15.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,15.925800>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<2.590819,-1.535000,15.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,19.634194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,19.735800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,90.000000,0> translate<2.590819,-1.535000,19.735800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,19.634194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,19.634194>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<2.590819,-1.535000,19.634194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,19.735800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,19.735800>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<2.590819,-1.535000,19.735800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,23.444194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,23.545800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,90.000000,0> translate<2.590819,-1.535000,23.545800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,23.444194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,23.444194>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<2.590819,-1.535000,23.444194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.590819,-1.535000,23.545800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,23.545800>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<2.590819,-1.535000,23.545800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.635953,-1.535000,3.098800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.825497,-1.535000,3.128822>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-8.999729,0> translate<2.635953,-1.535000,3.098800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.635953,-1.535000,13.893800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.825497,-1.535000,13.923822>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-8.999729,0> translate<2.635953,-1.535000,13.893800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.635953,-1.535000,25.476197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.825497,-1.535000,25.446175>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,8.999729,0> translate<2.635953,-1.535000,25.476197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.792619,-1.535000,12.191997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.259397,-1.535000,11.998650>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<2.792619,-1.535000,12.191997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.825497,-1.535000,3.128822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,3.188122>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-17.998271,0> translate<2.825497,-1.535000,3.128822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.825497,-1.535000,13.923822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,13.983122>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-17.998271,0> translate<2.825497,-1.535000,13.923822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.825497,-1.535000,25.446175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,25.386875>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,17.998271,0> translate<2.825497,-1.535000,25.446175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.967612,-1.535000,21.589997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,21.576875>}
box{<0,0,-0.203200><0.042475,0.035000,0.203200> rotate<0,17.993853,0> translate<2.967612,-1.535000,21.589997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.967612,-1.535000,21.589997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,21.603122>}
box{<0,0,-0.203200><0.042476,0.035000,0.203200> rotate<0,-17.997862,0> translate<2.967612,-1.535000,21.589997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.967616,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,17.766875>}
box{<0,0,-0.203200><0.042473,0.035000,0.203200> rotate<0,17.999165,0> translate<2.967616,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.967616,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,17.793122>}
box{<0,0,-0.203200><0.042472,0.035000,0.203200> rotate<0,-17.995156,0> translate<2.967616,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.997200,-1.535000,32.157275>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.217275,-1.535000,30.937200>}
box{<0,0,-0.203200><1.725447,0.035000,0.203200> rotate<0,44.997030,0> translate<2.997200,-1.535000,32.157275> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.997200,-1.535000,33.882722>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.997200,-1.535000,32.157275>}
box{<0,0,-0.203200><1.725447,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.997200,-1.535000,32.157275> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.997200,-1.535000,33.882722>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.217275,-1.535000,35.102797>}
box{<0,0,-0.203200><1.725447,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.997200,-1.535000,33.882722> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,3.188122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,3.275247>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<3.008009,-1.535000,3.188122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,13.983122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,14.070247>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<3.008009,-1.535000,13.983122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,17.766875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,17.679750>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<3.008009,-1.535000,17.766875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,17.793122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,17.880247>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<3.008009,-1.535000,17.793122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,21.576875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,21.489750>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<3.008009,-1.535000,21.576875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,21.603122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,21.690247>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<3.008009,-1.535000,21.603122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.008009,-1.535000,25.386875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,25.299750>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<3.008009,-1.535000,25.386875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.047997,-1.535000,28.016200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,28.781678>}
box{<0,0,-0.203200><0.765478,0.035000,0.203200> rotate<0,-89.993826,0> translate<3.047997,-1.535000,28.016200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.047997,-1.535000,28.016200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003778,-1.535000,28.016200>}
box{<0,0,-0.203200><1.955781,0.035000,0.203200> rotate<0,0.000000,0> translate<3.047997,-1.535000,28.016200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,27.098319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.238319,-1.535000,25.908000>}
box{<0,0,-0.203200><1.683365,0.035000,0.203200> rotate<0,44.997030,0> translate<3.048000,-1.535000,27.098319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,27.863794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,27.098319>}
box{<0,0,-0.203200><0.765475,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.048000,-1.535000,27.098319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,27.863794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003778,-1.535000,27.863794>}
box{<0,0,-0.203200><1.955778,0.035000,0.203200> rotate<0,0.000000,0> translate<3.048000,-1.535000,27.863794> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,28.781678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.238319,-1.535000,29.971997>}
box{<0,0,-0.203200><1.683365,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.048000,-1.535000,28.781678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.081950,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.398144,-1.535000,21.539200>}
box{<0,0,-0.203200><1.316194,0.035000,0.203200> rotate<0,0.000000,0> translate<3.081950,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.131794,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,6.884750>}
box{<0,0,-0.203200><0.052977,0.035000,0.203200> rotate<0,26.997068,0> translate<3.131794,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.131794,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.350753,-1.535000,6.908800>}
box{<0,0,-0.203200><1.218959,0.035000,0.203200> rotate<0,0.000000,0> translate<3.131794,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.131803,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.350747,-1.535000,3.251200>}
box{<0,0,-0.203200><1.218944,0.035000,0.203200> rotate<0,0.000000,0> translate<3.131803,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,3.275247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,3.388047>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<3.178997,-1.535000,3.275247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,6.884750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,6.771950>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<3.178997,-1.535000,6.884750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,14.070247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,14.183047>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<3.178997,-1.535000,14.070247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,17.679750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,17.566950>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<3.178997,-1.535000,17.679750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,17.880247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,17.993047>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<3.178997,-1.535000,17.880247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,21.489750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,21.376950>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<3.178997,-1.535000,21.489750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,21.690247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,21.803047>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<3.178997,-1.535000,21.690247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.178997,-1.535000,25.299750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,25.186950>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<3.178997,-1.535000,25.299750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.180856,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.325347,-1.535000,17.881600>}
box{<0,0,-0.203200><1.144491,0.035000,0.203200> rotate<0,0.000000,0> translate<3.180856,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.259397,-1.535000,11.998650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.616650,-1.535000,11.641397>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<3.259397,-1.535000,11.998650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.269244,-1.535000,8.331197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.616650,-1.535000,8.678600>}
box{<0,0,-0.203200><0.491304,0.035000,0.203200> rotate<0,-44.996772,0> translate<3.269244,-1.535000,8.331197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.269244,-1.535000,8.331197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.350753,-1.535000,8.331197>}
box{<0,0,-0.203200><1.081509,0.035000,0.203200> rotate<0,0.000000,0> translate<3.269244,-1.535000,8.331197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.320697,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.223750,-1.535000,25.196800>}
box{<0,0,-0.203200><0.903053,0.035000,0.203200> rotate<0,0.000000,0> translate<3.320697,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,3.388047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,3.523744>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.334253,-1.535000,3.388047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,6.771950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,6.636253>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<3.334253,-1.535000,6.771950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,14.183047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,14.318744>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.334253,-1.535000,14.183047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,17.566950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,17.431253>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<3.334253,-1.535000,17.566950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,17.993047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,18.128744>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.334253,-1.535000,17.993047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,21.376950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,21.241253>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<3.334253,-1.535000,21.376950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,21.803047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,21.938744>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.334253,-1.535000,21.803047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.334253,-1.535000,25.186950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,25.051253>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<3.334253,-1.535000,25.186950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.375206,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.172947,-1.535000,14.224000>}
box{<0,0,-0.203200><0.797741,0.035000,0.203200> rotate<0,0.000000,0> translate<3.375206,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.426003,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.122150,-1.535000,17.475200>}
box{<0,0,-0.203200><0.696147,0.035000,0.203200> rotate<0,0.000000,0> translate<3.426003,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,3.523744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,3.679000>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<3.469950,-1.535000,3.523744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,6.636253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,6.480997>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<3.469950,-1.535000,6.636253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,14.318744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,14.474000>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<3.469950,-1.535000,14.318744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,17.431253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,17.275997>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<3.469950,-1.535000,17.431253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,18.128744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,18.284000>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<3.469950,-1.535000,18.128744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,21.241253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,21.085997>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<3.469950,-1.535000,21.241253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,21.938744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,22.094000>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<3.469950,-1.535000,21.938744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.469950,-1.535000,25.051253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,24.895997>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<3.469950,-1.535000,25.051253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.472447,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.147547,-1.535000,8.534400>}
box{<0,0,-0.203200><0.675100,0.035000,0.203200> rotate<0,0.000000,0> translate<3.472447,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.472447,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.147550,-1.535000,11.785600>}
box{<0,0,-0.203200><0.675103,0.035000,0.203200> rotate<0,0.000000,0> translate<3.472447,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.474931,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.071347,-1.535000,21.945600>}
box{<0,0,-0.203200><0.596416,0.035000,0.203200> rotate<0,0.000000,0> translate<3.474931,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.548747,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.989431,-1.535000,21.132800>}
box{<0,0,-0.203200><0.440684,0.035000,0.203200> rotate<0,0.000000,0> translate<3.548747,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.567200,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.978906,-1.535000,3.657600>}
box{<0,0,-0.203200><0.411706,0.035000,0.203200> rotate<0,0.000000,0> translate<3.567200,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.567200,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.978913,-1.535000,6.502400>}
box{<0,0,-0.203200><0.411713,0.035000,0.203200> rotate<0,0.000000,0> translate<3.567200,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,3.679000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,3.849988>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<3.582750,-1.535000,3.679000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,6.480997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,6.310009>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<3.582750,-1.535000,6.480997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,14.474000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,14.644988>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<3.582750,-1.535000,14.474000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,17.275997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,17.105009>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<3.582750,-1.535000,17.275997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,18.284000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,18.454988>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<3.582750,-1.535000,18.284000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,21.085997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,20.915009>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<3.582750,-1.535000,21.085997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,22.094000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,22.264988>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<3.582750,-1.535000,22.094000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.582750,-1.535000,24.895997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,24.725009>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<3.582750,-1.535000,24.895997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.584788,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.968384,-1.535000,18.288000>}
box{<0,0,-0.203200><0.383597,0.035000,0.203200> rotate<0,0.000000,0> translate<3.584788,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.616650,-1.535000,8.678600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.809997,-1.535000,9.145378>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<3.616650,-1.535000,8.678600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.616650,-1.535000,11.641397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.809997,-1.535000,11.174619>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<3.616650,-1.535000,11.641397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.636556,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.926306,-1.535000,24.790400>}
box{<0,0,-0.203200><0.289750,0.035000,0.203200> rotate<0,0.000000,0> translate<3.636556,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.662441,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.905259,-1.535000,14.630400>}
box{<0,0,-0.203200><0.242819,0.035000,0.203200> rotate<0,0.000000,0> translate<3.662441,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,3.849988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,4.032500>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<3.669875,-1.535000,3.849988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,6.310009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,6.127497>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<3.669875,-1.535000,6.310009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,14.644988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,14.827500>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<3.669875,-1.535000,14.644988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,17.105009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,16.922497>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<3.669875,-1.535000,17.105009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,18.454988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,18.637500>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<3.669875,-1.535000,18.454988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,20.915009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,20.732497>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<3.669875,-1.535000,20.915009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,22.264988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,22.447500>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<3.669875,-1.535000,22.264988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.669875,-1.535000,24.725009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,24.542497>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<3.669875,-1.535000,24.725009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.681641,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.884222,-1.535000,17.068800>}
box{<0,0,-0.203200><0.202581,0.035000,0.203200> rotate<0,0.000000,0> translate<3.681641,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.698144,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.863175,-1.535000,22.352000>}
box{<0,0,-0.203200><0.165031,0.035000,0.203200> rotate<0,0.000000,0> translate<3.698144,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.725256,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.894738,-1.535000,8.940800>}
box{<0,0,-0.203200><0.169481,0.035000,0.203200> rotate<0,0.000000,0> translate<3.725256,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.725256,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.894744,-1.535000,11.379200>}
box{<0,0,-0.203200><0.169488,0.035000,0.203200> rotate<0,0.000000,0> translate<3.725256,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,4.032500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,4.222044>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<3.729175,-1.535000,4.032500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,6.127497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,5.937953>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<3.729175,-1.535000,6.127497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,14.827500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,15.017044>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<3.729175,-1.535000,14.827500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,16.922497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,16.732953>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<3.729175,-1.535000,16.922497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,18.637500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,18.827044>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<3.729175,-1.535000,18.637500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,20.732497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,20.542953>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<3.729175,-1.535000,20.732497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,22.447500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,22.637044>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<3.729175,-1.535000,22.447500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.729175,-1.535000,24.542497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,24.352953>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<3.729175,-1.535000,24.542497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.730144,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821094,-1.535000,20.726400>}
box{<0,0,-0.203200><0.090950,0.035000,0.203200> rotate<0,0.000000,0> translate<3.730144,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.734163,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810569,-1.535000,4.064000>}
box{<0,0,-0.203200><0.076406,0.035000,0.203200> rotate<0,0.000000,0> translate<3.734163,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.734166,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810575,-1.535000,6.096000>}
box{<0,0,-0.203200><0.076409,0.035000,0.203200> rotate<0,0.000000,0> translate<3.734166,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.738184,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,18.694400>}
box{<0,0,-0.203200><0.071816,0.035000,0.203200> rotate<0,0.000000,0> translate<3.738184,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.754281,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,24.384000>}
box{<0,0,-0.203200><0.055719,0.035000,0.203200> rotate<0,0.000000,0> translate<3.754281,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,4.222044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,5.029194>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,90.000000,0> translate<3.759197,-1.535000,5.029194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,4.470400>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,4.876800>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,5.130800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,5.937953>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,90.000000,0> translate<3.759197,-1.535000,5.937953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,5.283200>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,5.689600>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,15.017044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,15.824194>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,90.000000,0> translate<3.759197,-1.535000,15.824194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,15.036800>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,15.443200>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,15.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,16.732953>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,90.000000,0> translate<3.759197,-1.535000,16.732953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,16.256000>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,16.662400>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,18.827044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,19.634194>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,90.000000,0> translate<3.759197,-1.535000,19.634194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,19.100800>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,19.507200>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,19.735800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,20.542953>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,90.000000,0> translate<3.759197,-1.535000,20.542953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,19.913600>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,20.320000>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,22.637044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,23.444194>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,90.000000,0> translate<3.759197,-1.535000,23.444194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,22.758400>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,23.164800>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,23.545800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,24.352953>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,90.000000,0> translate<3.759197,-1.535000,24.352953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,23.571200>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759197,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,23.977600>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.759197,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.809997,-1.535000,9.145378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.809997,-1.535000,11.174619>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,90.000000,0> translate<3.809997,-1.535000,11.174619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.809997,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,9.347200>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.809997,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.809997,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,9.753600>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.809997,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.809997,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,10.160000>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.809997,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.809997,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,10.566400>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.809997,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.809997,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,10.972800>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.809997,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,4.065378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,3.598600>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<3.810000,-1.535000,4.065378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,6.094619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,4.065378>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.810000,-1.535000,4.065378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,6.094619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,6.561397>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<3.810000,-1.535000,6.094619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,9.145378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,8.678600>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<3.810000,-1.535000,9.145378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,11.174619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,9.145378>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.810000,-1.535000,9.145378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,11.174619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,11.641397>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<3.810000,-1.535000,11.174619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,14.860378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,14.393600>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<3.810000,-1.535000,14.860378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,16.889619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,14.860378>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.810000,-1.535000,14.860378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,16.889619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,17.356397>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<3.810000,-1.535000,16.889619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,18.670378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,18.203600>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<3.810000,-1.535000,18.670378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,20.699619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,18.670378>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.810000,-1.535000,18.670378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,20.699619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,21.166397>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<3.810000,-1.535000,20.699619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,22.480378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,22.013600>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<3.810000,-1.535000,22.480378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,24.509619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,22.480378>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.810000,-1.535000,22.480378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,24.509619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,24.976397>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<3.810000,-1.535000,24.509619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,3.598600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,3.241347>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<4.003347,-1.535000,3.598600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,6.561397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.350753,-1.535000,6.908800>}
box{<0,0,-0.203200><0.491304,0.035000,0.203200> rotate<0,-44.996772,0> translate<4.003347,-1.535000,6.561397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,8.678600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.350753,-1.535000,8.331197>}
box{<0,0,-0.203200><0.491304,0.035000,0.203200> rotate<0,44.996772,0> translate<4.003347,-1.535000,8.678600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,11.641397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,11.998650>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.003347,-1.535000,11.641397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,14.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,14.036347>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<4.003347,-1.535000,14.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,17.356397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,17.713650>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.003347,-1.535000,17.356397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,18.203600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,17.846347>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<4.003347,-1.535000,18.203600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,21.166397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,21.523650>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.003347,-1.535000,21.166397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,22.013600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,21.656347>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<4.003347,-1.535000,22.013600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.003347,-1.535000,24.976397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,25.333650>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.003347,-1.535000,24.976397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.217275,-1.535000,30.937200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.942722,-1.535000,30.937200>}
box{<0,0,-0.203200><1.725447,0.035000,0.203200> rotate<0,0.000000,0> translate<4.217275,-1.535000,30.937200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.217275,-1.535000,35.102797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.942722,-1.535000,35.102797>}
box{<0,0,-0.203200><1.725447,0.035000,0.203200> rotate<0,0.000000,0> translate<4.217275,-1.535000,35.102797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.238319,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,25.908000>}
box{<0,0,-0.203200><0.765475,0.035000,0.203200> rotate<0,0.000000,0> translate<4.238319,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.238319,-1.535000,29.971997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,29.971997>}
box{<0,0,-0.203200><0.765475,0.035000,0.203200> rotate<0,0.000000,0> translate<4.238319,-1.535000,29.971997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,3.241347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.827378,-1.535000,3.048000>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<4.360600,-1.535000,3.241347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,11.998650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.827378,-1.535000,12.191997>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<4.360600,-1.535000,11.998650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,14.036347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.827378,-1.535000,13.843000>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<4.360600,-1.535000,14.036347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,17.713650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.520781,-1.535000,17.780000>}
box{<0,0,-0.203200><0.173379,0.035000,0.203200> rotate<0,-22.498745,0> translate<4.360600,-1.535000,17.713650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,17.846347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.520781,-1.535000,17.780000>}
box{<0,0,-0.203200><0.173378,0.035000,0.203200> rotate<0,22.497791,0> translate<4.360600,-1.535000,17.846347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,21.523650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.520784,-1.535000,21.589997>}
box{<0,0,-0.203200><0.173381,0.035000,0.203200> rotate<0,-22.497396,0> translate<4.360600,-1.535000,21.523650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,21.656347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.520784,-1.535000,21.589997>}
box{<0,0,-0.203200><0.173382,0.035000,0.203200> rotate<0,22.498350,0> translate<4.360600,-1.535000,21.656347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.360600,-1.535000,25.333650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.827378,-1.535000,25.526997>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<4.360600,-1.535000,25.333650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.827378,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.332619,-1.535000,3.048000>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,0.000000,0> translate<4.827378,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.827378,-1.535000,12.191997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.332619,-1.535000,12.191997>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,0.000000,0> translate<4.827378,-1.535000,12.191997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.827378,-1.535000,13.843000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.332619,-1.535000,13.843000>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,0.000000,0> translate<4.827378,-1.535000,13.843000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.827378,-1.535000,25.526997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.332619,-1.535000,25.526997>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,0.000000,0> translate<4.827378,-1.535000,25.526997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003778,-1.535000,28.016200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003778,-1.535000,27.863794>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.003778,-1.535000,27.863794> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,27.863778>}
box{<0,0,-0.203200><1.955778,0.035000,0.203200> rotate<0,90.000000,0> translate<5.003794,-1.535000,27.863778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,26.009600>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,0.000000,0> translate<5.003794,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,26.416000>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,0.000000,0> translate<5.003794,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,26.822400>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,0.000000,0> translate<5.003794,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,27.228800>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,0.000000,0> translate<5.003794,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,27.635200>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,0.000000,0> translate<5.003794,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,27.863778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,27.863778>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,0.000000,0> translate<5.003794,-1.535000,27.863778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,28.016219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,29.971997>}
box{<0,0,-0.203200><1.955778,0.035000,0.203200> rotate<0,90.000000,0> translate<5.003794,-1.535000,29.971997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,28.016219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,28.016219>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,0.000000,0> translate<5.003794,-1.535000,28.016219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,28.041600>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,0.000000,0> translate<5.003794,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,28.448000>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,0.000000,0> translate<5.003794,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,28.854400>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,0.000000,0> translate<5.003794,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,29.260800>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,0.000000,0> translate<5.003794,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003794,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,29.667200>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,0.000000,0> translate<5.003794,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.921678,-1.535000,25.908000>}
box{<0,0,-0.203200><0.765478,0.035000,0.203200> rotate<0,0.000000,0> translate<5.156200,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,27.863778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,25.908000>}
box{<0,0,-0.203200><1.955778,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.156200,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,29.971997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,28.016219>}
box{<0,0,-0.203200><1.955778,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.156200,-1.535000,28.016219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156200,-1.535000,29.971997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.921678,-1.535000,29.971997>}
box{<0,0,-0.203200><0.765478,0.035000,0.203200> rotate<0,0.000000,0> translate<5.156200,-1.535000,29.971997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156219,-1.535000,27.863794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156219,-1.535000,28.016200>}
box{<0,0,-0.203200><0.152406,0.035000,0.203200> rotate<0,90.000000,0> translate<5.156219,-1.535000,28.016200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156219,-1.535000,27.863794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.111997,-1.535000,27.863794>}
box{<0,0,-0.203200><1.955778,0.035000,0.203200> rotate<0,0.000000,0> translate<5.156219,-1.535000,27.863794> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.156219,-1.535000,28.016200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.111997,-1.535000,28.016200>}
box{<0,0,-0.203200><1.955778,0.035000,0.203200> rotate<0,0.000000,0> translate<5.156219,-1.535000,28.016200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.332619,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,3.241347>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<5.332619,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.332619,-1.535000,12.191997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,11.998650>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<5.332619,-1.535000,12.191997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.332619,-1.535000,13.843000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,14.036347>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<5.332619,-1.535000,13.843000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.332619,-1.535000,25.526997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,25.333650>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<5.332619,-1.535000,25.526997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.639213,-1.535000,21.589997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,21.523650>}
box{<0,0,-0.203200><0.173381,0.035000,0.203200> rotate<0,22.497396,0> translate<5.639213,-1.535000,21.589997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.639213,-1.535000,21.589997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,21.656347>}
box{<0,0,-0.203200><0.173382,0.035000,0.203200> rotate<0,-22.498350,0> translate<5.639213,-1.535000,21.589997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.639216,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,17.713650>}
box{<0,0,-0.203200><0.173379,0.035000,0.203200> rotate<0,22.498745,0> translate<5.639216,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.639216,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,17.846347>}
box{<0,0,-0.203200><0.173378,0.035000,0.203200> rotate<0,-22.497791,0> translate<5.639216,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.761856,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,21.539200>}
box{<0,0,-0.203200><17.656944,0.035000,0.203200> rotate<0,0.000000,0> translate<5.761856,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,3.241347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,3.598600>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.799397,-1.535000,3.241347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,11.998650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,11.641397>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<5.799397,-1.535000,11.998650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,14.036347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,14.393600>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.799397,-1.535000,14.036347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,17.713650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,17.356397>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<5.799397,-1.535000,17.713650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,17.846347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,18.203600>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.799397,-1.535000,17.846347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,21.523650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,21.166397>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<5.799397,-1.535000,21.523650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,21.656347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,22.013600>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.799397,-1.535000,21.656347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.799397,-1.535000,25.333650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,24.976397>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<5.799397,-1.535000,25.333650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.809244,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,6.561397>}
box{<0,0,-0.203200><0.491304,0.035000,0.203200> rotate<0,44.996772,0> translate<5.809244,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.809244,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.651466,-1.535000,6.908800>}
box{<0,0,-0.203200><10.842222,0.035000,0.203200> rotate<0,0.000000,0> translate<5.809244,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.809244,-1.535000,8.331197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,8.678600>}
box{<0,0,-0.203200><0.491304,0.035000,0.203200> rotate<0,-44.996772,0> translate<5.809244,-1.535000,8.331197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.809244,-1.535000,8.331197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.215409,-1.535000,8.331197>}
box{<0,0,-0.203200><10.406166,0.035000,0.203200> rotate<0,0.000000,0> translate<5.809244,-1.535000,8.331197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.809250,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.891066,-1.535000,3.251200>}
box{<0,0,-0.203200><7.081816,0.035000,0.203200> rotate<0,0.000000,0> translate<5.809250,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.834650,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.875816,-1.535000,17.881600>}
box{<0,0,-0.203200><11.041166,0.035000,0.203200> rotate<0,0.000000,0> translate<5.834650,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.921678,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.111997,-1.535000,27.098319>}
box{<0,0,-0.203200><1.683365,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.921678,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.921678,-1.535000,29.971997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.111997,-1.535000,28.781678>}
box{<0,0,-0.203200><1.683365,0.035000,0.203200> rotate<0,44.997030,0> translate<5.921678,-1.535000,29.971997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.936247,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.174369,-1.535000,25.196800>}
box{<0,0,-0.203200><16.238122,0.035000,0.203200> rotate<0,0.000000,0> translate<5.936247,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.942722,-1.535000,30.937200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.162797,-1.535000,32.157275>}
box{<0,0,-0.203200><1.725447,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.942722,-1.535000,30.937200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.942722,-1.535000,35.102797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.162797,-1.535000,33.882722>}
box{<0,0,-0.203200><1.725447,0.035000,0.203200> rotate<0,44.997030,0> translate<5.942722,-1.535000,35.102797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.987050,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.772400,-1.535000,14.224000>}
box{<0,0,-0.203200><1.785350,0.035000,0.203200> rotate<0,0.000000,0> translate<5.987050,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.012447,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.418613,-1.535000,8.534400>}
box{<0,0,-0.203200><10.406166,0.035000,0.203200> rotate<0,0.000000,0> translate<6.012447,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.012447,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.655056,-1.535000,11.785600>}
box{<0,0,-0.203200><5.642609,0.035000,0.203200> rotate<0,0.000000,0> translate<6.012447,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.023278,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.148800,-1.535000,26.009600>}
box{<0,0,-0.203200><16.125522,0.035000,0.203200> rotate<0,0.000000,0> translate<6.023278,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.037847,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.202834,-1.535000,17.475200>}
box{<0,0,-0.203200><2.164987,0.035000,0.203200> rotate<0,0.000000,0> translate<6.037847,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.088650,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.651631,-1.535000,21.945600>}
box{<0,0,-0.203200><11.562981,0.035000,0.203200> rotate<0,0.000000,0> translate<6.088650,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.095119,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.817091,-1.535000,34.950400>}
box{<0,0,-0.203200><2.721972,0.035000,0.203200> rotate<0,0.000000,0> translate<6.095119,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,3.598600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,4.065378>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<6.156650,-1.535000,3.598600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,6.561397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,6.094619>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<6.156650,-1.535000,6.561397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,8.678600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,9.145378>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<6.156650,-1.535000,8.678600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,11.641397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,11.174619>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<6.156650,-1.535000,11.641397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,14.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,14.860378>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<6.156650,-1.535000,14.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,17.356397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.212653,-1.535000,17.221197>}
box{<0,0,-0.203200><0.146340,0.035000,0.203200> rotate<0,67.495020,0> translate<6.156650,-1.535000,17.356397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,18.203600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,18.670378>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<6.156650,-1.535000,18.203600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,21.166397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.212650,-1.535000,21.031197>}
box{<0,0,-0.203200><0.146339,0.035000,0.203200> rotate<0,67.496151,0> translate<6.156650,-1.535000,21.166397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,22.013600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,22.480378>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<6.156650,-1.535000,22.013600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156650,-1.535000,24.976397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.212650,-1.535000,24.841197>}
box{<0,0,-0.203200><0.146339,0.035000,0.203200> rotate<0,67.496151,0> translate<6.156650,-1.535000,24.976397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.170569,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.550038,-1.535000,21.132800>}
box{<0,0,-0.203200><11.379469,0.035000,0.203200> rotate<0,0.000000,0> translate<6.170569,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.181088,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.281466,-1.535000,3.657600>}
box{<0,0,-0.203200><6.100378,0.035000,0.203200> rotate<0,0.000000,0> translate<6.181088,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.181088,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.301641,-1.535000,6.502400>}
box{<0,0,-0.203200><12.120553,0.035000,0.203200> rotate<0,0.000000,0> translate<6.181088,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.191609,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.282216,-1.535000,18.288000>}
box{<0,0,-0.203200><11.090606,0.035000,0.203200> rotate<0,0.000000,0> translate<6.191609,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.212650,-1.535000,21.031197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.031466,-1.535000,21.031197>}
box{<0,0,-0.203200><2.818816,0.035000,0.203200> rotate<0,0.000000,0> translate<6.212650,-1.535000,21.031197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.212650,-1.535000,24.841197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.031466,-1.535000,24.841197>}
box{<0,0,-0.203200><2.818816,0.035000,0.203200> rotate<0,0.000000,0> translate<6.212650,-1.535000,24.841197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.212653,-1.535000,17.221197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.948831,-1.535000,17.221197>}
box{<0,0,-0.203200><1.736178,0.035000,0.203200> rotate<0,0.000000,0> translate<6.212653,-1.535000,17.221197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.226475,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.392866,-1.535000,29.667200>}
box{<0,0,-0.203200><4.166391,0.035000,0.203200> rotate<0,0.000000,0> translate<6.226475,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.254734,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.969878,-1.535000,14.630400>}
box{<0,0,-0.203200><1.715144,0.035000,0.203200> rotate<0,0.000000,0> translate<6.254734,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.265256,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.825012,-1.535000,8.940800>}
box{<0,0,-0.203200><10.559756,0.035000,0.203200> rotate<0,0.000000,0> translate<6.265256,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.265256,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.909987,-1.535000,11.379200>}
box{<0,0,-0.203200><4.644731,0.035000,0.203200> rotate<0,0.000000,0> translate<6.265256,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.296819,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.380631,-1.535000,22.352000>}
box{<0,0,-0.203200><2.083813,0.035000,0.203200> rotate<0,0.000000,0> translate<6.296819,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.298322,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.392869,-1.535000,31.292800>}
box{<0,0,-0.203200><4.094547,0.035000,0.203200> rotate<0,0.000000,0> translate<6.298322,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349425,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.671866,-1.535000,4.064000>}
box{<0,0,-0.203200><5.322441,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349425,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349425,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.826384,-1.535000,6.096000>}
box{<0,0,-0.203200><13.476959,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349425,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,4.065378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,4.368800>}
box{<0,0,-0.203200><0.303422,0.035000,0.203200> rotate<0,90.000000,0> translate<6.349997,-1.535000,4.368800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,4.368800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.214666,-1.535000,4.368800>}
box{<0,0,-0.203200><4.864669,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,4.368800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,5.791197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,6.094619>}
box{<0,0,-0.203200><0.303422,0.035000,0.203200> rotate<0,90.000000,0> translate<6.349997,-1.535000,6.094619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,5.791197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.359584,-1.535000,5.791197>}
box{<0,0,-0.203200><5.009588,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,5.791197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,9.145378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,9.448800>}
box{<0,0,-0.203200><0.303422,0.035000,0.203200> rotate<0,90.000000,0> translate<6.349997,-1.535000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.400431,-1.535000,9.347200>}
box{<0,0,-0.203200><8.050434,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.057575,-1.535000,9.448800>}
box{<0,0,-0.203200><3.707578,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,10.871197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,11.174619>}
box{<0,0,-0.203200><0.303422,0.035000,0.203200> rotate<0,90.000000,0> translate<6.349997,-1.535000,11.174619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,10.871197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.978647,-1.535000,10.871197>}
box{<0,0,-0.203200><3.628650,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,10.871197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.164922,-1.535000,10.972800>}
box{<0,0,-0.203200><3.814925,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,14.860378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,15.798800>}
box{<0,0,-0.203200><0.938422,0.035000,0.203200> rotate<0,90.000000,0> translate<6.349997,-1.535000,15.798800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.376278,-1.535000,15.036800>}
box{<0,0,-0.203200><2.026281,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.304431,-1.535000,15.443200>}
box{<0,0,-0.203200><1.954434,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,15.798800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.948831,-1.535000,15.798800>}
box{<0,0,-0.203200><1.598834,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,15.798800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,18.670378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,19.608800>}
box{<0,0,-0.203200><0.938422,0.035000,0.203200> rotate<0,90.000000,0> translate<6.349997,-1.535000,19.608800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.228231,-1.535000,18.694400>}
box{<0,0,-0.203200><1.878234,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.821831,-1.535000,19.100800>}
box{<0,0,-0.203200><1.471834,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,-1.535000,19.507200>}
box{<0,0,-0.203200><1.371603,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,19.608800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,-1.535000,19.608800>}
box{<0,0,-0.203200><1.371603,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,19.608800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,22.480378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,23.418800>}
box{<0,0,-0.203200><0.938422,0.035000,0.203200> rotate<0,90.000000,0> translate<6.349997,-1.535000,23.418800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.974231,-1.535000,22.758400>}
box{<0,0,-0.203200><1.624234,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,-1.535000,23.164800>}
box{<0,0,-0.203200><1.371603,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.349997,-1.535000,23.418800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,-1.535000,23.418800>}
box{<0,0,-0.203200><1.371603,0.035000,0.203200> rotate<0,0.000000,0> translate<6.349997,-1.535000,23.418800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.429678,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.148800,-1.535000,26.416000>}
box{<0,0,-0.203200><15.719122,0.035000,0.203200> rotate<0,0.000000,0> translate<6.429678,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.501519,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.192687,-1.535000,34.544000>}
box{<0,0,-0.203200><1.691169,0.035000,0.203200> rotate<0,0.000000,0> translate<6.501519,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.632875,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.955178,-1.535000,29.260800>}
box{<0,0,-0.203200><4.322303,0.035000,0.203200> rotate<0,0.000000,0> translate<6.632875,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.704722,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.955188,-1.535000,31.699200>}
box{<0,0,-0.203200><4.250466,0.035000,0.203200> rotate<0,0.000000,0> translate<6.704722,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.836078,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.769509,-1.535000,26.822400>}
box{<0,0,-0.203200><3.933431,0.035000,0.203200> rotate<0,0.000000,0> translate<6.836078,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.907919,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.950284,-1.535000,34.137600>}
box{<0,0,-0.203200><1.042366,0.035000,0.203200> rotate<0,0.000000,0> translate<6.907919,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.039275,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.566313,-1.535000,28.854400>}
box{<0,0,-0.203200><3.527038,0.035000,0.203200> rotate<0,0.000000,0> translate<7.039275,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.111122,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.797659,-1.535000,32.105600>}
box{<0,0,-0.203200><10.686538,0.035000,0.203200> rotate<0,0.000000,0> translate<7.111122,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.111997,-1.535000,27.098319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.111997,-1.535000,27.863794>}
box{<0,0,-0.203200><0.765475,0.035000,0.203200> rotate<0,90.000000,0> translate<7.111997,-1.535000,27.863794> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.111997,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.363109,-1.535000,27.228800>}
box{<0,0,-0.203200><3.251113,0.035000,0.203200> rotate<0,0.000000,0> translate<7.111997,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.111997,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.172700,-1.535000,27.635200>}
box{<0,0,-0.203200><3.060703,0.035000,0.203200> rotate<0,0.000000,0> translate<7.111997,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.111997,-1.535000,28.016200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.111997,-1.535000,28.781678>}
box{<0,0,-0.203200><0.765478,0.035000,0.203200> rotate<0,90.000000,0> translate<7.111997,-1.535000,28.781678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.111997,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.172700,-1.535000,28.041600>}
box{<0,0,-0.203200><3.060703,0.035000,0.203200> rotate<0,0.000000,0> translate<7.111997,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.111997,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.172700,-1.535000,28.448000>}
box{<0,0,-0.203200><3.060703,0.035000,0.203200> rotate<0,0.000000,0> translate<7.111997,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.162797,-1.535000,32.157275>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.162797,-1.535000,32.308800>}
box{<0,0,-0.203200><0.151525,0.035000,0.203200> rotate<0,90.000000,0> translate<7.162797,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.162797,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.864753,-1.535000,32.308800>}
box{<0,0,-0.203200><1.701956,0.035000,0.203200> rotate<0,0.000000,0> translate<7.162797,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.162797,-1.535000,33.731197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.162797,-1.535000,33.882722>}
box{<0,0,-0.203200><0.151525,0.035000,0.203200> rotate<0,90.000000,0> translate<7.162797,-1.535000,33.882722> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.162797,-1.535000,33.731197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.861300,-1.535000,33.731197>}
box{<0,0,-0.203200><0.698503,0.035000,0.203200> rotate<0,0.000000,0> translate<7.162797,-1.535000,33.731197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.162797,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.861300,-1.535000,33.731200>}
box{<0,0,-0.203200><0.698503,0.035000,0.203200> rotate<0,0.000000,0> translate<7.162797,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,-1.535000,19.201031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.406031,-1.535000,18.516600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<7.721600,-1.535000,19.201031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,-1.535000,19.608800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,-1.535000,19.201031>}
box{<0,0,-0.203200><0.407769,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.721600,-1.535000,19.201031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,-1.535000,23.011031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.406031,-1.535000,22.326600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<7.721600,-1.535000,23.011031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,-1.535000,23.418800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,-1.535000,23.011031>}
box{<0,0,-0.203200><0.407769,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.721600,-1.535000,23.011031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.772397,-1.535000,13.970013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.772400,-1.535000,14.432922>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,-89.993674,0> translate<7.772397,-1.535000,13.970013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.772397,-1.535000,13.970013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889966,-1.535000,13.970013>}
box{<0,0,-0.203200><1.117569,0.035000,0.203200> rotate<0,0.000000,0> translate<7.772397,-1.535000,13.970013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.772400,-1.535000,13.507075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.427075,-1.535000,12.852400>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,44.997030,0> translate<7.772400,-1.535000,13.507075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.772400,-1.535000,13.969981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.772400,-1.535000,13.507075>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.772400,-1.535000,13.507075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.772400,-1.535000,13.969981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889966,-1.535000,13.969981>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,0.000000,0> translate<7.772400,-1.535000,13.969981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.772400,-1.535000,14.432922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.427075,-1.535000,15.087597>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.772400,-1.535000,14.432922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.861300,-1.535000,33.922775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.861300,-1.535000,33.731197>}
box{<0,0,-0.203200><0.191578,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.861300,-1.535000,33.731197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.861300,-1.535000,33.922775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.066247,-1.535000,34.417559>}
box{<0,0,-0.203200><0.535551,0.035000,0.203200> rotate<0,-67.495498,0> translate<7.861300,-1.535000,33.922775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.948831,-1.535000,15.798800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.406031,-1.535000,15.341600>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,44.997030,0> translate<7.948831,-1.535000,15.798800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.948831,-1.535000,17.221197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.406031,-1.535000,17.678397>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.948831,-1.535000,17.221197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.066247,-1.535000,34.417559>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.444937,-1.535000,34.796250>}
box{<0,0,-0.203200><0.535549,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.066247,-1.535000,34.417559> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.406031,-1.535000,15.341600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.373966,-1.535000,15.341600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<8.406031,-1.535000,15.341600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.406031,-1.535000,17.678397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.373966,-1.535000,17.678397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<8.406031,-1.535000,17.678397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.406031,-1.535000,18.516600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.373966,-1.535000,18.516600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<8.406031,-1.535000,18.516600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.406031,-1.535000,22.326600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.373966,-1.535000,22.326600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<8.406031,-1.535000,22.326600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.427075,-1.535000,12.852400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,12.852400>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,0.000000,0> translate<8.427075,-1.535000,12.852400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.427075,-1.535000,15.087597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,15.087597>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,0.000000,0> translate<8.427075,-1.535000,15.087597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.444937,-1.535000,34.796250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.939722,-1.535000,35.001197>}
box{<0,0,-0.203200><0.535551,0.035000,0.203200> rotate<0,-22.498562,0> translate<8.444937,-1.535000,34.796250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.864753,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.980694,-1.535000,32.300559>}
box{<0,0,-0.203200><0.116233,0.035000,0.203200> rotate<0,4.065264,0> translate<8.864753,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889966,-1.535000,13.970013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889966,-1.535000,13.969981>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.889966,-1.535000,13.969981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,12.852400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,13.969966>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,90.000000,0> translate<8.889981,-1.535000,13.969966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,13.004800>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<8.889981,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,13.411200>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<8.889981,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,13.817600>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<8.889981,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,13.969966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,13.969966>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<8.889981,-1.535000,13.969966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,13.970031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,15.087597>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,90.000000,0> translate<8.889981,-1.535000,15.087597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,13.970031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,13.970031>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<8.889981,-1.535000,13.970031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,14.224000>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<8.889981,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,14.630400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<8.889981,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.889981,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,15.036800>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<8.889981,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,12.852400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.352922,-1.535000,12.852400>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,0.000000,0> translate<8.890013,-1.535000,12.852400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,13.969966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,12.852400>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.890013,-1.535000,12.852400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,15.087597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,13.970031>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.890013,-1.535000,13.970031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890013,-1.535000,15.087597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.352922,-1.535000,15.087597>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,0.000000,0> translate<8.890013,-1.535000,15.087597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890031,-1.535000,13.969981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890031,-1.535000,13.970013>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,90.000000,0> translate<8.890031,-1.535000,13.970013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890031,-1.535000,13.969981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.007597,-1.535000,13.969981>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,0.000000,0> translate<8.890031,-1.535000,13.969981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890031,-1.535000,13.970013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.007597,-1.535000,13.970013>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,0.000000,0> translate<8.890031,-1.535000,13.970013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.939722,-1.535000,35.001197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.475275,-1.535000,35.001197>}
box{<0,0,-0.203200><0.535553,0.035000,0.203200> rotate<0,0.000000,0> translate<8.939722,-1.535000,35.001197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.980694,-1.535000,32.300559>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.005413,-1.535000,32.308800>}
box{<0,0,-0.203200><0.026056,0.035000,0.203200> rotate<0,-18.435905,0> translate<8.980694,-1.535000,32.300559> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.005413,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.475275,-1.535000,32.308800>}
box{<0,0,-0.203200><0.469862,0.035000,0.203200> rotate<0,0.000000,0> translate<9.005413,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.031466,-1.535000,21.031197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.292859,-1.535000,20.922925>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,22.498335,0> translate<9.031466,-1.535000,21.031197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.031466,-1.535000,24.841197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.292859,-1.535000,24.732925>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,22.498335,0> translate<9.031466,-1.535000,24.841197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.154103,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.473244,-1.535000,24.790400>}
box{<0,0,-0.203200><13.319141,0.035000,0.203200> rotate<0,0.000000,0> translate<9.154103,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.292859,-1.535000,20.922925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.362388,-1.535000,20.853397>}
box{<0,0,-0.203200><0.098328,0.035000,0.203200> rotate<0,44.997030,0> translate<9.292859,-1.535000,20.922925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.292859,-1.535000,24.732925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.362388,-1.535000,24.663397>}
box{<0,0,-0.203200><0.098328,0.035000,0.203200> rotate<0,44.997030,0> translate<9.292859,-1.535000,24.732925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.352922,-1.535000,12.852400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.007597,-1.535000,13.507075>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.352922,-1.535000,12.852400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.352922,-1.535000,15.087597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.007597,-1.535000,14.432922>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,44.997030,0> translate<9.352922,-1.535000,15.087597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.362388,-1.535000,20.853397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.373966,-1.535000,20.853397>}
box{<0,0,-0.203200><0.011578,0.035000,0.203200> rotate<0,0.000000,0> translate<9.362388,-1.535000,20.853397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.362388,-1.535000,24.663397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.373966,-1.535000,24.663397>}
box{<0,0,-0.203200><0.011578,0.035000,0.203200> rotate<0,0.000000,0> translate<9.362388,-1.535000,24.663397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.373966,-1.535000,15.341600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,16.026031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.373966,-1.535000,15.341600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.373966,-1.535000,17.678397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,16.993966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<9.373966,-1.535000,17.678397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.373966,-1.535000,18.516600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,19.201031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.373966,-1.535000,18.516600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.373966,-1.535000,20.853397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,20.168966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<9.373966,-1.535000,20.853397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.373966,-1.535000,22.326600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,23.011031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.373966,-1.535000,22.326600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.373966,-1.535000,24.663397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,23.978966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<9.373966,-1.535000,24.663397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.399366,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.000631,-1.535000,22.352000>}
box{<0,0,-0.203200><6.601266,0.035000,0.203200> rotate<0,0.000000,0> translate<9.399366,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.403719,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.924434,-1.535000,15.036800>}
box{<0,0,-0.203200><6.520716,0.035000,0.203200> rotate<0,0.000000,0> translate<9.403719,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.475275,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.970059,-1.535000,32.513747>}
box{<0,0,-0.203200><0.535551,0.035000,0.203200> rotate<0,-22.498562,0> translate<9.475275,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.475275,-1.535000,35.001197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.970059,-1.535000,34.796250>}
box{<0,0,-0.203200><0.535551,0.035000,0.203200> rotate<0,22.498562,0> translate<9.475275,-1.535000,35.001197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.475566,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.924431,-1.535000,15.443200>}
box{<0,0,-0.203200><6.448866,0.035000,0.203200> rotate<0,0.000000,0> translate<9.475566,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.500962,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.899034,-1.535000,20.726400>}
box{<0,0,-0.203200><6.398072,0.035000,0.203200> rotate<0,0.000000,0> translate<9.500962,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.505322,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.780072,-1.535000,13.004800>}
box{<0,0,-0.203200><4.274750,0.035000,0.203200> rotate<0,0.000000,0> translate<9.505322,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.551766,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.848231,-1.535000,18.694400>}
box{<0,0,-0.203200><6.296466,0.035000,0.203200> rotate<0,0.000000,0> translate<9.551766,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.577163,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.822834,-1.535000,17.475200>}
box{<0,0,-0.203200><6.245672,0.035000,0.203200> rotate<0,0.000000,0> translate<9.577163,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.597909,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.977091,-1.535000,34.950400>}
box{<0,0,-0.203200><9.379181,0.035000,0.203200> rotate<0,0.000000,0> translate<9.597909,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.653363,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.746634,-1.535000,24.384000>}
box{<0,0,-0.203200><6.093272,0.035000,0.203200> rotate<0,0.000000,0> translate<9.653363,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.805766,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.594231,-1.535000,22.758400>}
box{<0,0,-0.203200><5.788466,0.035000,0.203200> rotate<0,0.000000,0> translate<9.805766,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.810119,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.518034,-1.535000,14.630400>}
box{<0,0,-0.203200><5.707916,0.035000,0.203200> rotate<0,0.000000,0> translate<9.810119,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.881966,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.518031,-1.535000,15.849600>}
box{<0,0,-0.203200><5.636066,0.035000,0.203200> rotate<0,0.000000,0> translate<9.881966,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.907362,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.492634,-1.535000,20.320000>}
box{<0,0,-0.203200><5.585272,0.035000,0.203200> rotate<0,0.000000,0> translate<9.907362,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.911722,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.389672,-1.535000,13.411200>}
box{<0,0,-0.203200><4.477950,0.035000,0.203200> rotate<0,0.000000,0> translate<9.911722,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.958166,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.441831,-1.535000,19.100800>}
box{<0,0,-0.203200><5.483666,0.035000,0.203200> rotate<0,0.000000,0> translate<9.958166,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.965841,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.000859,-1.535000,32.512000>}
box{<0,0,-0.203200><8.035019,0.035000,0.203200> rotate<0,0.000000,0> translate<9.965841,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.970059,-1.535000,32.513747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.348750,-1.535000,32.892437>}
box{<0,0,-0.203200><0.535549,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.970059,-1.535000,32.513747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.970059,-1.535000,34.796250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.348750,-1.535000,34.417559>}
box{<0,0,-0.203200><0.535549,0.035000,0.203200> rotate<0,44.997030,0> translate<9.970059,-1.535000,34.796250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.978647,-1.535000,10.871197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.284238,-1.535000,12.674244>}
box{<0,0,-0.203200><3.765356,0.035000,0.203200> rotate<0,-28.608537,0> translate<9.978647,-1.535000,10.871197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.983562,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.416434,-1.535000,17.068800>}
box{<0,0,-0.203200><5.432872,0.035000,0.203200> rotate<0,0.000000,0> translate<9.983562,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.007597,-1.535000,13.507075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.007597,-1.535000,13.969981>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,90.000000,0> translate<10.007597,-1.535000,13.969981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.007597,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.999272,-1.535000,13.817600>}
box{<0,0,-0.203200><4.991675,0.035000,0.203200> rotate<0,0.000000,0> translate<10.007597,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.007597,-1.535000,13.970013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.007597,-1.535000,14.432922>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,90.000000,0> translate<10.007597,-1.535000,14.432922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.007597,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,14.224000>}
box{<0,0,-0.203200><5.334003,0.035000,0.203200> rotate<0,0.000000,0> translate<10.007597,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.057575,-1.535000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.095038,-1.535000,9.437781>}
box{<0,0,-0.203200><0.039049,0.035000,0.203200> rotate<0,16.388976,0> translate<10.057575,-1.535000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,16.026031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,16.993966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<10.058397,-1.535000,16.993966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,16.256000>}
box{<0,0,-0.203200><5.283203,0.035000,0.203200> rotate<0,0.000000,0> translate<10.058397,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,16.662400>}
box{<0,0,-0.203200><5.283203,0.035000,0.203200> rotate<0,0.000000,0> translate<10.058397,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,19.201031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,20.168966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<10.058397,-1.535000,20.168966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,19.507200>}
box{<0,0,-0.203200><5.283203,0.035000,0.203200> rotate<0,0.000000,0> translate<10.058397,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,19.913600>}
box{<0,0,-0.203200><5.283203,0.035000,0.203200> rotate<0,0.000000,0> translate<10.058397,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,23.011031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,23.978966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<10.058397,-1.535000,23.978966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,23.164800>}
box{<0,0,-0.203200><5.283203,0.035000,0.203200> rotate<0,0.000000,0> translate<10.058397,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,23.571200>}
box{<0,0,-0.203200><5.283203,0.035000,0.203200> rotate<0,0.000000,0> translate<10.058397,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058397,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,23.977600>}
box{<0,0,-0.203200><5.283203,0.035000,0.203200> rotate<0,0.000000,0> translate<10.058397,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.095038,-1.535000,9.437781>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.197959,-1.535000,9.448800>}
box{<0,0,-0.203200><0.103510,0.035000,0.203200> rotate<0,-6.110370,0> translate<10.095038,-1.535000,9.437781> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.121900,-1.535000,30.219800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.321047,-1.535000,29.739019>}
box{<0,0,-0.203200><0.520394,0.035000,0.203200> rotate<0,67.495468,0> translate<10.121900,-1.535000,30.219800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.121900,-1.535000,30.740197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.121900,-1.535000,30.219800>}
box{<0,0,-0.203200><0.520397,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.121900,-1.535000,30.219800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.121900,-1.535000,30.740197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.321047,-1.535000,31.220978>}
box{<0,0,-0.203200><0.520394,0.035000,0.203200> rotate<0,-67.495468,0> translate<10.121900,-1.535000,30.740197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.172700,-1.535000,27.419209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.909209,-1.535000,26.682700>}
box{<0,0,-0.203200><1.041582,0.035000,0.203200> rotate<0,44.997030,0> translate<10.172700,-1.535000,27.419209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.172700,-1.535000,27.939981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.172700,-1.535000,27.419209>}
box{<0,0,-0.203200><0.520772,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.172700,-1.535000,27.419209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.172700,-1.535000,27.939981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.429966,-1.535000,27.939981>}
box{<0,0,-0.203200><1.257266,0.035000,0.203200> rotate<0,0.000000,0> translate<10.172700,-1.535000,27.939981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.172700,-1.535000,27.940013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.429966,-1.535000,27.940013>}
box{<0,0,-0.203200><1.257266,0.035000,0.203200> rotate<0,0.000000,0> translate<10.172700,-1.535000,27.940013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.172700,-1.535000,28.460788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.172700,-1.535000,27.940013>}
box{<0,0,-0.203200><0.520775,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.172700,-1.535000,27.940013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.172700,-1.535000,28.460788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.909209,-1.535000,29.197297>}
box{<0,0,-0.203200><1.041582,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.172700,-1.535000,28.460788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.197959,-1.535000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.301466,-1.535000,9.448800>}
box{<0,0,-0.203200><0.103506,0.035000,0.203200> rotate<0,0.000000,0> translate<10.197959,-1.535000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.222309,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.352688,-1.535000,34.544000>}
box{<0,0,-0.203200><8.130378,0.035000,0.203200> rotate<0,0.000000,0> translate<10.222309,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.301466,-1.535000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.337541,-1.535000,9.463744>}
box{<0,0,-0.203200><0.039048,0.035000,0.203200> rotate<0,-22.499865,0> translate<10.301466,-1.535000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.321047,-1.535000,29.739019>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.689019,-1.535000,29.371047>}
box{<0,0,-0.203200><0.520391,0.035000,0.203200> rotate<0,44.997030,0> translate<10.321047,-1.535000,29.739019> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.321047,-1.535000,31.220978>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.689019,-1.535000,31.588950>}
box{<0,0,-0.203200><0.520391,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.321047,-1.535000,31.220978> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.337541,-1.535000,9.463744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.376366,-1.535000,9.467900>}
box{<0,0,-0.203200><0.039047,0.035000,0.203200> rotate<0,-6.109890,0> translate<10.337541,-1.535000,9.463744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.348750,-1.535000,32.892437>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.553697,-1.535000,33.387222>}
box{<0,0,-0.203200><0.535551,0.035000,0.203200> rotate<0,-67.495498,0> translate<10.348750,-1.535000,32.892437> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.348750,-1.535000,34.417559>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.553697,-1.535000,33.922775>}
box{<0,0,-0.203200><0.535551,0.035000,0.203200> rotate<0,67.495498,0> translate<10.348750,-1.535000,34.417559> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.359503,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.204059,-1.535000,32.918400>}
box{<0,0,-0.203200><7.844556,0.035000,0.203200> rotate<0,0.000000,0> translate<10.359503,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.376366,-1.535000,9.467900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.467219,-1.535000,9.517459>}
box{<0,0,-0.203200><0.103491,0.035000,0.203200> rotate<0,-28.610090,0> translate<10.376366,-1.535000,9.467900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.464716,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.110284,-1.535000,34.137600>}
box{<0,0,-0.203200><7.645569,0.035000,0.203200> rotate<0,0.000000,0> translate<10.464716,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.467219,-1.535000,9.517459>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.562859,-1.535000,9.557072>}
box{<0,0,-0.203200><0.103519,0.035000,0.203200> rotate<0,-22.496908,0> translate<10.467219,-1.535000,9.517459> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.527841,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.047153,-1.535000,33.324800>}
box{<0,0,-0.203200><7.519313,0.035000,0.203200> rotate<0,0.000000,0> translate<10.527841,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.553697,-1.535000,33.387222>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.553697,-1.535000,33.922775>}
box{<0,0,-0.203200><0.535553,0.035000,0.203200> rotate<0,90.000000,0> translate<10.553697,-1.535000,33.922775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.553697,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.021300,-1.535000,33.731200>}
box{<0,0,-0.203200><7.467603,0.035000,0.203200> rotate<0,0.000000,0> translate<10.553697,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.562859,-1.535000,9.557072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.590472,-1.535000,9.584688>}
box{<0,0,-0.203200><0.039052,0.035000,0.203200> rotate<0,-45.000272,0> translate<10.562859,-1.535000,9.557072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.590472,-1.535000,9.584688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.897406,-1.535000,11.388469>}
box{<0,0,-0.203200><3.766888,0.035000,0.203200> rotate<0,-28.608556,0> translate<10.590472,-1.535000,9.584688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.689019,-1.535000,29.371047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.108491,-1.535000,29.197297>}
box{<0,0,-0.203200><0.454033,0.035000,0.203200> rotate<0,22.498406,0> translate<10.689019,-1.535000,29.371047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.689019,-1.535000,31.588950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.169800,-1.535000,31.788097>}
box{<0,0,-0.203200><0.520394,0.035000,0.203200> rotate<0,-22.498592,0> translate<10.689019,-1.535000,31.588950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.900144,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.071600,-1.535000,9.753600>}
box{<0,0,-0.203200><3.171456,0.035000,0.203200> rotate<0,0.000000,0> translate<10.900144,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.909209,-1.535000,26.682700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.429981,-1.535000,26.682700>}
box{<0,0,-0.203200><0.520772,0.035000,0.203200> rotate<0,0.000000,0> translate<10.909209,-1.535000,26.682700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.909209,-1.535000,29.197297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.108491,-1.535000,29.197297>}
box{<0,0,-0.203200><0.199281,0.035000,0.203200> rotate<0,0.000000,0> translate<10.909209,-1.535000,29.197297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.169800,-1.535000,31.788097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.690197,-1.535000,31.788097>}
box{<0,0,-0.203200><0.520397,0.035000,0.203200> rotate<0,0.000000,0> translate<11.169800,-1.535000,31.788097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.214666,-1.535000,4.368800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.071600,-1.535000,2.464178>}
box{<0,0,-0.203200><3.433607,0.035000,0.203200> rotate<0,33.687830,0> translate<11.214666,-1.535000,4.368800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.359584,-1.535000,5.791197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.429238,-1.535000,5.805128>}
box{<0,0,-0.203200><0.071033,0.035000,0.203200> rotate<0,-11.309680,0> translate<11.359584,-1.535000,5.791197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.429238,-1.535000,5.805128>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.499663,-1.535000,5.791197>}
box{<0,0,-0.203200><0.071790,0.035000,0.203200> rotate<0,11.188868,0> translate<11.429238,-1.535000,5.805128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.429966,-1.535000,27.940013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.429966,-1.535000,27.939981>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.429966,-1.535000,27.939981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.429981,-1.535000,26.682700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.429981,-1.535000,27.939966>}
box{<0,0,-0.203200><1.257266,0.035000,0.203200> rotate<0,90.000000,0> translate<11.429981,-1.535000,27.939966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.429981,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430013,-1.535000,26.822400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<11.429981,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.429981,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430013,-1.535000,27.228800>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<11.429981,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.429981,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430013,-1.535000,27.635200>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<11.429981,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.429981,-1.535000,27.939966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430013,-1.535000,27.939966>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<11.429981,-1.535000,27.939966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430013,-1.535000,26.682700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.950788,-1.535000,26.682700>}
box{<0,0,-0.203200><0.520775,0.035000,0.203200> rotate<0,0.000000,0> translate<11.430013,-1.535000,26.682700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430013,-1.535000,27.939966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430013,-1.535000,26.682700>}
box{<0,0,-0.203200><1.257266,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.430013,-1.535000,26.682700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430031,-1.535000,27.939981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430031,-1.535000,27.940013>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,90.000000,0> translate<11.430031,-1.535000,27.940013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430031,-1.535000,27.939981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.687294,-1.535000,27.939981>}
box{<0,0,-0.203200><1.257262,0.035000,0.203200> rotate<0,0.000000,0> translate<11.430031,-1.535000,27.939981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430031,-1.535000,27.940013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.687297,-1.535000,27.940013>}
box{<0,0,-0.203200><1.257266,0.035000,0.203200> rotate<0,0.000000,0> translate<11.430031,-1.535000,27.940013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.499663,-1.535000,5.791197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.571466,-1.535000,5.791197>}
box{<0,0,-0.203200><0.071803,0.035000,0.203200> rotate<0,0.000000,0> translate<11.499663,-1.535000,5.791197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.571466,-1.535000,5.791197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.637106,-1.535000,5.764006>}
box{<0,0,-0.203200><0.071049,0.035000,0.203200> rotate<0,22.499549,0> translate<11.571466,-1.535000,5.791197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.637106,-1.535000,5.764006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.706794,-1.535000,5.750222>}
box{<0,0,-0.203200><0.071038,0.035000,0.203200> rotate<0,11.188089,0> translate<11.637106,-1.535000,5.764006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.645209,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.071600,-1.535000,10.160000>}
box{<0,0,-0.203200><2.426391,0.035000,0.203200> rotate<0,0.000000,0> translate<11.645209,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.690197,-1.535000,31.788097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.170978,-1.535000,31.588950>}
box{<0,0,-0.203200><0.520394,0.035000,0.203200> rotate<0,22.498592,0> translate<11.690197,-1.535000,31.788097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.706794,-1.535000,5.750222>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.766522,-1.535000,5.710400>}
box{<0,0,-0.203200><0.071786,0.035000,0.203200> rotate<0,33.689919,0> translate<11.706794,-1.535000,5.750222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.751506,-1.535000,29.197297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.950788,-1.535000,29.197297>}
box{<0,0,-0.203200><0.199281,0.035000,0.203200> rotate<0,0.000000,0> translate<11.751506,-1.535000,29.197297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.751506,-1.535000,29.197297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.170978,-1.535000,29.371047>}
box{<0,0,-0.203200><0.454033,0.035000,0.203200> rotate<0,-22.498406,0> translate<11.751506,-1.535000,29.197297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.766522,-1.535000,5.710400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.832859,-1.535000,5.682925>}
box{<0,0,-0.203200><0.071802,0.035000,0.203200> rotate<0,22.496383,0> translate<11.766522,-1.535000,5.710400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.816744,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.078394,-1.535000,5.689600>}
box{<0,0,-0.203200><7.261650,0.035000,0.203200> rotate<0,0.000000,0> translate<11.816744,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.832859,-1.535000,5.682925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.883100,-1.535000,5.632684>}
box{<0,0,-0.203200><0.071051,0.035000,0.203200> rotate<0,44.997030,0> translate<11.832859,-1.535000,5.682925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.883100,-1.535000,5.632684>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.769531,-1.535000,3.708397>}
box{<0,0,-0.203200><3.469059,0.035000,0.203200> rotate<0,33.687844,0> translate<11.883100,-1.535000,5.632684> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.904813,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.594459,-1.535000,31.699200>}
box{<0,0,-0.203200><5.689647,0.035000,0.203200> rotate<0,0.000000,0> translate<11.904813,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.904816,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.757400,-1.535000,29.260800>}
box{<0,0,-0.203200><2.852584,0.035000,0.203200> rotate<0,0.000000,0> translate<11.904816,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.950788,-1.535000,26.682700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.687297,-1.535000,27.419209>}
box{<0,0,-0.203200><1.041582,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.950788,-1.535000,26.682700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.950788,-1.535000,29.197297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.687297,-1.535000,28.460788>}
box{<0,0,-0.203200><1.041582,0.035000,0.203200> rotate<0,44.997030,0> translate<11.950788,-1.535000,29.197297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.090488,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.245231,-1.535000,26.822400>}
box{<0,0,-0.203200><5.154744,0.035000,0.203200> rotate<0,0.000000,0> translate<12.090488,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.170978,-1.535000,29.371047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.538950,-1.535000,29.739019>}
box{<0,0,-0.203200><0.520391,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.170978,-1.535000,29.371047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.170978,-1.535000,31.588950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.538950,-1.535000,31.220978>}
box{<0,0,-0.203200><0.520391,0.035000,0.203200> rotate<0,44.997030,0> translate<12.170978,-1.535000,31.588950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.293684,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.757400,-1.535000,28.854400>}
box{<0,0,-0.203200><2.463716,0.035000,0.203200> rotate<0,0.000000,0> translate<12.293684,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.390278,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.071600,-1.535000,10.566400>}
box{<0,0,-0.203200><1.681322,0.035000,0.203200> rotate<0,0.000000,0> translate<12.390278,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.407328,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.848478,-1.535000,5.283200>}
box{<0,0,-0.203200><6.441150,0.035000,0.203200> rotate<0,0.000000,0> translate<12.407328,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.467128,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.940434,-1.535000,31.292800>}
box{<0,0,-0.203200><4.473306,0.035000,0.203200> rotate<0,0.000000,0> translate<12.467128,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.467131,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.757400,-1.535000,29.667200>}
box{<0,0,-0.203200><2.290269,0.035000,0.203200> rotate<0,0.000000,0> translate<12.467131,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.496888,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.838831,-1.535000,27.228800>}
box{<0,0,-0.203200><4.341944,0.035000,0.203200> rotate<0,0.000000,0> translate<12.496888,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.538950,-1.535000,29.739019>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.551284,-1.535000,29.768800>}
box{<0,0,-0.203200><0.032234,0.035000,0.203200> rotate<0,-67.497881,0> translate<12.538950,-1.535000,29.739019> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.538950,-1.535000,31.220978>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.551284,-1.535000,31.191197>}
box{<0,0,-0.203200><0.032234,0.035000,0.203200> rotate<0,67.497881,0> translate<12.538950,-1.535000,31.220978> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.551284,-1.535000,29.768800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.853281,-1.535000,29.768800>}
box{<0,0,-0.203200><2.301997,0.035000,0.203200> rotate<0,0.000000,0> translate<12.551284,-1.535000,29.768800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.551284,-1.535000,31.191197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.838831,-1.535000,31.191197>}
box{<0,0,-0.203200><4.287547,0.035000,0.203200> rotate<0,0.000000,0> translate<12.551284,-1.535000,31.191197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.687294,-1.535000,27.939981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.687297,-1.535000,27.419209>}
box{<0,0,-0.203200><0.520772,0.035000,0.203200> rotate<0,89.993717,0> translate<12.687294,-1.535000,27.939981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.687297,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,-1.535000,27.635200>}
box{<0,0,-0.203200><3.924303,0.035000,0.203200> rotate<0,0.000000,0> translate<12.687297,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.687297,-1.535000,27.940013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.687297,-1.535000,28.460788>}
box{<0,0,-0.203200><0.520775,0.035000,0.203200> rotate<0,90.000000,0> translate<12.687297,-1.535000,28.460788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.687297,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,-1.535000,28.041600>}
box{<0,0,-0.203200><3.924303,0.035000,0.203200> rotate<0,0.000000,0> translate<12.687297,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.687297,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.056475,-1.535000,28.448000>}
box{<0,0,-0.203200><2.369178,0.035000,0.203200> rotate<0,0.000000,0> translate<12.687297,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.016928,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.783300,-1.535000,4.876800>}
box{<0,0,-0.203200><5.766372,0.035000,0.203200> rotate<0,0.000000,0> translate<13.016928,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.135344,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.400434,-1.535000,10.972800>}
box{<0,0,-0.203200><1.265091,0.035000,0.203200> rotate<0,0.000000,0> translate<13.135344,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.284238,-1.535000,12.674244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,14.045819>}
box{<0,0,-0.203200><2.472642,0.035000,0.203200> rotate<0,-33.687844,0> translate<13.284238,-1.535000,12.674244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.626528,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.783300,-1.535000,4.470400>}
box{<0,0,-0.203200><5.156772,0.035000,0.203200> rotate<0,0.000000,0> translate<13.626528,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.880413,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,11.379200>}
box{<0,0,-0.203200><9.538388,0.035000,0.203200> rotate<0,0.000000,0> translate<13.880413,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.897406,-1.535000,11.388469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.929294,-1.535000,11.394775>}
box{<0,0,-0.203200><0.032505,0.035000,0.203200> rotate<0,-11.186043,0> translate<13.897406,-1.535000,11.388469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.929294,-1.535000,11.394775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020741,-1.535000,11.455744>}
box{<0,0,-0.203200><0.109908,0.035000,0.203200> rotate<0,-33.689651,0> translate<13.929294,-1.535000,11.394775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020741,-1.535000,11.455744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.117250,-1.535000,11.508381>}
box{<0,0,-0.203200><0.109931,0.035000,0.203200> rotate<0,-28.606752,0> translate<14.020741,-1.535000,11.455744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.071600,-1.535000,2.056031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.756031,-1.535000,1.371600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<14.071600,-1.535000,2.056031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.071600,-1.535000,2.464178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.071600,-1.535000,2.056031>}
box{<0,0,-0.203200><0.408147,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.071600,-1.535000,2.056031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.071600,-1.535000,9.676031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.756031,-1.535000,8.991600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<14.071600,-1.535000,9.676031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.071600,-1.535000,10.643966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.071600,-1.535000,9.676031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.071600,-1.535000,9.676031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.071600,-1.535000,10.643966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.756031,-1.535000,11.328397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.071600,-1.535000,10.643966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.117250,-1.535000,11.508381>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.137659,-1.535000,11.533688>}
box{<0,0,-0.203200><0.032511,0.035000,0.203200> rotate<0,-51.110609,0> translate<14.117250,-1.535000,11.508381> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.137659,-1.535000,11.533688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.039531,-1.535000,12.801600>}
box{<0,0,-0.203200><2.285764,0.035000,0.203200> rotate<0,-33.687801,0> translate<14.137659,-1.535000,11.533688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.236128,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.783300,-1.535000,4.064000>}
box{<0,0,-0.203200><4.547172,0.035000,0.203200> rotate<0,0.000000,0> translate<14.236128,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.515528,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.651631,-1.535000,11.785600>}
box{<0,0,-0.203200><3.136103,0.035000,0.203200> rotate<0,0.000000,0> translate<14.515528,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.756031,-1.535000,1.371600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.723966,-1.535000,1.371600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<14.756031,-1.535000,1.371600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.756031,-1.535000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.723966,-1.535000,8.991600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<14.756031,-1.535000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.756031,-1.535000,11.328397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.723966,-1.535000,11.328397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<14.756031,-1.535000,11.328397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.757400,-1.535000,28.747075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.412075,-1.535000,28.092400>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,44.997030,0> translate<14.757400,-1.535000,28.747075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.757400,-1.535000,29.209981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.757400,-1.535000,28.747075>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.757400,-1.535000,28.747075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.757400,-1.535000,29.209981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.874966,-1.535000,29.209981>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,0.000000,0> translate<14.757400,-1.535000,29.209981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.757400,-1.535000,29.210013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.874966,-1.535000,29.210013>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,0.000000,0> translate<14.757400,-1.535000,29.210013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.757400,-1.535000,29.672922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.757400,-1.535000,29.210013>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.757400,-1.535000,29.210013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.757400,-1.535000,29.672922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.853281,-1.535000,29.768800>}
box{<0,0,-0.203200><0.135594,0.035000,0.203200> rotate<0,-44.996097,0> translate<14.757400,-1.535000,29.672922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.769531,-1.535000,3.708397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.723966,-1.535000,3.708397>}
box{<0,0,-0.203200><0.954434,0.035000,0.203200> rotate<0,0.000000,0> translate<14.769531,-1.535000,3.708397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.125128,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.335350,-1.535000,12.192000>}
box{<0,0,-0.203200><2.210222,0.035000,0.203200> rotate<0,0.000000,0> translate<15.125128,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,14.453966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,14.045819>}
box{<0,0,-0.203200><0.408147,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.341600,-1.535000,14.045819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,14.453966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,15.138397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.341600,-1.535000,14.453966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,16.026031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,15.341600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<15.341600,-1.535000,16.026031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,16.993966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,16.026031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.341600,-1.535000,16.026031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,16.993966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,17.678397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.341600,-1.535000,16.993966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,19.201031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,18.516600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<15.341600,-1.535000,19.201031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,20.168966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,19.201031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.341600,-1.535000,19.201031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,20.168966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,20.853397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.341600,-1.535000,20.168966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,23.011031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,22.326600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<15.341600,-1.535000,23.011031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,23.978966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,23.011031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.341600,-1.535000,23.011031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.341600,-1.535000,23.978966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,24.663397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.341600,-1.535000,23.978966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.412075,-1.535000,28.092400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.874981,-1.535000,28.092397>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,0.000387,0> translate<15.412075,-1.535000,28.092400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.723966,-1.535000,1.371600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,-1.535000,2.056031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.723966,-1.535000,1.371600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.723966,-1.535000,3.708397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,-1.535000,3.023966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<15.723966,-1.535000,3.708397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.723966,-1.535000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.181162,-1.535000,9.448800>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.997226,0> translate<15.723966,-1.535000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.723966,-1.535000,11.328397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.181162,-1.535000,10.871197>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.997226,0> translate<15.723966,-1.535000,11.328397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.734728,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.221200,-1.535000,12.598400>}
box{<0,0,-0.203200><1.486472,0.035000,0.203200> rotate<0,0.000000,0> translate<15.734728,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.774763,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.783300,-1.535000,3.657600>}
box{<0,0,-0.203200><3.008537,0.035000,0.203200> rotate<0,0.000000,0> translate<15.774763,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.874966,-1.535000,29.210013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.874966,-1.535000,29.209981>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.874966,-1.535000,29.209981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.874981,-1.535000,28.092397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.874981,-1.535000,29.209966>}
box{<0,0,-0.203200><1.117569,0.035000,0.203200> rotate<0,90.000000,0> translate<15.874981,-1.535000,29.209966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.874981,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875013,-1.535000,28.448000>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<15.874981,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.874981,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875013,-1.535000,28.854400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<15.874981,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.874981,-1.535000,29.209966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875013,-1.535000,29.209966>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<15.874981,-1.535000,29.209966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875013,-1.535000,28.092400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.337922,-1.535000,28.092400>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,0.000000,0> translate<15.875013,-1.535000,28.092400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875013,-1.535000,29.209966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875013,-1.535000,28.092400>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.875013,-1.535000,28.092400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875031,-1.535000,29.209981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875031,-1.535000,29.210013>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,90.000000,0> translate<15.875031,-1.535000,29.210013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875031,-1.535000,29.209981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992597,-1.535000,29.209981>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,0.000000,0> translate<15.875031,-1.535000,29.209981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875031,-1.535000,29.210013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992597,-1.535000,29.210013>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,0.000000,0> translate<15.875031,-1.535000,29.210013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.977966,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,1.625600>}
box{<0,0,-0.203200><19.302834,0.035000,0.203200> rotate<0,0.000000,0> translate<15.977966,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,15.138397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.993966,-1.535000,15.138397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<16.026031,-1.535000,15.138397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,15.341600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.993966,-1.535000,15.341600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<16.026031,-1.535000,15.341600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,17.678397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.672612,-1.535000,17.678397>}
box{<0,0,-0.203200><0.646581,0.035000,0.203200> rotate<0,0.000000,0> translate<16.026031,-1.535000,17.678397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,18.516600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.993966,-1.535000,18.516600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<16.026031,-1.535000,18.516600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,20.853397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.037609,-1.535000,20.853397>}
box{<0,0,-0.203200><0.011578,0.035000,0.203200> rotate<0,0.000000,0> translate<16.026031,-1.535000,20.853397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,22.326600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.037609,-1.535000,22.326600>}
box{<0,0,-0.203200><0.011578,0.035000,0.203200> rotate<0,0.000000,0> translate<16.026031,-1.535000,22.326600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026031,-1.535000,24.663397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.993966,-1.535000,24.663397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<16.026031,-1.535000,24.663397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.037609,-1.535000,20.853397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.107138,-1.535000,20.922925>}
box{<0,0,-0.203200><0.098328,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.037609,-1.535000,20.853397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.037609,-1.535000,22.326600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.107138,-1.535000,22.257072>}
box{<0,0,-0.203200><0.098328,0.035000,0.203200> rotate<0,44.997030,0> translate<16.037609,-1.535000,22.326600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.039531,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.993966,-1.535000,12.801600>}
box{<0,0,-0.203200><0.954434,0.035000,0.203200> rotate<0,0.000000,0> translate<16.039531,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.079563,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.231416,-1.535000,9.347200>}
box{<0,0,-0.203200><1.151853,0.035000,0.203200> rotate<0,0.000000,0> translate<16.079563,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.079563,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.550038,-1.535000,10.972800>}
box{<0,0,-0.203200><1.470475,0.035000,0.203200> rotate<0,0.000000,0> translate<16.079563,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.107138,-1.535000,20.922925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.368531,-1.535000,21.031197>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,-22.498335,0> translate<16.107138,-1.535000,20.922925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.107138,-1.535000,22.257072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.368531,-1.535000,22.148800>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,22.498335,0> translate<16.107138,-1.535000,22.257072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.181162,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.786203,-1.535000,3.251200>}
box{<0,0,-0.203200><2.605041,0.035000,0.203200> rotate<0,0.000000,0> translate<16.181162,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.181162,-1.535000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.333016,-1.535000,9.448800>}
box{<0,0,-0.203200><1.151853,0.035000,0.203200> rotate<0,0.000000,0> translate<16.181162,-1.535000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.181162,-1.535000,10.871197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.448434,-1.535000,10.871197>}
box{<0,0,-0.203200><1.267272,0.035000,0.203200> rotate<0,0.000000,0> translate<16.181162,-1.535000,10.871197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.215409,-1.535000,8.331197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.177072,-1.535000,9.292859>}
box{<0,0,-0.203200><1.359996,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.215409,-1.535000,8.331197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.337922,-1.535000,28.092400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,-1.535000,28.366081>}
box{<0,0,-0.203200><0.387042,0.035000,0.203200> rotate<0,-44.997357,0> translate<16.337922,-1.535000,28.092400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.368531,-1.535000,21.031197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.448434,-1.535000,21.031197>}
box{<0,0,-0.203200><1.079903,0.035000,0.203200> rotate<0,0.000000,0> translate<16.368531,-1.535000,21.031197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.368531,-1.535000,22.148800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.448434,-1.535000,22.148800>}
box{<0,0,-0.203200><1.079903,0.035000,0.203200> rotate<0,0.000000,0> translate<16.368531,-1.535000,22.148800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.384366,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,2.032000>}
box{<0,0,-0.203200><18.896434,0.035000,0.203200> rotate<0,0.000000,0> translate<16.384366,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,-1.535000,2.056031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,-1.535000,3.023966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<16.408397,-1.535000,3.023966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.205391,-1.535000,2.438400>}
box{<0,0,-0.203200><2.796994,0.035000,0.203200> rotate<0,0.000000,0> translate<16.408397,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.899466,-1.535000,2.844800>}
box{<0,0,-0.203200><2.491069,0.035000,0.203200> rotate<0,0.000000,0> translate<16.408397,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,-1.535000,27.456031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.296031,-1.535000,26.771600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<16.611600,-1.535000,27.456031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,-1.535000,28.366081>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,-1.535000,27.456031>}
box{<0,0,-0.203200><0.910050,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.611600,-1.535000,27.456031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.651466,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.912859,-1.535000,7.017072>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,-22.498335,0> translate<16.651466,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.651466,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.524884,-1.535000,6.908800>}
box{<0,0,-0.203200><0.873419,0.035000,0.203200> rotate<0,0.000000,0> translate<16.651466,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.672612,-1.535000,17.678397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.177072,-1.535000,18.182859>}
box{<0,0,-0.203200><0.713415,0.035000,0.203200> rotate<0,-44.997208,0> translate<16.672612,-1.535000,17.678397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.838831,-1.535000,31.191197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.296031,-1.535000,31.648397>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.838831,-1.535000,31.191197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.912859,-1.535000,7.017072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.293306,-1.535000,7.397522>}
box{<0,0,-0.203200><0.538035,0.035000,0.203200> rotate<0,-44.997265,0> translate<16.912859,-1.535000,7.017072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992597,-1.535000,28.804959>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992597,-1.535000,29.209981>}
box{<0,0,-0.203200><0.405022,0.035000,0.203200> rotate<0,90.000000,0> translate<16.992597,-1.535000,29.209981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992597,-1.535000,28.804959>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.296031,-1.535000,29.108397>}
box{<0,0,-0.203200><0.429123,0.035000,0.203200> rotate<0,-44.997325,0> translate<16.992597,-1.535000,28.804959> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992597,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.042037,-1.535000,28.854400>}
box{<0,0,-0.203200><0.049441,0.035000,0.203200> rotate<0,0.000000,0> translate<16.992597,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992597,-1.535000,29.210013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992597,-1.535000,29.615037>}
box{<0,0,-0.203200><0.405025,0.035000,0.203200> rotate<0,90.000000,0> translate<16.992597,-1.535000,29.615037> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992597,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.301109,-1.535000,29.260800>}
box{<0,0,-0.203200><5.308512,0.035000,0.203200> rotate<0,0.000000,0> translate<16.992597,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992597,-1.535000,29.615037>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.296031,-1.535000,29.311600>}
box{<0,0,-0.203200><0.429123,0.035000,0.203200> rotate<0,44.997325,0> translate<16.992597,-1.535000,29.615037> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.993966,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.289388,-1.535000,13.097025>}
box{<0,0,-0.203200><0.417792,0.035000,0.203200> rotate<0,-44.997333,0> translate<16.993966,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.993966,-1.535000,15.138397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.081478,-1.535000,15.050881>}
box{<0,0,-0.203200><0.123764,0.035000,0.203200> rotate<0,44.998053,0> translate<16.993966,-1.535000,15.138397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.993966,-1.535000,15.341600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.289388,-1.535000,15.637022>}
box{<0,0,-0.203200><0.417790,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.993966,-1.535000,15.341600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.993966,-1.535000,18.516600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,19.201031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.993966,-1.535000,18.516600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.993966,-1.535000,24.663397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,23.978966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<16.993966,-1.535000,24.663397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.081478,-1.535000,15.050881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.221200,-1.535000,15.120741>}
box{<0,0,-0.203200><0.156213,0.035000,0.203200> rotate<0,-26.562785,0> translate<17.081478,-1.535000,15.050881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.095566,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.221200,-1.535000,15.443200>}
box{<0,0,-0.203200><0.125634,0.035000,0.203200> rotate<0,0.000000,0> translate<17.095566,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.171766,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.651634,-1.535000,18.694400>}
box{<0,0,-0.203200><0.479869,0.035000,0.203200> rotate<0,0.000000,0> translate<17.171766,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.177072,-1.535000,9.292859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.333016,-1.535000,9.448800>}
box{<0,0,-0.203200><0.220536,0.035000,0.203200> rotate<0,-44.996456,0> translate<17.177072,-1.535000,9.292859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.177072,-1.535000,18.182859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.372931,-1.535000,18.378716>}
box{<0,0,-0.203200><0.276985,0.035000,0.203200> rotate<0,-44.996573,0> translate<17.177072,-1.535000,18.182859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.197163,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.251188,-1.535000,13.004800>}
box{<0,0,-0.203200><0.054025,0.035000,0.203200> rotate<0,0.000000,0> translate<17.197163,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.210984,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.313519,-1.535000,7.315200>}
box{<0,0,-0.203200><0.102534,0.035000,0.203200> rotate<0,0.000000,0> translate<17.210984,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.221200,-1.535000,12.467588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.399078,-1.535000,12.038153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<17.221200,-1.535000,12.467588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.221200,-1.535000,12.932409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.221200,-1.535000,12.467588>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.221200,-1.535000,12.467588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.221200,-1.535000,12.932409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.289388,-1.535000,13.097025>}
box{<0,0,-0.203200><0.178179,0.035000,0.203200> rotate<0,-67.495107,0> translate<17.221200,-1.535000,12.932409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.221200,-1.535000,15.472409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.221200,-1.535000,15.120741>}
box{<0,0,-0.203200><0.351669,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.221200,-1.535000,15.120741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.221200,-1.535000,15.472409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.289388,-1.535000,15.637022>}
box{<0,0,-0.203200><0.178176,0.035000,0.203200> rotate<0,-67.494722,0> translate<17.221200,-1.535000,15.472409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.273363,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,24.384000>}
box{<0,0,-0.203200><6.145437,0.035000,0.203200> rotate<0,0.000000,0> translate<17.273363,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.293306,-1.535000,7.397522>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.299519,-1.535000,7.358294>}
box{<0,0,-0.203200><0.039717,0.035000,0.203200> rotate<0,80.995544,0> translate<17.293306,-1.535000,7.397522> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.296031,-1.535000,26.771600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.263966,-1.535000,26.771600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<17.296031,-1.535000,26.771600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.296031,-1.535000,29.108397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.263966,-1.535000,29.108397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<17.296031,-1.535000,29.108397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.296031,-1.535000,29.311600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.263966,-1.535000,29.311600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<17.296031,-1.535000,29.311600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.296031,-1.535000,31.648397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.569056,-1.535000,31.648397>}
box{<0,0,-0.203200><0.273025,0.035000,0.203200> rotate<0,0.000000,0> translate<17.296031,-1.535000,31.648397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.299519,-1.535000,7.358294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.353878,-1.535000,7.190988>}
box{<0,0,-0.203200><0.175916,0.035000,0.203200> rotate<0,71.995781,0> translate<17.299519,-1.535000,7.358294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.353878,-1.535000,7.190988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.433744,-1.535000,7.034250>}
box{<0,0,-0.203200><0.175912,0.035000,0.203200> rotate<0,62.994716,0> translate<17.353878,-1.535000,7.190988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.372931,-1.535000,18.378716>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.399078,-1.535000,18.441844>}
box{<0,0,-0.203200><0.068329,0.035000,0.203200> rotate<0,-67.496824,0> translate<17.372931,-1.535000,18.378716> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.399078,-1.535000,12.038153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,11.709478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<17.399078,-1.535000,12.038153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.399078,-1.535000,18.441844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,18.770519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.399078,-1.535000,18.441844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.433744,-1.535000,7.034250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.537141,-1.535000,6.891931>}
box{<0,0,-0.203200><0.175913,0.035000,0.203200> rotate<0,53.997424,0> translate<17.433744,-1.535000,7.034250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.448434,-1.535000,10.871197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,11.150519>}
box{<0,0,-0.203200><0.395019,0.035000,0.203200> rotate<0,-44.997351,0> translate<17.448434,-1.535000,10.871197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.448434,-1.535000,21.031197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,21.310519>}
box{<0,0,-0.203200><0.395019,0.035000,0.203200> rotate<0,-44.997351,0> translate<17.448434,-1.535000,21.031197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.448434,-1.535000,22.148800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,21.869478>}
box{<0,0,-0.203200><0.395019,0.035000,0.203200> rotate<0,44.997351,0> translate<17.448434,-1.535000,22.148800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.537141,-1.535000,6.891931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.661531,-1.535000,6.767541>}
box{<0,0,-0.203200><0.175915,0.035000,0.203200> rotate<0,44.997030,0> translate<17.537141,-1.535000,6.891931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.569056,-1.535000,31.648397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.210313,-1.535000,32.930909>}
box{<0,0,-0.203200><1.433893,0.035000,0.203200> rotate<0,-63.430762,0> translate<17.569056,-1.535000,31.648397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.578166,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,19.100800>}
box{<0,0,-0.203200><5.840634,0.035000,0.203200> rotate<0,0.000000,0> translate<17.578166,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.661531,-1.535000,6.767541>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.803850,-1.535000,6.664144>}
box{<0,0,-0.203200><0.175913,0.035000,0.203200> rotate<0,35.996636,0> translate<17.661531,-1.535000,6.767541> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,13.641159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,13.759056>}
box{<0,0,-0.203200><0.117897,0.035000,0.203200> rotate<0,90.000000,0> translate<17.678397,-1.535000,13.759056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,13.641159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,13.690519>}
box{<0,0,-0.203200><0.069802,0.035000,0.203200> rotate<0,-44.998844,0> translate<17.678397,-1.535000,13.641159> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,13.759056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.303487,-1.535000,14.071600>}
box{<0,0,-0.203200><0.698872,0.035000,0.203200> rotate<0,-26.563183,0> translate<17.678397,-1.535000,13.759056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,16.181159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,16.672612>}
box{<0,0,-0.203200><0.491453,0.035000,0.203200> rotate<0,90.000000,0> translate<17.678397,-1.535000,16.672612> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,16.181159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,16.230519>}
box{<0,0,-0.203200><0.069802,0.035000,0.203200> rotate<0,-44.998844,0> translate<17.678397,-1.535000,16.181159> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.789272,-1.535000,16.256000>}
box{<0,0,-0.203200><0.110875,0.035000,0.203200> rotate<0,0.000000,0> translate<17.678397,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034547,-1.535000,16.662400>}
box{<0,0,-0.203200><0.356150,0.035000,0.203200> rotate<0,0.000000,0> translate<17.678397,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,16.672612>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.775491,-1.535000,16.769706>}
box{<0,0,-0.203200><0.137311,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.678397,-1.535000,16.672612> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,19.201031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,19.378837>}
box{<0,0,-0.203200><0.177806,0.035000,0.203200> rotate<0,90.000000,0> translate<17.678397,-1.535000,19.378837> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,19.378837>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,19.329478>}
box{<0,0,-0.203200><0.069802,0.035000,0.203200> rotate<0,44.998844,0> translate<17.678397,-1.535000,19.378837> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,23.801159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,23.978966>}
box{<0,0,-0.203200><0.177806,0.035000,0.203200> rotate<0,90.000000,0> translate<17.678397,-1.535000,23.978966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,23.801159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,23.850519>}
box{<0,0,-0.203200><0.069802,0.035000,0.203200> rotate<0,-44.998844,0> translate<17.678397,-1.535000,23.801159> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034556,-1.535000,23.977600>}
box{<0,0,-0.203200><0.356159,0.035000,0.203200> rotate<0,0.000000,0> translate<17.678397,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,11.150519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,11.328397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<17.727753,-1.535000,11.150519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,11.709478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,11.531600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<17.727753,-1.535000,11.709478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,13.690519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,13.868397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<17.727753,-1.535000,13.690519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,16.230519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,16.408397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<17.727753,-1.535000,16.230519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,18.770519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,18.948397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<17.727753,-1.535000,18.770519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,19.329478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,19.151600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<17.727753,-1.535000,19.329478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,21.310519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,21.488397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<17.727753,-1.535000,21.310519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,21.869478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,21.691600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<17.727753,-1.535000,21.869478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.727753,-1.535000,23.850519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,24.028397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<17.727753,-1.535000,23.850519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.775491,-1.535000,16.769706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,16.611600>}
box{<0,0,-0.203200><0.413147,0.035000,0.203200> rotate<0,22.498800,0> translate<17.775491,-1.535000,16.769706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.795484,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034556,-1.535000,13.817600>}
box{<0,0,-0.203200><0.239072,0.035000,0.203200> rotate<0,0.000000,0> translate<17.795484,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.803850,-1.535000,6.664144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.960588,-1.535000,6.584278>}
box{<0,0,-0.203200><0.175912,0.035000,0.203200> rotate<0,26.999344,0> translate<17.803850,-1.535000,6.664144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.960588,-1.535000,6.584278>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.127894,-1.535000,6.529919>}
box{<0,0,-0.203200><0.175916,0.035000,0.203200> rotate<0,17.998279,0> translate<17.960588,-1.535000,6.584278> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.021300,-1.535000,33.387222>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.210313,-1.535000,32.930909>}
box{<0,0,-0.203200><0.493910,0.035000,0.203200> rotate<0,67.495366,0> translate<18.021300,-1.535000,33.387222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.021300,-1.535000,33.922775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.021300,-1.535000,33.387222>}
box{<0,0,-0.203200><0.535553,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.021300,-1.535000,33.387222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.021300,-1.535000,33.922775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.226247,-1.535000,34.417559>}
box{<0,0,-0.203200><0.535551,0.035000,0.203200> rotate<0,-67.495498,0> translate<18.021300,-1.535000,33.922775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.127894,-1.535000,6.529919>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.301641,-1.535000,6.502400>}
box{<0,0,-0.203200><0.175913,0.035000,0.203200> rotate<0,8.999389,0> translate<18.127894,-1.535000,6.529919> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,11.328397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,11.328397>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<18.157187,-1.535000,11.328397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,11.531600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,11.531600>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<18.157187,-1.535000,11.531600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,13.868397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,13.868397>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<18.157187,-1.535000,13.868397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,16.408397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,16.408397>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<18.157187,-1.535000,16.408397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,16.611600>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<18.157187,-1.535000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,18.948397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,18.948397>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<18.157187,-1.535000,18.948397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,19.151600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,19.151600>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<18.157187,-1.535000,19.151600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,21.488397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,21.488397>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<18.157187,-1.535000,21.488397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,21.691600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,21.691600>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<18.157187,-1.535000,21.691600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157187,-1.535000,24.028397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,24.028397>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<18.157187,-1.535000,24.028397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.226247,-1.535000,34.417559>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.604938,-1.535000,34.796250>}
box{<0,0,-0.203200><0.535549,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.226247,-1.535000,34.417559> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.263966,-1.535000,26.771600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.721166,-1.535000,27.228800>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.263966,-1.535000,26.771600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.263966,-1.535000,29.108397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.721166,-1.535000,28.651197>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,44.997030,0> translate<18.263966,-1.535000,29.108397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.263966,-1.535000,29.311600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948397,-1.535000,29.996031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.263966,-1.535000,29.311600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.301641,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.049981,-1.535000,6.502400>}
box{<0,0,-0.203200><0.748341,0.035000,0.203200> rotate<0,0.000000,0> translate<18.301641,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.303487,-1.535000,14.071600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,14.071600>}
box{<0,0,-0.203200><1.639322,0.035000,0.203200> rotate<0,0.000000,0> translate<18.303487,-1.535000,14.071600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.314766,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.139894,-1.535000,26.822400>}
box{<0,0,-0.203200><3.825128,0.035000,0.203200> rotate<0,0.000000,0> translate<18.314766,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.517962,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.924469,-1.535000,28.854400>}
box{<0,0,-0.203200><3.406506,0.035000,0.203200> rotate<0,0.000000,0> translate<18.517962,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.604938,-1.535000,34.796250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.099722,-1.535000,35.001197>}
box{<0,0,-0.203200><0.535551,0.035000,0.203200> rotate<0,-22.498562,0> translate<18.604938,-1.535000,34.796250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.619566,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.894709,-1.535000,29.667200>}
box{<0,0,-0.203200><3.275144,0.035000,0.203200> rotate<0,0.000000,0> translate<18.619566,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.721166,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.738713,-1.535000,27.228800>}
box{<0,0,-0.203200><3.017547,0.035000,0.203200> rotate<0,0.000000,0> translate<18.721166,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.721166,-1.535000,28.651197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.738713,-1.535000,28.651197>}
box{<0,0,-0.203200><3.017547,0.035000,0.203200> rotate<0,0.000000,0> translate<18.721166,-1.535000,28.651197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.783297,-1.535000,4.178300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.783300,-1.535000,4.985453>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,-89.993839,0> translate<18.783297,-1.535000,4.178300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.783297,-1.535000,4.178300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951678,-1.535000,4.178300>}
box{<0,0,-0.203200><1.168381,0.035000,0.203200> rotate<0,0.000000,0> translate<18.783297,-1.535000,4.178300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.783300,-1.535000,3.269544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.813322,-1.535000,3.080000>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<18.783300,-1.535000,3.269544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.783300,-1.535000,4.076694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.783300,-1.535000,3.269544>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.783300,-1.535000,3.269544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.783300,-1.535000,4.076694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951678,-1.535000,4.076694>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<18.783300,-1.535000,4.076694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.783300,-1.535000,4.985453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.813322,-1.535000,5.174997>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<18.783300,-1.535000,4.985453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.813322,-1.535000,3.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.872622,-1.535000,2.897487>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<18.813322,-1.535000,3.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.813322,-1.535000,5.174997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.872622,-1.535000,5.357509>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<18.813322,-1.535000,5.174997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.860881,-1.535000,31.051481>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948397,-1.535000,30.963966>}
box{<0,0,-0.203200><0.123766,0.035000,0.203200> rotate<0,44.997030,0> translate<18.860881,-1.535000,31.051481> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.860881,-1.535000,31.051481>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.489541,-1.535000,32.308800>}
box{<0,0,-0.203200><1.405725,0.035000,0.203200> rotate<0,-63.430762,0> translate<18.860881,-1.535000,31.051481> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.872622,-1.535000,2.897487>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.959747,-1.535000,2.726500>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<18.872622,-1.535000,2.897487> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.872622,-1.535000,5.357509>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.959747,-1.535000,5.528497>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<18.872622,-1.535000,5.357509> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948397,-1.535000,29.996031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948397,-1.535000,30.963966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<18.948397,-1.535000,30.963966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948397,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.602700,-1.535000,30.073600>}
box{<0,0,-0.203200><2.654303,0.035000,0.203200> rotate<0,0.000000,0> translate<18.948397,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948397,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.859966,-1.535000,30.480000>}
box{<0,0,-0.203200><3.911569,0.035000,0.203200> rotate<0,0.000000,0> translate<18.948397,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948397,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.602700,-1.535000,30.886400>}
box{<0,0,-0.203200><2.654303,0.035000,0.203200> rotate<0,0.000000,0> translate<18.948397,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.959747,-1.535000,2.726500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.072547,-1.535000,2.571244>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<18.959747,-1.535000,2.726500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.959747,-1.535000,5.528497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.072547,-1.535000,5.683753>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<18.959747,-1.535000,5.528497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.981541,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.894713,-1.535000,31.292800>}
box{<0,0,-0.203200><2.913172,0.035000,0.203200> rotate<0,0.000000,0> translate<18.981541,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.049981,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.049981,-1.535000,7.619966>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,90.000000,0> translate<19.049981,-1.535000,7.619966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.049981,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050013,-1.535000,6.502400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<19.049981,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.049981,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050013,-1.535000,6.908800>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<19.049981,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.049981,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050013,-1.535000,7.315200>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<19.049981,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.049981,-1.535000,7.619966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050013,-1.535000,7.619966>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<19.049981,-1.535000,7.619966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050013,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.798356,-1.535000,6.502400>}
box{<0,0,-0.203200><0.748344,0.035000,0.203200> rotate<0,0.000000,0> translate<19.050013,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050013,-1.535000,7.619966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050013,-1.535000,6.502400>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.050013,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050031,-1.535000,7.619981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050031,-1.535000,7.620013>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,90.000000,0> translate<19.050031,-1.535000,7.620013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050031,-1.535000,7.619981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.827997,-1.535000,7.619981>}
box{<0,0,-0.203200><1.777966,0.035000,0.203200> rotate<0,0.000000,0> translate<19.050031,-1.535000,7.619981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050031,-1.535000,7.620013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.827997,-1.535000,7.620013>}
box{<0,0,-0.203200><1.777966,0.035000,0.203200> rotate<0,0.000000,0> translate<19.050031,-1.535000,7.620013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.072547,-1.535000,2.571244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.208244,-1.535000,2.435547>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<19.072547,-1.535000,2.571244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.072547,-1.535000,5.683753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.208244,-1.535000,5.819450>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.072547,-1.535000,5.683753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.099722,-1.535000,35.001197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.635275,-1.535000,35.001197>}
box{<0,0,-0.203200><0.535553,0.035000,0.203200> rotate<0,0.000000,0> translate<19.099722,-1.535000,35.001197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.184741,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.301113,-1.535000,31.699200>}
box{<0,0,-0.203200><3.116372,0.035000,0.203200> rotate<0,0.000000,0> translate<19.184741,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.208244,-1.535000,2.435547>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.363500,-1.535000,2.322747>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<19.208244,-1.535000,2.435547> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.208244,-1.535000,5.819450>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.363500,-1.535000,5.932250>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<19.208244,-1.535000,5.819450> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.363500,-1.535000,2.322747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.534488,-1.535000,2.235622>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<19.363500,-1.535000,2.322747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.363500,-1.535000,5.932250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.534488,-1.535000,6.019375>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<19.363500,-1.535000,5.932250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.387941,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.019816,-1.535000,32.105600>}
box{<0,0,-0.203200><6.631875,0.035000,0.203200> rotate<0,0.000000,0> translate<19.387941,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.489541,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.635275,-1.535000,32.308800>}
box{<0,0,-0.203200><0.145734,0.035000,0.203200> rotate<0,0.000000,0> translate<19.489541,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.534488,-1.535000,2.235622>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.717000,-1.535000,2.176322>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,17.998271,0> translate<19.534488,-1.535000,2.235622> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.534488,-1.535000,6.019375>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.717000,-1.535000,6.078675>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-17.998271,0> translate<19.534488,-1.535000,6.019375> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.635275,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.130059,-1.535000,32.513747>}
box{<0,0,-0.203200><0.535551,0.035000,0.203200> rotate<0,-22.498562,0> translate<19.635275,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.635275,-1.535000,35.001197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.130059,-1.535000,34.796250>}
box{<0,0,-0.203200><0.535551,0.035000,0.203200> rotate<0,22.498562,0> translate<19.635275,-1.535000,35.001197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.717000,-1.535000,2.176322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.906544,-1.535000,2.146300>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,8.999729,0> translate<19.717000,-1.535000,2.176322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.717000,-1.535000,6.078675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.906544,-1.535000,6.108697>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-8.999729,0> translate<19.717000,-1.535000,6.078675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.757909,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.087231,-1.535000,34.950400>}
box{<0,0,-0.203200><3.329322,0.035000,0.203200> rotate<0,0.000000,0> translate<19.757909,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.798356,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.972103,-1.535000,6.529919>}
box{<0,0,-0.203200><0.175913,0.035000,0.203200> rotate<0,-8.999389,0> translate<19.798356,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.798356,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654544,-1.535000,6.502400>}
box{<0,0,-0.203200><5.856188,0.035000,0.203200> rotate<0,0.000000,0> translate<19.798356,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.906544,-1.535000,2.146300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,2.146297>}
box{<0,0,-0.203200><0.045150,0.035000,0.203200> rotate<0,0.003965,0> translate<19.906544,-1.535000,2.146300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.906544,-1.535000,6.108697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,6.108697>}
box{<0,0,-0.203200><0.045150,0.035000,0.203200> rotate<0,0.000000,0> translate<19.906544,-1.535000,6.108697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,11.328397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,11.150519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<19.942809,-1.535000,11.328397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,11.531600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,11.709478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<19.942809,-1.535000,11.531600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,13.868397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,13.690519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<19.942809,-1.535000,13.868397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,14.071600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,14.249478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<19.942809,-1.535000,14.071600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,16.408397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,16.230519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<19.942809,-1.535000,16.408397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,16.789478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<19.942809,-1.535000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,18.948397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,18.770519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<19.942809,-1.535000,18.948397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,19.151600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,19.329478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<19.942809,-1.535000,19.151600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,21.488397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,21.310519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<19.942809,-1.535000,21.488397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,21.691600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,21.869478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<19.942809,-1.535000,21.691600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.942809,-1.535000,24.028397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,23.850519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<19.942809,-1.535000,24.028397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951678,-1.535000,4.178300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951678,-1.535000,4.076694>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.951678,-1.535000,4.076694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,2.146297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,4.076678>}
box{<0,0,-0.203200><1.930381,0.035000,0.203200> rotate<0,90.000000,0> translate<19.951694,-1.535000,4.076678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,2.438400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<19.951694,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,2.844800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<19.951694,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,3.251200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<19.951694,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,3.657600>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<19.951694,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,4.064000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<19.951694,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,4.076678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,4.076678>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<19.951694,-1.535000,4.076678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,4.178319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,6.108697>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,90.000000,0> translate<19.951694,-1.535000,6.108697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,4.178319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,4.178319>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<19.951694,-1.535000,4.178319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,4.470400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<19.951694,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,4.876800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<19.951694,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,5.283200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<19.951694,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,5.689600>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<19.951694,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.951694,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,6.096000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<19.951694,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.972103,-1.535000,6.529919>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.139409,-1.535000,6.584278>}
box{<0,0,-0.203200><0.175916,0.035000,0.203200> rotate<0,-17.998279,0> translate<19.972103,-1.535000,6.529919> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,2.146300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.098453,-1.535000,2.146300>}
box{<0,0,-0.203200><0.045153,0.035000,0.203200> rotate<0,0.000000,0> translate<20.053300,-1.535000,2.146300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,4.076678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,2.146300>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.053300,-1.535000,2.146300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,6.108697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,4.178319>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.053300,-1.535000,4.178319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053300,-1.535000,6.108697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.098453,-1.535000,6.108697>}
box{<0,0,-0.203200><0.045153,0.035000,0.203200> rotate<0,0.000000,0> translate<20.053300,-1.535000,6.108697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053319,-1.535000,4.076694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053319,-1.535000,4.178300>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,90.000000,0> translate<20.053319,-1.535000,4.178300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053319,-1.535000,4.076694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.221697,-1.535000,4.076694>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<20.053319,-1.535000,4.076694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.053319,-1.535000,4.178300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.221697,-1.535000,4.178300>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<20.053319,-1.535000,4.178300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.065444,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,13.817600>}
box{<0,0,-0.203200><3.353356,0.035000,0.203200> rotate<0,0.000000,0> translate<20.065444,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.065444,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,23.977600>}
box{<0,0,-0.203200><3.353356,0.035000,0.203200> rotate<0,0.000000,0> translate<20.065444,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.065450,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,16.662400>}
box{<0,0,-0.203200><3.353350,0.035000,0.203200> rotate<0,0.000000,0> translate<20.065450,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.098453,-1.535000,2.146300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.287997,-1.535000,2.176322>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-8.999729,0> translate<20.098453,-1.535000,2.146300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.098453,-1.535000,6.108697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.287997,-1.535000,6.078675>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,8.999729,0> translate<20.098453,-1.535000,6.108697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.125841,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.172209,-1.535000,32.512000>}
box{<0,0,-0.203200><6.046369,0.035000,0.203200> rotate<0,0.000000,0> translate<20.125841,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.130059,-1.535000,32.513747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.508750,-1.535000,32.892437>}
box{<0,0,-0.203200><0.535549,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.130059,-1.535000,32.513747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.130059,-1.535000,34.796250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.508750,-1.535000,34.417559>}
box{<0,0,-0.203200><0.535549,0.035000,0.203200> rotate<0,44.997030,0> translate<20.130059,-1.535000,34.796250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.139409,-1.535000,6.584278>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.296147,-1.535000,6.664144>}
box{<0,0,-0.203200><0.175912,0.035000,0.203200> rotate<0,-26.999344,0> translate<20.139409,-1.535000,6.584278> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.178616,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.366384,-1.535000,6.096000>}
box{<0,0,-0.203200><2.187769,0.035000,0.203200> rotate<0,0.000000,0> translate<20.178616,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.287997,-1.535000,2.176322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.470509,-1.535000,2.235622>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-17.998271,0> translate<20.287997,-1.535000,2.176322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.287997,-1.535000,6.078675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.470509,-1.535000,6.019375>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,17.998271,0> translate<20.287997,-1.535000,6.078675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.296147,-1.535000,6.664144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.438466,-1.535000,6.767541>}
box{<0,0,-0.203200><0.175913,0.035000,0.203200> rotate<0,-35.996636,0> translate<20.296147,-1.535000,6.664144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.310728,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,16.256000>}
box{<0,0,-0.203200><3.108072,0.035000,0.203200> rotate<0,0.000000,0> translate<20.310728,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.310731,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,14.224000>}
box{<0,0,-0.203200><3.108069,0.035000,0.203200> rotate<0,0.000000,0> translate<20.310731,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,11.150519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,10.821844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<20.372244,-1.535000,11.150519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,11.709478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,12.038153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.372244,-1.535000,11.709478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,13.690519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,13.361844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<20.372244,-1.535000,13.690519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,14.249478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,14.578153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.372244,-1.535000,14.249478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,16.230519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,15.901844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<20.372244,-1.535000,16.230519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,16.789478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,17.118153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.372244,-1.535000,16.789478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,18.770519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,18.441844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<20.372244,-1.535000,18.770519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,19.329478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,19.658153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.372244,-1.535000,19.329478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,21.310519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,20.981844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<20.372244,-1.535000,21.310519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,21.869478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,22.198153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.372244,-1.535000,21.869478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.372244,-1.535000,23.850519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,23.521844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<20.372244,-1.535000,23.850519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.382309,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493631,-1.535000,34.544000>}
box{<0,0,-0.203200><3.111322,0.035000,0.203200> rotate<0,0.000000,0> translate<20.382309,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.438466,-1.535000,6.767541>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.562856,-1.535000,6.891931>}
box{<0,0,-0.203200><0.175915,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.438466,-1.535000,6.767541> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.448363,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,18.694400>}
box{<0,0,-0.203200><2.970437,0.035000,0.203200> rotate<0,0.000000,0> translate<20.448363,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.448366,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,11.785600>}
box{<0,0,-0.203200><2.970434,0.035000,0.203200> rotate<0,0.000000,0> translate<20.448366,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.448366,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,21.945600>}
box{<0,0,-0.203200><2.970434,0.035000,0.203200> rotate<0,0.000000,0> translate<20.448366,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.470509,-1.535000,2.235622>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.641497,-1.535000,2.322747>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<20.470509,-1.535000,2.235622> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.470509,-1.535000,6.019375>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.641497,-1.535000,5.932250>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<20.470509,-1.535000,6.019375> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.508750,-1.535000,32.892437>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.713697,-1.535000,33.387222>}
box{<0,0,-0.203200><0.535551,0.035000,0.203200> rotate<0,-67.495498,0> translate<20.508750,-1.535000,32.892437> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.508750,-1.535000,34.417559>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.713697,-1.535000,33.922775>}
box{<0,0,-0.203200><0.535551,0.035000,0.203200> rotate<0,67.495498,0> translate<20.508750,-1.535000,34.417559> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.519503,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.765809,-1.535000,32.918400>}
box{<0,0,-0.203200><5.246306,0.035000,0.203200> rotate<0,0.000000,0> translate<20.519503,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.549962,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,10.972800>}
box{<0,0,-0.203200><2.868838,0.035000,0.203200> rotate<0,0.000000,0> translate<20.549962,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.549962,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,21.132800>}
box{<0,0,-0.203200><2.868838,0.035000,0.203200> rotate<0,0.000000,0> translate<20.549962,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.549966,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,19.507200>}
box{<0,0,-0.203200><2.868834,0.035000,0.203200> rotate<0,0.000000,0> translate<20.549966,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.562856,-1.535000,6.891931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.666253,-1.535000,7.034250>}
box{<0,0,-0.203200><0.175913,0.035000,0.203200> rotate<0,-53.997424,0> translate<20.562856,-1.535000,6.891931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.575109,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.068431,-1.535000,6.908800>}
box{<0,0,-0.203200><4.493322,0.035000,0.203200> rotate<0,0.000000,0> translate<20.575109,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.624716,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.546609,-1.535000,34.137600>}
box{<0,0,-0.203200><3.921894,0.035000,0.203200> rotate<0,0.000000,0> translate<20.624716,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.641497,-1.535000,2.322747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.796753,-1.535000,2.435547>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<20.641497,-1.535000,2.322747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.641497,-1.535000,5.932250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.796753,-1.535000,5.819450>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<20.641497,-1.535000,5.932250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.651563,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,13.411200>}
box{<0,0,-0.203200><2.767238,0.035000,0.203200> rotate<0,0.000000,0> translate<20.651563,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.651563,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,23.571200>}
box{<0,0,-0.203200><2.767238,0.035000,0.203200> rotate<0,0.000000,0> translate<20.651563,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.651566,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,17.068800>}
box{<0,0,-0.203200><2.767234,0.035000,0.203200> rotate<0,0.000000,0> translate<20.651566,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.666253,-1.535000,7.034250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.746119,-1.535000,7.190988>}
box{<0,0,-0.203200><0.175912,0.035000,0.203200> rotate<0,-62.994716,0> translate<20.666253,-1.535000,7.034250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.679981,-1.535000,8.178800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.746119,-1.535000,8.049009>}
box{<0,0,-0.203200><0.145670,0.035000,0.203200> rotate<0,62.993784,0> translate<20.679981,-1.535000,8.178800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.679981,-1.535000,8.178800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.258628,-1.535000,8.178800>}
box{<0,0,-0.203200><3.578647,0.035000,0.203200> rotate<0,0.000000,0> translate<20.679981,-1.535000,8.178800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.687841,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.359409,-1.535000,33.324800>}
box{<0,0,-0.203200><4.671569,0.035000,0.203200> rotate<0,0.000000,0> translate<20.687841,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,10.821844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,10.392409>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<20.700919,-1.535000,10.821844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,12.038153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,12.467588>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<20.700919,-1.535000,12.038153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,13.361844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,12.932409>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<20.700919,-1.535000,13.361844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,14.578153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,15.007588>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<20.700919,-1.535000,14.578153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,15.901844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,15.472409>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<20.700919,-1.535000,15.901844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,17.118153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,17.547588>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<20.700919,-1.535000,17.118153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,18.441844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,18.012409>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<20.700919,-1.535000,18.441844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,19.658153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,20.087588>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<20.700919,-1.535000,19.658153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,20.981844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,20.552409>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<20.700919,-1.535000,20.981844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,22.198153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,22.627588>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<20.700919,-1.535000,22.198153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.700919,-1.535000,23.521844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,23.092409>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<20.700919,-1.535000,23.521844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.705869,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.347528,-1.535000,8.128000>}
box{<0,0,-0.203200><3.641659,0.035000,0.203200> rotate<0,0.000000,0> translate<20.705869,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.713697,-1.535000,33.387222>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.713697,-1.535000,33.922775>}
box{<0,0,-0.203200><0.535553,0.035000,0.203200> rotate<0,90.000000,0> translate<20.713697,-1.535000,33.922775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.713697,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.953009,-1.535000,33.731200>}
box{<0,0,-0.203200><4.239313,0.035000,0.203200> rotate<0,0.000000,0> translate<20.713697,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.722559,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,14.630400>}
box{<0,0,-0.203200><2.696241,0.035000,0.203200> rotate<0,0.000000,0> translate<20.722559,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.722559,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,15.849600>}
box{<0,0,-0.203200><2.696241,0.035000,0.203200> rotate<0,0.000000,0> translate<20.722559,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.743600,-1.535000,9.601197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,9.927588>}
box{<0,0,-0.203200><0.353283,0.035000,0.203200> rotate<0,-67.495328,0> translate<20.743600,-1.535000,9.601197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.743600,-1.535000,9.601197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,9.601197>}
box{<0,0,-0.203200><2.675200,0.035000,0.203200> rotate<0,0.000000,0> translate<20.743600,-1.535000,9.601197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.746119,-1.535000,7.190988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.800478,-1.535000,7.358294>}
box{<0,0,-0.203200><0.175916,0.035000,0.203200> rotate<0,-71.995781,0> translate<20.746119,-1.535000,7.190988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.746119,-1.535000,8.049009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.800478,-1.535000,7.881703>}
box{<0,0,-0.203200><0.175916,0.035000,0.203200> rotate<0,71.995781,0> translate<20.746119,-1.535000,8.049009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.764644,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,12.192000>}
box{<0,0,-0.203200><2.654156,0.035000,0.203200> rotate<0,0.000000,0> translate<20.764644,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.764644,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,18.288000>}
box{<0,0,-0.203200><2.654156,0.035000,0.203200> rotate<0,0.000000,0> translate<20.764644,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.764644,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,22.352000>}
box{<0,0,-0.203200><2.654156,0.035000,0.203200> rotate<0,0.000000,0> translate<20.764644,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.786475,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.871181,-1.535000,7.315200>}
box{<0,0,-0.203200><4.084706,0.035000,0.203200> rotate<0,0.000000,0> translate<20.786475,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.796753,-1.535000,2.435547>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.932450,-1.535000,2.571244>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.796753,-1.535000,2.435547> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.796753,-1.535000,5.819450>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.932450,-1.535000,5.683753>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<20.796753,-1.535000,5.819450> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.799606,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.745391,-1.535000,2.438400>}
box{<0,0,-0.203200><0.945784,0.035000,0.203200> rotate<0,0.000000,0> translate<20.799606,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.800478,-1.535000,7.358294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.827997,-1.535000,7.532041>}
box{<0,0,-0.203200><0.175913,0.035000,0.203200> rotate<0,-80.994671,0> translate<20.800478,-1.535000,7.358294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.800478,-1.535000,7.881703>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.827997,-1.535000,7.707956>}
box{<0,0,-0.203200><0.175913,0.035000,0.203200> rotate<0,80.994671,0> translate<20.800478,-1.535000,7.881703> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.806725,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,9.753600>}
box{<0,0,-0.203200><2.612075,0.035000,0.203200> rotate<0,0.000000,0> translate<20.806725,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.806728,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,10.566400>}
box{<0,0,-0.203200><2.612072,0.035000,0.203200> rotate<0,0.000000,0> translate<20.806728,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.806728,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,19.913600>}
box{<0,0,-0.203200><2.612072,0.035000,0.203200> rotate<0,0.000000,0> translate<20.806728,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.806728,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,20.726400>}
box{<0,0,-0.203200><2.612072,0.035000,0.203200> rotate<0,0.000000,0> translate<20.806728,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.825838,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,7.721600>}
box{<0,0,-0.203200><4.015362,0.035000,0.203200> rotate<0,0.000000,0> translate<20.825838,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.827997,-1.535000,7.532041>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.827997,-1.535000,7.619981>}
box{<0,0,-0.203200><0.087941,0.035000,0.203200> rotate<0,90.000000,0> translate<20.827997,-1.535000,7.619981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.827997,-1.535000,7.620013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.827997,-1.535000,7.707956>}
box{<0,0,-0.203200><0.087944,0.035000,0.203200> rotate<0,90.000000,0> translate<20.827997,-1.535000,7.707956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.848813,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,13.004800>}
box{<0,0,-0.203200><2.569987,0.035000,0.203200> rotate<0,0.000000,0> translate<20.848813,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.848813,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,17.475200>}
box{<0,0,-0.203200><2.569987,0.035000,0.203200> rotate<0,0.000000,0> translate<20.848813,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.848813,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,23.164800>}
box{<0,0,-0.203200><2.569987,0.035000,0.203200> rotate<0,0.000000,0> translate<20.848813,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,9.927588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,10.392409>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,90.000000,0> translate<20.878797,-1.535000,10.392409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,10.160000>}
box{<0,0,-0.203200><2.540003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.878797,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,12.467588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,12.932409>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,90.000000,0> translate<20.878797,-1.535000,12.932409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,12.598400>}
box{<0,0,-0.203200><2.540003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.878797,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,15.007588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,15.472409>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,90.000000,0> translate<20.878797,-1.535000,15.472409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,15.036800>}
box{<0,0,-0.203200><2.540003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.878797,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,15.443200>}
box{<0,0,-0.203200><2.540003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.878797,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,17.547588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,18.012409>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,90.000000,0> translate<20.878797,-1.535000,18.012409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,17.881600>}
box{<0,0,-0.203200><2.540003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.878797,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,20.087588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,20.552409>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,90.000000,0> translate<20.878797,-1.535000,20.552409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,20.320000>}
box{<0,0,-0.203200><2.540003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.878797,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,22.627588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,23.092409>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,90.000000,0> translate<20.878797,-1.535000,23.092409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.878797,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,22.758400>}
box{<0,0,-0.203200><2.540003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.878797,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.926603,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.618394,-1.535000,5.689600>}
box{<0,0,-0.203200><0.691791,0.035000,0.203200> rotate<0,0.000000,0> translate<20.926603,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.932450,-1.535000,2.571244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.045250,-1.535000,2.726500>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<20.932450,-1.535000,2.571244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.932450,-1.535000,5.683753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.045250,-1.535000,5.528497>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<20.932450,-1.535000,5.683753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.045250,-1.535000,2.726500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132375,-1.535000,2.897487>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<21.045250,-1.535000,2.726500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.045250,-1.535000,5.528497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132375,-1.535000,5.357509>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<21.045250,-1.535000,5.528497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.105528,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.439466,-1.535000,2.844800>}
box{<0,0,-0.203200><0.333938,0.035000,0.203200> rotate<0,0.000000,0> translate<21.105528,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132375,-1.535000,2.897487>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.191675,-1.535000,3.080000>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<21.132375,-1.535000,2.897487> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132375,-1.535000,5.357509>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.191675,-1.535000,5.174997>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<21.132375,-1.535000,5.357509> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.156522,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.388478,-1.535000,5.283200>}
box{<0,0,-0.203200><0.231956,0.035000,0.203200> rotate<0,0.000000,0> translate<21.156522,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.191675,-1.535000,3.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.221697,-1.535000,3.269544>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<21.191675,-1.535000,3.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.191675,-1.535000,5.174997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.221697,-1.535000,4.985453>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<21.191675,-1.535000,5.174997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.218791,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.326203,-1.535000,3.251200>}
box{<0,0,-0.203200><0.107412,0.035000,0.203200> rotate<0,0.000000,0> translate<21.218791,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.221697,-1.535000,3.269544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.221697,-1.535000,4.076694>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,90.000000,0> translate<21.221697,-1.535000,4.076694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.221697,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.323300,-1.535000,3.657600>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<21.221697,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.221697,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.323300,-1.535000,4.064000>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<21.221697,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.221697,-1.535000,4.178300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.221697,-1.535000,4.985453>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,90.000000,0> translate<21.221697,-1.535000,4.985453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.221697,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.323300,-1.535000,4.470400>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<21.221697,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.221697,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.323300,-1.535000,4.876800>}
box{<0,0,-0.203200><0.101603,0.035000,0.203200> rotate<0,0.000000,0> translate<21.221697,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.323297,-1.535000,4.178300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.323300,-1.535000,4.985453>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,-89.993839,0> translate<21.323297,-1.535000,4.178300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.323297,-1.535000,4.178300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491678,-1.535000,4.178300>}
box{<0,0,-0.203200><1.168381,0.035000,0.203200> rotate<0,0.000000,0> translate<21.323297,-1.535000,4.178300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.323300,-1.535000,3.269544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.353322,-1.535000,3.080000>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<21.323300,-1.535000,3.269544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.323300,-1.535000,4.076694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.323300,-1.535000,3.269544>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.323300,-1.535000,3.269544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.323300,-1.535000,4.076694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491678,-1.535000,4.076694>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<21.323300,-1.535000,4.076694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.323300,-1.535000,4.985453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.353322,-1.535000,5.174997>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<21.323300,-1.535000,4.985453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.353322,-1.535000,3.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.412622,-1.535000,2.897487>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<21.353322,-1.535000,3.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.353322,-1.535000,5.174997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.412622,-1.535000,5.357509>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<21.353322,-1.535000,5.174997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.412622,-1.535000,2.897487>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.499747,-1.535000,2.726500>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<21.412622,-1.535000,2.897487> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.412622,-1.535000,5.357509>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.499747,-1.535000,5.528497>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<21.412622,-1.535000,5.357509> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.499747,-1.535000,2.726500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.612547,-1.535000,2.571244>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<21.499747,-1.535000,2.726500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.499747,-1.535000,5.528497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.612547,-1.535000,5.683753>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<21.499747,-1.535000,5.528497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.602700,-1.535000,29.959209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.339209,-1.535000,29.222700>}
box{<0,0,-0.203200><1.041582,0.035000,0.203200> rotate<0,44.997030,0> translate<21.602700,-1.535000,29.959209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.602700,-1.535000,30.479981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.602700,-1.535000,29.959209>}
box{<0,0,-0.203200><0.520772,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.602700,-1.535000,29.959209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.602700,-1.535000,30.479981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.859966,-1.535000,30.479981>}
box{<0,0,-0.203200><1.257266,0.035000,0.203200> rotate<0,0.000000,0> translate<21.602700,-1.535000,30.479981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.602700,-1.535000,30.480013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.859966,-1.535000,30.480013>}
box{<0,0,-0.203200><1.257266,0.035000,0.203200> rotate<0,0.000000,0> translate<21.602700,-1.535000,30.480013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.602700,-1.535000,31.000788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.602700,-1.535000,30.480013>}
box{<0,0,-0.203200><0.520775,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.602700,-1.535000,30.480013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.602700,-1.535000,31.000788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.339209,-1.535000,31.737297>}
box{<0,0,-0.203200><1.041582,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.602700,-1.535000,31.000788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.612547,-1.535000,2.571244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.748244,-1.535000,2.435547>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<21.612547,-1.535000,2.571244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.612547,-1.535000,5.683753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.748244,-1.535000,5.819450>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.612547,-1.535000,5.683753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.738713,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.751047,-1.535000,27.199019>}
box{<0,0,-0.203200><0.032234,0.035000,0.203200> rotate<0,67.497881,0> translate<21.738713,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.738713,-1.535000,28.651197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.751047,-1.535000,28.680978>}
box{<0,0,-0.203200><0.032234,0.035000,0.203200> rotate<0,-67.497881,0> translate<21.738713,-1.535000,28.651197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.748244,-1.535000,2.435547>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.903500,-1.535000,2.322747>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<21.748244,-1.535000,2.435547> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.748244,-1.535000,5.819450>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.903500,-1.535000,5.932250>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<21.748244,-1.535000,5.819450> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.751047,-1.535000,27.199019>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.119019,-1.535000,26.831047>}
box{<0,0,-0.203200><0.520391,0.035000,0.203200> rotate<0,44.997030,0> translate<21.751047,-1.535000,27.199019> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.751047,-1.535000,28.680978>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.119019,-1.535000,29.048950>}
box{<0,0,-0.203200><0.520391,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.751047,-1.535000,28.680978> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.903500,-1.535000,2.322747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.074488,-1.535000,2.235622>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<21.903500,-1.535000,2.322747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.903500,-1.535000,5.932250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.074488,-1.535000,6.019375>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<21.903500,-1.535000,5.932250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.074488,-1.535000,2.235622>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.257000,-1.535000,2.176322>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,17.998271,0> translate<22.074488,-1.535000,2.235622> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.074488,-1.535000,6.019375>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.257000,-1.535000,6.078675>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-17.998271,0> translate<22.074488,-1.535000,6.019375> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.119019,-1.535000,26.831047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.148800,-1.535000,26.818713>}
box{<0,0,-0.203200><0.032234,0.035000,0.203200> rotate<0,22.496179,0> translate<22.119019,-1.535000,26.831047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.119019,-1.535000,29.048950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.538494,-1.535000,29.222700>}
box{<0,0,-0.203200><0.454036,0.035000,0.203200> rotate<0,-22.498255,0> translate<22.119019,-1.535000,29.048950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.148800,-1.535000,25.258531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.257072,-1.535000,24.997138>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,67.495725,0> translate<22.148800,-1.535000,25.258531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.148800,-1.535000,26.818713>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.148800,-1.535000,25.258531>}
box{<0,0,-0.203200><1.560181,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.148800,-1.535000,25.258531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.257000,-1.535000,2.176322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.446544,-1.535000,2.146300>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,8.999729,0> translate<22.257000,-1.535000,2.176322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.257000,-1.535000,6.078675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.446544,-1.535000,6.108697>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-8.999729,0> translate<22.257000,-1.535000,6.078675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.257072,-1.535000,24.997138>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.457138,-1.535000,24.797072>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,44.997030,0> translate<22.257072,-1.535000,24.997138> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.339209,-1.535000,29.222700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.538494,-1.535000,29.222700>}
box{<0,0,-0.203200><0.199284,0.035000,0.203200> rotate<0,0.000000,0> translate<22.339209,-1.535000,29.222700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.339209,-1.535000,31.737297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.859981,-1.535000,31.737297>}
box{<0,0,-0.203200><0.520772,0.035000,0.203200> rotate<0,0.000000,0> translate<22.339209,-1.535000,31.737297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.446544,-1.535000,2.146300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,2.146297>}
box{<0,0,-0.203200><0.045150,0.035000,0.203200> rotate<0,0.003965,0> translate<22.446544,-1.535000,2.146300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.446544,-1.535000,6.108697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,6.108697>}
box{<0,0,-0.203200><0.045150,0.035000,0.203200> rotate<0,0.000000,0> translate<22.446544,-1.535000,6.108697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.457138,-1.535000,24.797072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.718531,-1.535000,24.688800>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,22.498335,0> translate<22.457138,-1.535000,24.797072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491678,-1.535000,4.178300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491678,-1.535000,4.076694>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.491678,-1.535000,4.076694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,2.146297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,4.076678>}
box{<0,0,-0.203200><1.930381,0.035000,0.203200> rotate<0,90.000000,0> translate<22.491694,-1.535000,4.076678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,2.438400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<22.491694,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,2.844800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<22.491694,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,3.251200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<22.491694,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,3.657600>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<22.491694,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,4.064000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<22.491694,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,4.076678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,4.076678>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<22.491694,-1.535000,4.076678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,4.178319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,6.108697>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,90.000000,0> translate<22.491694,-1.535000,6.108697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,4.178319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,4.178319>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<22.491694,-1.535000,4.178319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,4.470400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<22.491694,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,4.876800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<22.491694,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,5.283200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<22.491694,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,5.689600>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<22.491694,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.491694,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,6.096000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<22.491694,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,2.146300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.638453,-1.535000,2.146300>}
box{<0,0,-0.203200><0.045153,0.035000,0.203200> rotate<0,0.000000,0> translate<22.593300,-1.535000,2.146300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,4.076678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,2.146300>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.593300,-1.535000,2.146300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,6.108697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,4.178319>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.593300,-1.535000,4.178319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593300,-1.535000,6.108697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.638453,-1.535000,6.108697>}
box{<0,0,-0.203200><0.045153,0.035000,0.203200> rotate<0,0.000000,0> translate<22.593300,-1.535000,6.108697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593319,-1.535000,4.076694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593319,-1.535000,4.178300>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,90.000000,0> translate<22.593319,-1.535000,4.178300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593319,-1.535000,4.076694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.761697,-1.535000,4.076694>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<22.593319,-1.535000,4.076694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.593319,-1.535000,4.178300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.761697,-1.535000,4.178300>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<22.593319,-1.535000,4.178300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.638453,-1.535000,2.146300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.827997,-1.535000,2.176322>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-8.999729,0> translate<22.638453,-1.535000,2.146300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.638453,-1.535000,6.108697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.827997,-1.535000,6.078675>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,8.999729,0> translate<22.638453,-1.535000,6.108697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.718531,-1.535000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,24.688800>}
box{<0,0,-0.203200><0.700269,0.035000,0.203200> rotate<0,0.000000,0> translate<22.718531,-1.535000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.718616,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.676584,-1.535000,6.096000>}
box{<0,0,-0.203200><1.957969,0.035000,0.203200> rotate<0,0.000000,0> translate<22.718616,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.827997,-1.535000,2.176322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.010509,-1.535000,2.235622>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-17.998271,0> translate<22.827997,-1.535000,2.176322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.827997,-1.535000,6.078675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.010509,-1.535000,6.019375>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,17.998271,0> translate<22.827997,-1.535000,6.078675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.859966,-1.535000,30.480013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.859966,-1.535000,30.479981>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.859966,-1.535000,30.479981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.859981,-1.535000,30.480031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.859981,-1.535000,31.737297>}
box{<0,0,-0.203200><1.257266,0.035000,0.203200> rotate<0,90.000000,0> translate<22.859981,-1.535000,31.737297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.859981,-1.535000,30.480031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860012,-1.535000,30.480031>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<22.859981,-1.535000,30.480031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.859981,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860012,-1.535000,30.886400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<22.859981,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.859981,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860012,-1.535000,31.292800>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<22.859981,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.859981,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860012,-1.535000,31.699200>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<22.859981,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860012,-1.535000,31.737297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860012,-1.535000,30.480031>}
box{<0,0,-0.203200><1.257266,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.860012,-1.535000,30.480031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860012,-1.535000,31.737297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.380788,-1.535000,31.737297>}
box{<0,0,-0.203200><0.520775,0.035000,0.203200> rotate<0,0.000000,0> translate<22.860012,-1.535000,31.737297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860031,-1.535000,30.479981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860031,-1.535000,30.480013>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,90.000000,0> translate<22.860031,-1.535000,30.480013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860031,-1.535000,30.479981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.117294,-1.535000,30.479981>}
box{<0,0,-0.203200><1.257262,0.035000,0.203200> rotate<0,0.000000,0> translate<22.860031,-1.535000,30.479981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860031,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.394216,-1.535000,30.480000>}
box{<0,0,-0.203200><1.534184,0.035000,0.203200> rotate<0,0.000000,0> translate<22.860031,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860031,-1.535000,30.480013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.117297,-1.535000,30.480013>}
box{<0,0,-0.203200><1.257266,0.035000,0.203200> rotate<0,0.000000,0> translate<22.860031,-1.535000,30.480013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.961600,-1.535000,35.076031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.646031,-1.535000,34.391600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<22.961600,-1.535000,35.076031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.961600,-1.535000,36.043966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.961600,-1.535000,35.076031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.961600,-1.535000,35.076031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.961600,-1.535000,36.043966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.646031,-1.535000,36.728397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.961600,-1.535000,36.043966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.010509,-1.535000,2.235622>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.181497,-1.535000,2.322747>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<23.010509,-1.535000,2.235622> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.010509,-1.535000,6.019375>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.181497,-1.535000,5.932250>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<23.010509,-1.535000,6.019375> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.181497,-1.535000,2.322747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.336753,-1.535000,2.435547>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<23.181497,-1.535000,2.322747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.181497,-1.535000,5.932250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.336753,-1.535000,5.819450>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<23.181497,-1.535000,5.932250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.336753,-1.535000,2.435547>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.472450,-1.535000,2.571244>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.336753,-1.535000,2.435547> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.336753,-1.535000,5.819450>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.472450,-1.535000,5.683753>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<23.336753,-1.535000,5.819450> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.339606,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.213547,-1.535000,2.438400>}
box{<0,0,-0.203200><0.873941,0.035000,0.203200> rotate<0,0.000000,0> translate<23.339606,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.380788,-1.535000,31.737297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.117297,-1.535000,31.000788>}
box{<0,0,-0.203200><1.041582,0.035000,0.203200> rotate<0,44.997030,0> translate<23.380788,-1.535000,31.737297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418800,-1.535000,9.601197>}
box{<0,0,-0.203200><15.087603,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.418800,-1.535000,9.601197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.418884,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.613416,-1.535000,31.699200>}
box{<0,0,-0.203200><2.194531,0.035000,0.203200> rotate<0,0.000000,0> translate<23.418884,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.466603,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.086550,-1.535000,5.689600>}
box{<0,0,-0.203200><0.619947,0.035000,0.203200> rotate<0,0.000000,0> translate<23.466603,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.472450,-1.535000,2.571244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.585250,-1.535000,2.726500>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<23.472450,-1.535000,2.571244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.472450,-1.535000,5.683753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.585250,-1.535000,5.528497>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<23.472450,-1.535000,5.683753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.571197,-1.535000,26.176059>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.571197,-1.535000,26.818713>}
box{<0,0,-0.203200><0.642653,0.035000,0.203200> rotate<0,90.000000,0> translate<23.571197,-1.535000,26.818713> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.571197,-1.535000,26.176059>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.963531,-1.535000,26.568397>}
box{<0,0,-0.203200><0.554847,0.035000,0.203200> rotate<0,-44.997258,0> translate<23.571197,-1.535000,26.176059> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.571197,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.811138,-1.535000,26.416000>}
box{<0,0,-0.203200><0.239941,0.035000,0.203200> rotate<0,0.000000,0> translate<23.571197,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.571197,-1.535000,26.818713>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.600978,-1.535000,26.831047>}
box{<0,0,-0.203200><0.032234,0.035000,0.203200> rotate<0,-22.496179,0> translate<23.571197,-1.535000,26.818713> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.580100,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,26.822400>}
box{<0,0,-0.203200><2.378700,0.035000,0.203200> rotate<0,0.000000,0> translate<23.580100,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.585250,-1.535000,2.726500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.672375,-1.535000,2.897487>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<23.585250,-1.535000,2.726500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.585250,-1.535000,5.528497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.672375,-1.535000,5.357509>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<23.585250,-1.535000,5.528497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.600978,-1.535000,26.831047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.968950,-1.535000,27.199019>}
box{<0,0,-0.203200><0.520391,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.600978,-1.535000,26.831047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.645528,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.923541,-1.535000,2.844800>}
box{<0,0,-0.203200><0.278012,0.035000,0.203200> rotate<0,0.000000,0> translate<23.645528,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.646031,-1.535000,34.391600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.292609,-1.535000,34.391600>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,0.000000,0> translate<23.646031,-1.535000,34.391600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.646031,-1.535000,36.728397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.613966,-1.535000,36.728397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<23.646031,-1.535000,36.728397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.672375,-1.535000,2.897487>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.731675,-1.535000,3.080000>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<23.672375,-1.535000,2.897487> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.672375,-1.535000,5.357509>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.731675,-1.535000,5.174997>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<23.672375,-1.535000,5.357509> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.696522,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.870941,-1.535000,5.283200>}
box{<0,0,-0.203200><0.174419,0.035000,0.203200> rotate<0,0.000000,0> translate<23.696522,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.731675,-1.535000,3.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.761697,-1.535000,3.269544>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<23.731675,-1.535000,3.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.731675,-1.535000,5.174997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.761697,-1.535000,4.985453>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<23.731675,-1.535000,5.174997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.758791,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.812500,-1.535000,3.251200>}
box{<0,0,-0.203200><0.053709,0.035000,0.203200> rotate<0,0.000000,0> translate<23.758791,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.761697,-1.535000,3.269544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.761697,-1.535000,4.076694>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,90.000000,0> translate<23.761697,-1.535000,4.076694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.761697,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.812500,-1.535000,3.657600>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<23.761697,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.761697,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.812500,-1.535000,4.064000>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<23.761697,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.761697,-1.535000,4.178300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.761697,-1.535000,4.985453>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,90.000000,0> translate<23.761697,-1.535000,4.985453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.761697,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.812500,-1.535000,4.470400>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<23.761697,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.761697,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.812500,-1.535000,4.876800>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<23.761697,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.812500,-1.535000,3.112878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.005847,-1.535000,2.646100>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<23.812500,-1.535000,3.112878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.812500,-1.535000,5.142119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.812500,-1.535000,3.112878>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.812500,-1.535000,3.112878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.812500,-1.535000,5.142119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.005847,-1.535000,5.608897>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<23.812500,-1.535000,5.142119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.825284,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.207016,-1.535000,31.292800>}
box{<0,0,-0.203200><1.381731,0.035000,0.203200> rotate<0,0.000000,0> translate<23.825284,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.963531,-1.535000,26.568397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.931466,-1.535000,26.568397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<23.963531,-1.535000,26.568397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.968950,-1.535000,27.199019>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.168097,-1.535000,27.679800>}
box{<0,0,-0.203200><0.520394,0.035000,0.203200> rotate<0,-67.495468,0> translate<23.968950,-1.535000,27.199019> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.981284,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,27.228800>}
box{<0,0,-0.203200><1.977516,0.035000,0.203200> rotate<0,0.000000,0> translate<23.981284,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.005847,-1.535000,2.646100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.363100,-1.535000,2.288847>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<24.005847,-1.535000,2.646100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.005847,-1.535000,5.608897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.363100,-1.535000,5.966150>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.005847,-1.535000,5.608897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.117294,-1.535000,30.203078>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.117294,-1.535000,30.479981>}
box{<0,0,-0.203200><0.276903,0.035000,0.203200> rotate<0,90.000000,0> translate<24.117294,-1.535000,30.479981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.117294,-1.535000,30.203078>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.312500,-1.535000,32.398284>}
box{<0,0,-0.203200><3.104490,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.117294,-1.535000,30.203078> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.117297,-1.535000,30.480013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.117297,-1.535000,31.000788>}
box{<0,0,-0.203200><0.520775,0.035000,0.203200> rotate<0,90.000000,0> translate<24.117297,-1.535000,31.000788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.117297,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.800616,-1.535000,30.886400>}
box{<0,0,-0.203200><0.683319,0.035000,0.203200> rotate<0,0.000000,0> translate<24.117297,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.149622,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,27.635200>}
box{<0,0,-0.203200><1.809178,0.035000,0.203200> rotate<0,0.000000,0> translate<24.149622,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.155759,-1.535000,28.229975>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.168097,-1.535000,28.200197>}
box{<0,0,-0.203200><0.032233,0.035000,0.203200> rotate<0,67.490624,0> translate<24.155759,-1.535000,28.229975> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.155759,-1.535000,28.229975>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.777387,-1.535000,31.851600>}
box{<0,0,-0.203200><5.121753,0.035000,0.203200> rotate<0,-44.997005,0> translate<24.155759,-1.535000,28.229975> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.168097,-1.535000,27.679800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.168097,-1.535000,28.200197>}
box{<0,0,-0.203200><0.520397,0.035000,0.203200> rotate<0,90.000000,0> translate<24.168097,-1.535000,28.200197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.168097,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,28.041600>}
box{<0,0,-0.203200><1.790703,0.035000,0.203200> rotate<0,0.000000,0> translate<24.168097,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.258628,-1.535000,8.178800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,7.845903>}
box{<0,0,-0.203200><0.670977,0.035000,0.203200> rotate<0,29.742819,0> translate<24.258628,-1.535000,8.178800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.292609,-1.535000,34.391600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.067072,-1.535000,32.617137>}
box{<0,0,-0.203200><2.509469,0.035000,0.203200> rotate<0,44.997030,0> translate<24.292609,-1.535000,34.391600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.363100,-1.535000,2.288847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.829878,-1.535000,2.095500>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<24.363100,-1.535000,2.288847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.363100,-1.535000,5.966150>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.829878,-1.535000,6.159497>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<24.363100,-1.535000,5.966150> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.373784,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.172213,-1.535000,28.448000>}
box{<0,0,-0.203200><1.798428,0.035000,0.203200> rotate<0,0.000000,0> translate<24.373784,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.613966,-1.535000,36.728397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.298397,-1.535000,36.043966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<24.613966,-1.535000,36.728397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.766362,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.573634,-1.535000,36.576000>}
box{<0,0,-0.203200><3.807272,0.035000,0.203200> rotate<0,0.000000,0> translate<24.766362,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.780184,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.202038,-1.535000,28.854400>}
box{<0,0,-0.203200><2.421853,0.035000,0.203200> rotate<0,0.000000,0> translate<24.780184,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.829878,-1.535000,2.095500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.335119,-1.535000,2.095500>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,0.000000,0> translate<24.829878,-1.535000,2.095500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.829878,-1.535000,6.159497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.335119,-1.535000,6.159497>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,0.000000,0> translate<24.829878,-1.535000,6.159497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,9.496719>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,24.231600>}
box{<0,0,-0.203200><14.734881,0.035000,0.203200> rotate<0,90.000000,0> translate<24.841197,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,9.496719>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.850359,-1.535000,9.492925>}
box{<0,0,-0.203200><0.009917,0.035000,0.203200> rotate<0,22.490606,0> translate<24.841197,-1.535000,9.496719> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.913266,-1.535000,9.753600>}
box{<0,0,-0.203200><0.072069,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,10.160000>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.913272,-1.535000,10.566400>}
box{<0,0,-0.203200><0.072075,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.170034,-1.535000,10.972800>}
box{<0,0,-0.203200><0.328837,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,11.379200>}
box{<0,0,-0.203200><6.515103,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.271631,-1.535000,11.785600>}
box{<0,0,-0.203200><0.430434,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.955350,-1.535000,12.192000>}
box{<0,0,-0.203200><0.114153,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,12.598400>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.871188,-1.535000,13.004800>}
box{<0,0,-0.203200><0.029991,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.068434,-1.535000,13.411200>}
box{<0,0,-0.203200><0.227238,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654556,-1.535000,13.817600>}
box{<0,0,-0.203200><0.813359,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.409263,-1.535000,14.224000>}
box{<0,0,-0.203200><0.568066,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.997434,-1.535000,14.630400>}
box{<0,0,-0.203200><0.156237,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,15.036800>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,15.443200>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.997441,-1.535000,15.849600>}
box{<0,0,-0.203200><0.156244,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.409272,-1.535000,16.256000>}
box{<0,0,-0.203200><0.568075,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654544,-1.535000,16.662400>}
box{<0,0,-0.203200><0.813347,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.068431,-1.535000,17.068800>}
box{<0,0,-0.203200><0.227234,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.871181,-1.535000,17.475200>}
box{<0,0,-0.203200><0.029984,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,17.881600>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.955356,-1.535000,18.288000>}
box{<0,0,-0.203200><0.114159,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.271634,-1.535000,18.694400>}
box{<0,0,-0.203200><0.430438,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.660234,-1.535000,19.100800>}
box{<0,0,-0.203200><4.819038,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.170031,-1.535000,19.507200>}
box{<0,0,-0.203200><0.328834,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.913266,-1.535000,19.913600>}
box{<0,0,-0.203200><0.072069,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,20.320000>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.913272,-1.535000,20.726400>}
box{<0,0,-0.203200><0.072075,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.170034,-1.535000,21.132800>}
box{<0,0,-0.203200><0.328837,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.660247,-1.535000,21.539200>}
box{<0,0,-0.203200><4.819050,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.271631,-1.535000,21.945600>}
box{<0,0,-0.203200><0.430434,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.955350,-1.535000,22.352000>}
box{<0,0,-0.203200><0.114153,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,22.758400>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.871188,-1.535000,23.164800>}
box{<0,0,-0.203200><0.029991,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.068434,-1.535000,23.571200>}
box{<0,0,-0.203200><0.227238,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654556,-1.535000,23.977600>}
box{<0,0,-0.203200><0.813359,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841197,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.931466,-1.535000,24.231600>}
box{<0,0,-0.203200><0.090269,0.035000,0.203200> rotate<0,0.000000,0> translate<24.841197,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,7.387588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,6.958153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<24.841200,-1.535000,7.387588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,7.845903>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,7.387588>}
box{<0,0,-0.203200><0.458316,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.841200,-1.535000,7.387588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,9.927588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,9.498153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<24.841200,-1.535000,9.927588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,10.392409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,9.927588>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.841200,-1.535000,9.927588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,10.392409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,10.821844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<24.841200,-1.535000,10.392409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,12.467588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,12.038153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<24.841200,-1.535000,12.467588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,12.932409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,12.467588>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.841200,-1.535000,12.467588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,12.932409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,13.361844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<24.841200,-1.535000,12.932409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,15.007588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,14.578153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<24.841200,-1.535000,15.007588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,15.472409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,15.007588>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.841200,-1.535000,15.007588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,15.472409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,15.901844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<24.841200,-1.535000,15.472409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,17.547588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,17.118153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<24.841200,-1.535000,17.547588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,18.012409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,17.547588>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.841200,-1.535000,17.547588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,18.012409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,18.441844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<24.841200,-1.535000,18.012409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,20.087588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,19.658153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<24.841200,-1.535000,20.087588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,20.552409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,20.087588>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.841200,-1.535000,20.087588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,20.552409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,20.981844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<24.841200,-1.535000,20.552409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,22.627588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,22.198153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<24.841200,-1.535000,22.627588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,23.092409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,22.627588>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.841200,-1.535000,22.627588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.841200,-1.535000,23.092409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,23.521844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<24.841200,-1.535000,23.092409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.850359,-1.535000,9.492925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.883047,-1.535000,9.460234>}
box{<0,0,-0.203200><0.046229,0.035000,0.203200> rotate<0,44.999769,0> translate<24.850359,-1.535000,9.492925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.883047,-1.535000,9.460234>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.288934,-1.535000,9.228300>}
box{<0,0,-0.203200><0.467481,0.035000,0.203200> rotate<0,29.742776,0> translate<24.883047,-1.535000,9.460234> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.931466,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.615897,-1.535000,24.916031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.931466,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.931466,-1.535000,26.568397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.615897,-1.535000,25.883966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<24.931466,-1.535000,26.568397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,6.958153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,6.629478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<25.019078,-1.535000,6.958153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,9.498153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.288934,-1.535000,9.228300>}
box{<0,0,-0.203200><0.381632,0.035000,0.203200> rotate<0,44.996698,0> translate<25.019078,-1.535000,9.498153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,10.821844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,11.150519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.019078,-1.535000,10.821844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,12.038153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,11.709478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<25.019078,-1.535000,12.038153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,13.361844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,13.690519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.019078,-1.535000,13.361844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,14.578153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,14.249478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<25.019078,-1.535000,14.578153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,15.901844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,16.230519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.019078,-1.535000,15.901844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,17.118153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,16.789478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<25.019078,-1.535000,17.118153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,18.441844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,18.770519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.019078,-1.535000,18.441844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,19.658153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,19.329478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<25.019078,-1.535000,19.658153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,20.981844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,21.310519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.019078,-1.535000,20.981844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,22.198153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,21.869478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<25.019078,-1.535000,22.198153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.019078,-1.535000,23.521844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,23.850519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.019078,-1.535000,23.521844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.080859,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.170031,-1.535000,9.347200>}
box{<0,0,-0.203200><0.089172,0.035000,0.203200> rotate<0,0.000000,0> translate<25.080859,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.083863,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,26.416000>}
box{<0,0,-0.203200><0.874937,0.035000,0.203200> rotate<0,0.000000,0> translate<25.083863,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.083866,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,24.384000>}
box{<0,0,-0.203200><0.874934,0.035000,0.203200> rotate<0,0.000000,0> translate<25.083866,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.172763,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.167234,-1.535000,36.169600>}
box{<0,0,-0.203200><2.994472,0.035000,0.203200> rotate<0,0.000000,0> translate<25.172763,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.186584,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,29.260800>}
box{<0,0,-0.203200><4.582216,0.035000,0.203200> rotate<0,0.000000,0> translate<25.186584,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.298397,-1.535000,35.397388>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.298397,-1.535000,36.043966>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,90.000000,0> translate<25.298397,-1.535000,36.043966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.298397,-1.535000,35.397388>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.964588,-1.535000,33.731197>}
box{<0,0,-0.203200><2.356349,0.035000,0.203200> rotate<0,44.997030,0> translate<25.298397,-1.535000,35.397388> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.298397,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.041600,-1.535000,35.763200>}
box{<0,0,-0.203200><2.743203,0.035000,0.203200> rotate<0,0.000000,0> translate<25.298397,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.335119,-1.535000,2.095500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.801897,-1.535000,2.288847>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<25.335119,-1.535000,2.095500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.335119,-1.535000,6.159497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.801897,-1.535000,5.966150>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<25.335119,-1.535000,6.159497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.338984,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.041600,-1.535000,35.356800>}
box{<0,0,-0.203200><2.702616,0.035000,0.203200> rotate<0,0.000000,0> translate<25.338984,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,6.629478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,6.451600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<25.347753,-1.535000,6.629478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,11.150519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,11.328397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<25.347753,-1.535000,11.150519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,11.709478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,11.531600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<25.347753,-1.535000,11.709478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,13.690519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,13.868397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<25.347753,-1.535000,13.690519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,14.249478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,14.071600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<25.347753,-1.535000,14.249478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,16.230519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,16.408397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<25.347753,-1.535000,16.230519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,16.789478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,16.611600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<25.347753,-1.535000,16.789478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,18.770519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,18.948397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<25.347753,-1.535000,18.770519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,19.329478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,19.151600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<25.347753,-1.535000,19.329478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,21.310519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,21.488397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<25.347753,-1.535000,21.310519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,21.869478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,21.691600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<25.347753,-1.535000,21.869478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.347753,-1.535000,23.850519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,24.028397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<25.347753,-1.535000,23.850519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.488416,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.216584,-1.535000,6.096000>}
box{<0,0,-0.203200><1.728169,0.035000,0.203200> rotate<0,0.000000,0> translate<25.488416,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.490263,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,26.009600>}
box{<0,0,-0.203200><0.468538,0.035000,0.203200> rotate<0,0.000000,0> translate<25.490263,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.490266,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,24.790400>}
box{<0,0,-0.203200><0.468534,0.035000,0.203200> rotate<0,0.000000,0> translate<25.490266,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.508103,-1.535000,9.103063>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,8.991600>}
box{<0,0,-0.203200><0.291256,0.035000,0.203200> rotate<0,22.499261,0> translate<25.508103,-1.535000,9.103063> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.508103,-1.535000,9.103063>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.058769,-1.535000,8.788397>}
box{<0,0,-0.203200><0.634230,0.035000,0.203200> rotate<0,29.742883,0> translate<25.508103,-1.535000,9.103063> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.592984,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,29.667200>}
box{<0,0,-0.203200><4.175816,0.035000,0.203200> rotate<0,0.000000,0> translate<25.592984,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.615897,-1.535000,24.916031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.615897,-1.535000,25.883966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<25.615897,-1.535000,25.883966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.615897,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,25.196800>}
box{<0,0,-0.203200><0.342903,0.035000,0.203200> rotate<0,0.000000,0> translate<25.615897,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.615897,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,25.603200>}
box{<0,0,-0.203200><0.342903,0.035000,0.203200> rotate<0,0.000000,0> translate<25.615897,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.745384,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.167231,-1.535000,34.950400>}
box{<0,0,-0.203200><2.421847,0.035000,0.203200> rotate<0,0.000000,0> translate<25.745384,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,6.451600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,6.451600>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<25.777188,-1.535000,6.451600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,8.991600>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<25.777188,-1.535000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,11.328397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,11.328397>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<25.777188,-1.535000,11.328397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,11.531600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,11.531600>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<25.777188,-1.535000,11.531600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,13.868397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,13.868397>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<25.777188,-1.535000,13.868397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,14.071600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,14.071600>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<25.777188,-1.535000,14.071600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,16.408397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.140466,-1.535000,16.408397>}
box{<0,0,-0.203200><1.363278,0.035000,0.203200> rotate<0,0.000000,0> translate<25.777188,-1.535000,16.408397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,16.611600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.445272,-1.535000,16.611600>}
box{<0,0,-0.203200><1.668084,0.035000,0.203200> rotate<0,0.000000,0> translate<25.777188,-1.535000,16.611600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,18.948397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,18.948397>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<25.777188,-1.535000,18.948397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,19.151600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,19.151600>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<25.777188,-1.535000,19.151600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,21.488397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,21.488397>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<25.777188,-1.535000,21.488397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,21.691600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,21.691600>}
box{<0,0,-0.203200><1.785622,0.035000,0.203200> rotate<0,0.000000,0> translate<25.777188,-1.535000,21.691600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.777188,-1.535000,24.028397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,24.028397>}
box{<0,0,-0.203200><0.181612,0.035000,0.203200> rotate<0,0.000000,0> translate<25.777188,-1.535000,24.028397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.792066,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,8.940800>}
box{<0,0,-0.203200><2.706734,0.035000,0.203200> rotate<0,0.000000,0> translate<25.792066,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.801897,-1.535000,2.288847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.159150,-1.535000,2.646100>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.801897,-1.535000,2.288847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.801897,-1.535000,5.966150>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.159150,-1.535000,5.608897>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<25.801897,-1.535000,5.966150> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.951450,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.753547,-1.535000,2.438400>}
box{<0,0,-0.203200><0.802097,0.035000,0.203200> rotate<0,0.000000,0> translate<25.951450,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,28.081466>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,24.028397>}
box{<0,0,-0.203200><4.053069,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.958800,-1.535000,24.028397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.958800,-1.535000,28.081466>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.067072,-1.535000,28.342859>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,-67.495725,0> translate<25.958800,-1.535000,28.081466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.999384,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.599031,-1.535000,30.073600>}
box{<0,0,-0.203200><2.599647,0.035000,0.203200> rotate<0,0.000000,0> translate<25.999384,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.058769,-1.535000,8.788397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,8.788397>}
box{<0,0,-0.203200><1.504041,0.035000,0.203200> rotate<0,0.000000,0> translate<26.058769,-1.535000,8.788397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.067072,-1.535000,28.342859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.267138,-1.535000,28.542925>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.067072,-1.535000,28.342859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.067072,-1.535000,32.617137>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.267138,-1.535000,32.417072>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,44.997030,0> translate<26.067072,-1.535000,32.617137> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.078447,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.626550,-1.535000,5.689600>}
box{<0,0,-0.203200><0.548103,0.035000,0.203200> rotate<0,0.000000,0> translate<26.078447,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.151784,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,34.544000>}
box{<0,0,-0.203200><2.347016,0.035000,0.203200> rotate<0,0.000000,0> translate<26.151784,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.159150,-1.535000,2.646100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352497,-1.535000,3.112878>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<26.159150,-1.535000,2.646100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.159150,-1.535000,5.608897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352497,-1.535000,5.142119>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<26.159150,-1.535000,5.608897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.241453,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.463541,-1.535000,2.844800>}
box{<0,0,-0.203200><0.222088,0.035000,0.203200> rotate<0,0.000000,0> translate<26.241453,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.267138,-1.535000,28.542925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.528531,-1.535000,28.651197>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,-22.498335,0> translate<26.267138,-1.535000,28.542925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.267138,-1.535000,32.417072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.312500,-1.535000,32.398284>}
box{<0,0,-0.203200><0.049099,0.035000,0.203200> rotate<0,22.496076,0> translate<26.267138,-1.535000,32.417072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.294059,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.410941,-1.535000,5.283200>}
box{<0,0,-0.203200><0.116881,0.035000,0.203200> rotate<0,0.000000,0> translate<26.294059,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352497,-1.535000,3.112878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352497,-1.535000,5.142119>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,90.000000,0> translate<26.352497,-1.535000,5.142119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352497,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352500,-1.535000,3.251200>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<26.352497,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352497,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352500,-1.535000,3.657600>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<26.352497,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352497,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352500,-1.535000,4.064000>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<26.352497,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352497,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352500,-1.535000,4.470400>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<26.352497,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352497,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352500,-1.535000,4.876800>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<26.352497,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352500,-1.535000,3.112878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.545847,-1.535000,2.646100>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<26.352500,-1.535000,3.112878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352500,-1.535000,5.142119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352500,-1.535000,3.112878>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.352500,-1.535000,3.112878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.352500,-1.535000,5.142119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.545847,-1.535000,5.608897>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<26.352500,-1.535000,5.142119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.405784,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.192631,-1.535000,30.480000>}
box{<0,0,-0.203200><1.786847,0.035000,0.203200> rotate<0,0.000000,0> translate<26.405784,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.528531,-1.535000,28.651197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.998834,-1.535000,28.651197>}
box{<0,0,-0.203200><0.470303,0.035000,0.203200> rotate<0,0.000000,0> translate<26.528531,-1.535000,28.651197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.545847,-1.535000,2.646100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.903100,-1.535000,2.288847>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<26.545847,-1.535000,2.646100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.545847,-1.535000,5.608897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.903100,-1.535000,5.966150>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.545847,-1.535000,5.608897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.558184,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.405234,-1.535000,34.137600>}
box{<0,0,-0.203200><0.847050,0.035000,0.203200> rotate<0,0.000000,0> translate<26.558184,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.812184,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.041600,-1.535000,30.886400>}
box{<0,0,-0.203200><1.229416,0.035000,0.203200> rotate<0,0.000000,0> translate<26.812184,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.903100,-1.535000,2.288847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.369878,-1.535000,2.095500>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<26.903100,-1.535000,2.288847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.903100,-1.535000,5.966150>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.369878,-1.535000,6.159497>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<26.903100,-1.535000,5.966150> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.964584,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.998834,-1.535000,33.731200>}
box{<0,0,-0.203200><0.034250,0.035000,0.203200> rotate<0,0.000000,0> translate<26.964584,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.964588,-1.535000,33.731197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.998831,-1.535000,33.731197>}
box{<0,0,-0.203200><0.034244,0.035000,0.203200> rotate<0,0.000000,0> translate<26.964588,-1.535000,33.731197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.998831,-1.535000,33.731197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.456031,-1.535000,34.188397>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.998831,-1.535000,33.731197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.998834,-1.535000,28.651197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.456031,-1.535000,29.108397>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.997226,0> translate<26.998834,-1.535000,28.651197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.140466,-1.535000,16.408397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.445272,-1.535000,16.611600>}
box{<0,0,-0.203200><0.366331,0.035000,0.203200> rotate<0,-33.687709,0> translate<27.140466,-1.535000,16.408397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.218584,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.041600,-1.535000,31.292800>}
box{<0,0,-0.203200><0.823016,0.035000,0.203200> rotate<0,0.000000,0> translate<27.218584,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.369878,-1.535000,2.095500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.875119,-1.535000,2.095500>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,0.000000,0> translate<27.369878,-1.535000,2.095500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.369878,-1.535000,6.159497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.875119,-1.535000,6.159497>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,0.000000,0> translate<27.369878,-1.535000,6.159497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.381197,-1.535000,24.028397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.381197,-1.535000,26.846438>}
box{<0,0,-0.203200><2.818041,0.035000,0.203200> rotate<0,90.000000,0> translate<27.381197,-1.535000,26.846438> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.381197,-1.535000,24.028397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,24.028397>}
box{<0,0,-0.203200><0.181612,0.035000,0.203200> rotate<0,0.000000,0> translate<27.381197,-1.535000,24.028397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.381197,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,24.384000>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<27.381197,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.381197,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,24.790400>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<27.381197,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.381197,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,25.196800>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<27.381197,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.381197,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,25.603200>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<27.381197,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.381197,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,26.009600>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<27.381197,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.381197,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,26.416000>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<27.381197,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.381197,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.405231,-1.535000,26.822400>}
box{<0,0,-0.203200><0.024034,0.035000,0.203200> rotate<0,0.000000,0> translate<27.381197,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.381197,-1.535000,26.846438>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.456031,-1.535000,26.771600>}
box{<0,0,-0.203200><0.105834,0.035000,0.203200> rotate<0,44.998226,0> translate<27.381197,-1.535000,26.846438> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.456031,-1.535000,26.771600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.423966,-1.535000,26.771600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<27.456031,-1.535000,26.771600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.456031,-1.535000,29.108397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.423966,-1.535000,29.108397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<27.456031,-1.535000,29.108397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.456031,-1.535000,34.188397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.423966,-1.535000,34.188397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<27.456031,-1.535000,34.188397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,6.451600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,6.629478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<27.562809,-1.535000,6.451600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,8.788397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,8.610519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<27.562809,-1.535000,8.788397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,9.169478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<27.562809,-1.535000,8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,11.328397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,11.150519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<27.562809,-1.535000,11.328397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,11.531600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,11.709478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<27.562809,-1.535000,11.531600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,13.868397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,13.690519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<27.562809,-1.535000,13.868397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,14.071600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,14.249478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<27.562809,-1.535000,14.071600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,18.948397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,18.770519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<27.562809,-1.535000,18.948397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,19.151600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,19.329478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<27.562809,-1.535000,19.151600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,21.488397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,21.310519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<27.562809,-1.535000,21.488397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,21.691600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,21.869478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<27.562809,-1.535000,21.691600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.562809,-1.535000,24.028397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,23.850519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<27.562809,-1.535000,24.028397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.624984,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.141838,-1.535000,31.699200>}
box{<0,0,-0.203200><0.516853,0.035000,0.203200> rotate<0,0.000000,0> translate<27.624984,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.685444,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,13.817600>}
box{<0,0,-0.203200><7.595356,0.035000,0.203200> rotate<0,0.000000,0> translate<27.685444,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.685444,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.414963,-1.535000,23.977600>}
box{<0,0,-0.203200><1.729519,0.035000,0.203200> rotate<0,0.000000,0> translate<27.685444,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.685450,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.167144,-1.535000,6.502400>}
box{<0,0,-0.203200><0.481694,0.035000,0.203200> rotate<0,0.000000,0> translate<27.685450,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.777387,-1.535000,31.851600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.294238,-1.535000,31.851600>}
box{<0,0,-0.203200><0.516850,0.035000,0.203200> rotate<0,0.000000,0> translate<27.777387,-1.535000,31.851600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.875119,-1.535000,2.095500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.341897,-1.535000,2.288847>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<27.875119,-1.535000,2.095500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.875119,-1.535000,6.159497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.888413,-1.535000,6.153988>}
box{<0,0,-0.203200><0.014390,0.035000,0.203200> rotate<0,22.509268,0> translate<27.875119,-1.535000,6.159497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.888413,-1.535000,6.153988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,6.916972>}
box{<0,0,-0.203200><0.977097,0.035000,0.203200> rotate<0,-51.336803,0> translate<27.888413,-1.535000,6.153988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.930731,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.359675,-1.535000,14.224000>}
box{<0,0,-0.203200><1.428944,0.035000,0.203200> rotate<0,0.000000,0> translate<27.930731,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,6.629478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.320919,-1.535000,6.958153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.992244,-1.535000,6.629478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,8.610519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.320919,-1.535000,8.281844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<27.992244,-1.535000,8.610519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,9.169478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,9.448800>}
box{<0,0,-0.203200><0.395019,0.035000,0.203200> rotate<0,-44.997351,0> translate<27.992244,-1.535000,9.169478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,11.150519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,10.871197>}
box{<0,0,-0.203200><0.395019,0.035000,0.203200> rotate<0,44.997351,0> translate<27.992244,-1.535000,11.150519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,11.709478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,11.988800>}
box{<0,0,-0.203200><0.395019,0.035000,0.203200> rotate<0,-44.997351,0> translate<27.992244,-1.535000,11.709478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,13.690519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,13.411197>}
box{<0,0,-0.203200><0.395019,0.035000,0.203200> rotate<0,44.997351,0> translate<27.992244,-1.535000,13.690519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,14.249478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.320919,-1.535000,14.578153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.992244,-1.535000,14.249478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,18.770519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271566,-1.535000,18.491197>}
box{<0,0,-0.203200><0.395021,0.035000,0.203200> rotate<0,44.997030,0> translate<27.992244,-1.535000,18.770519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,19.329478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,19.608800>}
box{<0,0,-0.203200><0.395019,0.035000,0.203200> rotate<0,-44.997351,0> translate<27.992244,-1.535000,19.329478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,21.310519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,21.031197>}
box{<0,0,-0.203200><0.395019,0.035000,0.203200> rotate<0,44.997351,0> translate<27.992244,-1.535000,21.310519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,21.869478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.320919,-1.535000,22.198153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.992244,-1.535000,21.869478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.992244,-1.535000,23.850519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.320919,-1.535000,23.521844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<27.992244,-1.535000,23.850519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.041600,-1.535000,30.631031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.726031,-1.535000,29.946600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<28.041600,-1.535000,30.631031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.041600,-1.535000,31.598966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.041600,-1.535000,30.631031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.041600,-1.535000,30.631031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.041600,-1.535000,31.598966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.294238,-1.535000,31.851600>}
box{<0,0,-0.203200><0.357281,0.035000,0.203200> rotate<0,-44.996676,0> translate<28.041600,-1.535000,31.598966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.041600,-1.535000,35.076031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,34.618834>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.996834,0> translate<28.041600,-1.535000,35.076031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.041600,-1.535000,36.043966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.041600,-1.535000,35.076031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.041600,-1.535000,35.076031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.041600,-1.535000,36.043966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.726031,-1.535000,36.728397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.041600,-1.535000,36.043966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.068363,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,8.534400>}
box{<0,0,-0.203200><0.430438,0.035000,0.203200> rotate<0,0.000000,0> translate<28.068363,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.068363,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,11.785600>}
box{<0,0,-0.203200><3.287937,0.035000,0.203200> rotate<0,0.000000,0> translate<28.068363,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.068363,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.153850,-1.535000,18.694400>}
box{<0,0,-0.203200><1.085487,0.035000,0.203200> rotate<0,0.000000,0> translate<28.068363,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.068366,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.153847,-1.535000,21.945600>}
box{<0,0,-0.203200><1.085481,0.035000,0.203200> rotate<0,0.000000,0> translate<28.068366,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.169963,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,9.347200>}
box{<0,0,-0.203200><0.328838,0.035000,0.203200> rotate<0,0.000000,0> translate<28.169963,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.169963,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,10.972800>}
box{<0,0,-0.203200><3.186338,0.035000,0.203200> rotate<0,0.000000,0> translate<28.169963,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.169963,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.052247,-1.535000,19.507200>}
box{<0,0,-0.203200><0.882284,0.035000,0.203200> rotate<0,0.000000,0> translate<28.169963,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.169963,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.052250,-1.535000,21.132800>}
box{<0,0,-0.203200><0.882288,0.035000,0.203200> rotate<0,0.000000,0> translate<28.169963,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,9.448800>}
box{<0,0,-0.203200><0.227238,0.035000,0.203200> rotate<0,0.000000,0> translate<28.271563,-1.535000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,10.871197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.351466,-1.535000,10.871197>}
box{<0,0,-0.203200><1.079903,0.035000,0.203200> rotate<0,0.000000,0> translate<28.271563,-1.535000,10.871197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,11.988800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,11.988800>}
box{<0,0,-0.203200><3.084737,0.035000,0.203200> rotate<0,0.000000,0> translate<28.271563,-1.535000,11.988800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,13.411197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.208966,-1.535000,13.411197>}
box{<0,0,-0.203200><3.937403,0.035000,0.203200> rotate<0,0.000000,0> translate<28.271563,-1.535000,13.411197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,13.411200>}
box{<0,0,-0.203200><7.009237,0.035000,0.203200> rotate<0,0.000000,0> translate<28.271563,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,19.608800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.955450,-1.535000,19.608800>}
box{<0,0,-0.203200><0.683888,0.035000,0.203200> rotate<0,0.000000,0> translate<28.271563,-1.535000,19.608800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,21.031197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.955450,-1.535000,21.031197>}
box{<0,0,-0.203200><0.683888,0.035000,0.203200> rotate<0,0.000000,0> translate<28.271563,-1.535000,21.031197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271563,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.955453,-1.535000,23.571200>}
box{<0,0,-0.203200><0.683891,0.035000,0.203200> rotate<0,0.000000,0> translate<28.271563,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271566,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.492263,-1.535000,6.908800>}
box{<0,0,-0.203200><0.220697,0.035000,0.203200> rotate<0,0.000000,0> translate<28.271566,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.271566,-1.535000,18.491197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.955450,-1.535000,18.491197>}
box{<0,0,-0.203200><0.683884,0.035000,0.203200> rotate<0,0.000000,0> translate<28.271566,-1.535000,18.491197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.320919,-1.535000,6.958153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,7.387588>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<28.320919,-1.535000,6.958153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.320919,-1.535000,8.281844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,7.852409>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<28.320919,-1.535000,8.281844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.320919,-1.535000,14.578153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,15.007588>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<28.320919,-1.535000,14.578153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.320919,-1.535000,22.198153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,22.627588>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<28.320919,-1.535000,22.198153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.320919,-1.535000,23.521844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,23.092409>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<28.320919,-1.535000,23.521844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.341897,-1.535000,2.288847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.699150,-1.535000,2.646100>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.341897,-1.535000,2.288847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.342559,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.977766,-1.535000,14.630400>}
box{<0,0,-0.203200><0.635206,0.035000,0.203200> rotate<0,0.000000,0> translate<28.342559,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.384644,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,8.128000>}
box{<0,0,-0.203200><0.114156,0.035000,0.203200> rotate<0,0.000000,0> translate<28.384644,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.384644,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.871281,-1.535000,22.352000>}
box{<0,0,-0.203200><0.486638,0.035000,0.203200> rotate<0,0.000000,0> translate<28.384644,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.423966,-1.535000,26.771600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.108397,-1.535000,27.456031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.423966,-1.535000,26.771600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.423966,-1.535000,29.108397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.108397,-1.535000,28.423966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<28.423966,-1.535000,29.108397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.423966,-1.535000,34.188397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,34.113559>}
box{<0,0,-0.203200><0.105834,0.035000,0.203200> rotate<0,44.998226,0> translate<28.423966,-1.535000,34.188397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.455941,-1.535000,15.575872>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,15.472409>}
box{<0,0,-0.203200><0.111987,0.035000,0.203200> rotate<0,67.495224,0> translate<28.455941,-1.535000,15.575872> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.455941,-1.535000,15.575872>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.790331,-1.535000,15.798800>}
box{<0,0,-0.203200><0.401888,0.035000,0.203200> rotate<0,-33.687968,0> translate<28.455941,-1.535000,15.575872> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.468813,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,7.315200>}
box{<0,0,-0.203200><0.029988,0.035000,0.203200> rotate<0,0.000000,0> translate<28.468813,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.468813,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.787116,-1.535000,23.164800>}
box{<0,0,-0.203200><0.318303,0.035000,0.203200> rotate<0,0.000000,0> translate<28.468813,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.474763,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,34.137600>}
box{<0,0,-0.203200><0.024038,0.035000,0.203200> rotate<0,0.000000,0> translate<28.474763,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.474766,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,26.822400>}
box{<0,0,-0.203200><1.294034,0.035000,0.203200> rotate<0,0.000000,0> translate<28.474766,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.491450,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.293547,-1.535000,2.438400>}
box{<0,0,-0.203200><0.802097,0.035000,0.203200> rotate<0,0.000000,0> translate<28.491450,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,7.387588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,7.852409>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,90.000000,0> translate<28.498797,-1.535000,7.852409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,7.721600>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<28.498797,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,15.007588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,15.472409>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,90.000000,0> translate<28.498797,-1.535000,15.472409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.833284,-1.535000,15.036800>}
box{<0,0,-0.203200><0.334488,0.035000,0.203200> rotate<0,0.000000,0> translate<28.498797,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.833288,-1.535000,15.443200>}
box{<0,0,-0.203200><0.334491,0.035000,0.203200> rotate<0,0.000000,0> translate<28.498797,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,22.627588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,23.092409>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,90.000000,0> translate<28.498797,-1.535000,23.092409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498797,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.765500,-1.535000,22.758400>}
box{<0,0,-0.203200><0.266703,0.035000,0.203200> rotate<0,0.000000,0> translate<28.498797,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,6.916972>}
box{<0,0,-0.203200><2.531828,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.498800,-1.535000,6.916972> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,34.618834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.498800,-1.535000,34.113559>}
box{<0,0,-0.203200><0.505275,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.498800,-1.535000,34.113559> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.677963,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,28.854400>}
box{<0,0,-0.203200><1.090837,0.035000,0.203200> rotate<0,0.000000,0> translate<28.677963,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.699150,-1.535000,2.646100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892497,-1.535000,3.112878>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<28.699150,-1.535000,2.646100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.726031,-1.535000,29.946600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.693966,-1.535000,29.946600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<28.726031,-1.535000,29.946600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.726031,-1.535000,36.728397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.693966,-1.535000,36.728397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<28.726031,-1.535000,36.728397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.765500,-1.535000,22.607378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.958847,-1.535000,22.140600>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<28.765500,-1.535000,22.607378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.765500,-1.535000,23.112619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.765500,-1.535000,22.607378>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.765500,-1.535000,22.607378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.765500,-1.535000,23.112619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.958847,-1.535000,23.579397>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<28.765500,-1.535000,23.112619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.781453,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.003541,-1.535000,2.844800>}
box{<0,0,-0.203200><0.222088,0.035000,0.203200> rotate<0,0.000000,0> translate<28.781453,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.790331,-1.535000,15.798800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.951884,-1.535000,15.798800>}
box{<0,0,-0.203200><0.161553,0.035000,0.203200> rotate<0,0.000000,0> translate<28.790331,-1.535000,15.798800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.816297,-1.535000,15.290800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.816300,-1.535000,15.335953>}
box{<0,0,-0.203200><0.045153,0.035000,0.203200> rotate<0,-89.990095,0> translate<28.816297,-1.535000,15.290800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.816297,-1.535000,15.290800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.746678,-1.535000,15.290800>}
box{<0,0,-0.203200><1.930381,0.035000,0.203200> rotate<0,0.000000,0> translate<28.816297,-1.535000,15.290800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.816300,-1.535000,15.144044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.846322,-1.535000,14.954500>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<28.816300,-1.535000,15.144044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.816300,-1.535000,15.189194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.816300,-1.535000,15.144044>}
box{<0,0,-0.203200><0.045150,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.816300,-1.535000,15.144044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.816300,-1.535000,15.189194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.746678,-1.535000,15.189194>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,0.000000,0> translate<28.816300,-1.535000,15.189194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.816300,-1.535000,15.335953>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.846322,-1.535000,15.525497>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<28.816300,-1.535000,15.335953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.846322,-1.535000,14.954500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.905622,-1.535000,14.771987>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<28.846322,-1.535000,14.954500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.846322,-1.535000,15.525497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.905622,-1.535000,15.708009>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<28.846322,-1.535000,15.525497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.881166,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,27.228800>}
box{<0,0,-0.203200><0.887634,0.035000,0.203200> rotate<0,0.000000,0> translate<28.881166,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892497,-1.535000,3.112878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892497,-1.535000,5.132147>}
box{<0,0,-0.203200><2.019269,0.035000,0.203200> rotate<0,90.000000,0> translate<28.892497,-1.535000,5.132147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892497,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,3.251200>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<28.892497,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892497,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,3.657600>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<28.892497,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892497,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,4.064000>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<28.892497,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892497,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,4.470400>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<28.892497,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892497,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,4.876800>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<28.892497,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892497,-1.535000,5.132147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,5.132156>}
box{<0,0,-0.203200><0.000010,0.035000,0.203200> rotate<0,-71.560328,0> translate<28.892497,-1.535000,5.132147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,3.112878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.085847,-1.535000,2.646100>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<28.892500,-1.535000,3.112878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,5.132156>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,3.112878>}
box{<0,0,-0.203200><2.019278,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.892500,-1.535000,3.112878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.905622,-1.535000,14.771987>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.992747,-1.535000,14.601000>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<28.905622,-1.535000,14.771987> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.905622,-1.535000,15.708009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.951884,-1.535000,15.798800>}
box{<0,0,-0.203200><0.101898,0.035000,0.203200> rotate<0,-62.994657,0> translate<28.905622,-1.535000,15.708009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.955450,-1.535000,18.491197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.958847,-1.535000,18.499397>}
box{<0,0,-0.203200><0.008876,0.035000,0.203200> rotate<0,-67.493614,0> translate<28.955450,-1.535000,18.491197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.955450,-1.535000,19.608800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.958847,-1.535000,19.600600>}
box{<0,0,-0.203200><0.008876,0.035000,0.203200> rotate<0,67.493614,0> translate<28.955450,-1.535000,19.608800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.955450,-1.535000,21.031197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.958847,-1.535000,21.039397>}
box{<0,0,-0.203200><0.008876,0.035000,0.203200> rotate<0,-67.493614,0> translate<28.955450,-1.535000,21.031197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.958847,-1.535000,18.499397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.316100,-1.535000,18.856650>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.958847,-1.535000,18.499397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.958847,-1.535000,19.600600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.316100,-1.535000,19.243347>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<28.958847,-1.535000,19.600600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.958847,-1.535000,21.039397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.316100,-1.535000,21.396650>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.958847,-1.535000,21.039397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.958847,-1.535000,22.140600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.316100,-1.535000,21.783347>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<28.958847,-1.535000,22.140600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.958847,-1.535000,23.579397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.316100,-1.535000,23.936650>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.958847,-1.535000,23.579397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.992747,-1.535000,14.601000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.105547,-1.535000,14.445744>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<28.992747,-1.535000,14.601000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.084363,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,28.448000>}
box{<0,0,-0.203200><0.684438,0.035000,0.203200> rotate<0,0.000000,0> translate<29.084363,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.085847,-1.535000,2.646100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.443100,-1.535000,2.288847>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<29.085847,-1.535000,2.646100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.105547,-1.535000,14.445744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.241244,-1.535000,14.310047>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<29.105547,-1.535000,14.445744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.108397,-1.535000,27.456031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.108397,-1.535000,28.423966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<29.108397,-1.535000,28.423966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.108397,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,27.635200>}
box{<0,0,-0.203200><0.660403,0.035000,0.203200> rotate<0,0.000000,0> translate<29.108397,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.108397,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,28.041600>}
box{<0,0,-0.203200><0.660403,0.035000,0.203200> rotate<0,0.000000,0> translate<29.108397,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.241244,-1.535000,14.310047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.396500,-1.535000,14.197247>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<29.241244,-1.535000,14.310047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.316100,-1.535000,18.856650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.782878,-1.535000,19.049997>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<29.316100,-1.535000,18.856650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.316100,-1.535000,19.243347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.782878,-1.535000,19.050000>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<29.316100,-1.535000,19.243347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.316100,-1.535000,21.396650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.782878,-1.535000,21.589997>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<29.316100,-1.535000,21.396650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.316100,-1.535000,21.783347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.782878,-1.535000,21.590000>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<29.316100,-1.535000,21.783347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.316100,-1.535000,23.936650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,24.124166>}
box{<0,0,-0.203200><0.489999,0.035000,0.203200> rotate<0,-22.498639,0> translate<29.316100,-1.535000,23.936650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.351466,-1.535000,10.871197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.612859,-1.535000,10.762925>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,22.498335,0> translate<29.351466,-1.535000,10.871197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.396500,-1.535000,14.197247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.567488,-1.535000,14.110122>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<29.396500,-1.535000,14.197247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.443100,-1.535000,2.288847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.909878,-1.535000,2.095500>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<29.443100,-1.535000,2.288847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.567488,-1.535000,14.110122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.750000,-1.535000,14.050822>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,17.998271,0> translate<29.567488,-1.535000,14.110122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.612859,-1.535000,10.762925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.812925,-1.535000,10.562859>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,44.997030,0> translate<29.612859,-1.535000,10.762925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.617481,-1.535000,6.038381>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.740750,-1.535000,6.192463>}
box{<0,0,-0.203200><0.197323,0.035000,0.203200> rotate<0,-51.335953,0> translate<29.617481,-1.535000,6.038381> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.617481,-1.535000,6.038381>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.909878,-1.535000,6.159497>}
box{<0,0,-0.203200><0.316488,0.035000,0.203200> rotate<0,-22.498661,0> translate<29.617481,-1.535000,6.038381> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.663575,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.756584,-1.535000,6.096000>}
box{<0,0,-0.203200><0.093009,0.035000,0.203200> rotate<0,0.000000,0> translate<29.663575,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.693966,-1.535000,29.946600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,30.021438>}
box{<0,0,-0.203200><0.105834,0.035000,0.203200> rotate<0,-44.998226,0> translate<29.693966,-1.535000,29.946600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.693966,-1.535000,36.728397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.378397,-1.535000,36.043966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<29.693966,-1.535000,36.728397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.740750,-1.535000,6.192463>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.812925,-1.535000,6.264638>}
box{<0,0,-0.203200><0.102071,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.740750,-1.535000,6.192463> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.750000,-1.535000,14.050822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.939544,-1.535000,14.020800>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,8.999729,0> translate<29.750000,-1.535000,14.050822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,30.021438>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.768800,-1.535000,24.124166>}
box{<0,0,-0.203200><5.897272,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.768800,-1.535000,24.124166> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.782878,-1.535000,19.049997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.812119,-1.535000,19.049997>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,0.000000,0> translate<29.782878,-1.535000,19.049997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.782878,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.812119,-1.535000,19.050000>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,0.000000,0> translate<29.782878,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.782878,-1.535000,21.589997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.812119,-1.535000,21.589997>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,0.000000,0> translate<29.782878,-1.535000,21.589997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.782878,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.812119,-1.535000,21.590000>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,0.000000,0> translate<29.782878,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.809384,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,10.566400>}
box{<0,0,-0.203200><1.546916,0.035000,0.203200> rotate<0,0.000000,0> translate<29.809384,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.812925,-1.535000,6.264638>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.828422,-1.535000,6.302056>}
box{<0,0,-0.203200><0.040501,0.035000,0.203200> rotate<0,-67.498785,0> translate<29.812925,-1.535000,6.264638> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.812925,-1.535000,10.562859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,10.301466>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,67.495725,0> translate<29.812925,-1.535000,10.562859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.828422,-1.535000,6.302056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.853725,-1.535000,6.333681>}
box{<0,0,-0.203200><0.040502,0.035000,0.203200> rotate<0,-51.333352,0> translate<29.828422,-1.535000,6.302056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.846363,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,36.576000>}
box{<0,0,-0.203200><5.434437,0.035000,0.203200> rotate<0,0.000000,0> translate<29.846363,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.853725,-1.535000,6.333681>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.882134,-1.535000,6.431728>}
box{<0,0,-0.203200><0.102080,0.035000,0.203200> rotate<0,-73.836023,0> translate<29.853725,-1.535000,6.333681> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.882134,-1.535000,6.431728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,6.526031>}
box{<0,0,-0.203200><0.102073,0.035000,0.203200> rotate<0,-67.495096,0> translate<29.882134,-1.535000,6.431728> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.909878,-1.535000,2.095500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.415119,-1.535000,2.095500>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,0.000000,0> translate<29.909878,-1.535000,2.095500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.909878,-1.535000,6.159497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.415119,-1.535000,6.159497>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,0.000000,0> translate<29.909878,-1.535000,6.159497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.911406,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.739563,-1.535000,6.502400>}
box{<0,0,-0.203200><0.828156,0.035000,0.203200> rotate<0,0.000000,0> translate<29.911406,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,6.526031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,6.566534>}
box{<0,0,-0.203200><0.040503,0.035000,0.203200> rotate<0,90.000000,0> translate<29.921197,-1.535000,6.566534> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,6.566534>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.932469,-1.535000,6.605434>}
box{<0,0,-0.203200><0.040500,0.035000,0.203200> rotate<0,-73.835366,0> translate<29.921197,-1.535000,6.566534> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,6.706888>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,10.301466>}
box{<0,0,-0.203200><3.594578,0.035000,0.203200> rotate<0,90.000000,0> translate<29.921197,-1.535000,10.301466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,6.706888>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.932469,-1.535000,6.605434>}
box{<0,0,-0.203200><0.102077,0.035000,0.203200> rotate<0,83.654674,0> translate<29.921197,-1.535000,6.706888> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.078228,-1.535000,6.908800>}
box{<0,0,-0.203200><1.157031,0.035000,0.203200> rotate<0,0.000000,0> translate<29.921197,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,7.315200>}
box{<0,0,-0.203200><1.435103,0.035000,0.203200> rotate<0,0.000000,0> translate<29.921197,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,7.721600>}
box{<0,0,-0.203200><1.435103,0.035000,0.203200> rotate<0,0.000000,0> translate<29.921197,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,8.128000>}
box{<0,0,-0.203200><1.435103,0.035000,0.203200> rotate<0,0.000000,0> translate<29.921197,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,8.534400>}
box{<0,0,-0.203200><1.435103,0.035000,0.203200> rotate<0,0.000000,0> translate<29.921197,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,8.940800>}
box{<0,0,-0.203200><1.435103,0.035000,0.203200> rotate<0,0.000000,0> translate<29.921197,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,9.347200>}
box{<0,0,-0.203200><1.435103,0.035000,0.203200> rotate<0,0.000000,0> translate<29.921197,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,9.753600>}
box{<0,0,-0.203200><1.435103,0.035000,0.203200> rotate<0,0.000000,0> translate<29.921197,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.921197,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,10.160000>}
box{<0,0,-0.203200><1.435103,0.035000,0.203200> rotate<0,0.000000,0> translate<29.921197,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.939544,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.746694,-1.535000,14.020797>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,0.000222,0> translate<29.939544,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.252763,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,36.169600>}
box{<0,0,-0.203200><5.028037,0.035000,0.203200> rotate<0,0.000000,0> translate<30.252763,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.303559,-1.535000,35.001197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.378397,-1.535000,35.076031>}
box{<0,0,-0.203200><0.105834,0.035000,0.203200> rotate<0,-44.995834,0> translate<30.303559,-1.535000,35.001197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.303559,-1.535000,35.001197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.161466,-1.535000,35.001197>}
box{<0,0,-0.203200><2.857906,0.035000,0.203200> rotate<0,0.000000,0> translate<30.303559,-1.535000,35.001197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.378397,-1.535000,35.076031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.378397,-1.535000,36.043966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<30.378397,-1.535000,36.043966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.378397,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,35.356800>}
box{<0,0,-0.203200><4.902403,0.035000,0.203200> rotate<0,0.000000,0> translate<30.378397,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.378397,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,35.763200>}
box{<0,0,-0.203200><4.902403,0.035000,0.203200> rotate<0,0.000000,0> translate<30.378397,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.415119,-1.535000,2.095500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.881897,-1.535000,2.288847>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<30.415119,-1.535000,2.095500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.415119,-1.535000,6.159497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.443878,-1.535000,6.147581>}
box{<0,0,-0.203200><0.031130,0.035000,0.203200> rotate<0,22.503789,0> translate<30.415119,-1.535000,6.159497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.443878,-1.535000,6.147581>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,7.242491>}
box{<0,0,-0.203200><1.425251,0.035000,0.203200> rotate<0,-50.191197,0> translate<30.443878,-1.535000,6.147581> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.746678,-1.535000,15.290800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.746678,-1.535000,15.189194>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.746678,-1.535000,15.189194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.746694,-1.535000,14.020797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.746694,-1.535000,15.189178>}
box{<0,0,-0.203200><1.168381,0.035000,0.203200> rotate<0,90.000000,0> translate<30.746694,-1.535000,15.189178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.746694,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.848300,-1.535000,14.224000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<30.746694,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.746694,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.848300,-1.535000,14.630400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<30.746694,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.746694,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.848300,-1.535000,15.036800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<30.746694,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.746694,-1.535000,15.189178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.848300,-1.535000,15.189178>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<30.746694,-1.535000,15.189178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.848300,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.655453,-1.535000,14.020800>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,0.000000,0> translate<30.848300,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.848300,-1.535000,15.189178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.848300,-1.535000,14.020800>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.848300,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.848319,-1.535000,15.189194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.848319,-1.535000,15.290800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,90.000000,0> translate<30.848319,-1.535000,15.290800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.848319,-1.535000,15.189194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,15.189194>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,0.000000,0> translate<30.848319,-1.535000,15.189194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.848319,-1.535000,15.290800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,15.290800>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,0.000000,0> translate<30.848319,-1.535000,15.290800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.881897,-1.535000,2.288847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.239150,-1.535000,2.646100>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.881897,-1.535000,2.288847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.031450,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.833547,-1.535000,2.438400>}
box{<0,0,-0.203200><0.802097,0.035000,0.203200> rotate<0,0.000000,0> translate<31.031450,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,24.129997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,24.623938>}
box{<0,0,-0.203200><0.493941,0.035000,0.203200> rotate<0,90.000000,0> translate<31.191197,-1.535000,24.623938> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,24.129997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.812119,-1.535000,24.129997>}
box{<0,0,-0.203200><0.620922,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,24.129997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.431131,-1.535000,24.384000>}
box{<0,0,-0.203200><0.239934,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,24.623938>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.583531,-1.535000,24.231600>}
box{<0,0,-0.203200><0.554847,0.035000,0.203200> rotate<0,44.997258,0> translate<31.191197,-1.535000,24.623938> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,26.176059>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,32.078831>}
box{<0,0,-0.203200><5.902772,0.035000,0.203200> rotate<0,90.000000,0> translate<31.191197,-1.535000,32.078831> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,26.176059>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.583531,-1.535000,26.568397>}
box{<0,0,-0.203200><0.554847,0.035000,0.203200> rotate<0,-44.997258,0> translate<31.191197,-1.535000,26.176059> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.431138,-1.535000,26.416000>}
box{<0,0,-0.203200><0.239941,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.485231,-1.535000,26.822400>}
box{<0,0,-0.203200><1.294034,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.078831,-1.535000,27.228800>}
box{<0,0,-0.203200><0.887634,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.851600,-1.535000,27.635200>}
box{<0,0,-0.203200><0.660403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.851600,-1.535000,28.041600>}
box{<0,0,-0.203200><0.660403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.875634,-1.535000,28.448000>}
box{<0,0,-0.203200><0.684437,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.282034,-1.535000,28.854400>}
box{<0,0,-0.203200><1.090837,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,29.260800>}
box{<0,0,-0.203200><1.117603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,29.667200>}
box{<0,0,-0.203200><1.117603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,30.073600>}
box{<0,0,-0.203200><1.117603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,30.480000>}
box{<0,0,-0.203200><1.117603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,30.886400>}
box{<0,0,-0.203200><1.117603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,31.292800>}
box{<0,0,-0.203200><1.117603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,31.699200>}
box{<0,0,-0.203200><1.117603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.191197,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.191197,-1.535000,32.078831>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.648397,-1.535000,32.536031>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.191197,-1.535000,32.078831> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.217966,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,32.105600>}
box{<0,0,-0.203200><1.090834,0.035000,0.203200> rotate<0,0.000000,0> translate<31.217966,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.239150,-1.535000,2.646100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432497,-1.535000,3.112878>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<31.239150,-1.535000,2.646100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.321453,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.543541,-1.535000,2.844800>}
box{<0,0,-0.203200><0.222088,0.035000,0.203200> rotate<0,0.000000,0> translate<31.321453,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,11.988800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.356300,-1.535000,7.242491>}
box{<0,0,-0.203200><4.746309,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.356300,-1.535000,7.242491> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432497,-1.535000,3.112878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432497,-1.535000,5.112066>}
box{<0,0,-0.203200><1.999188,0.035000,0.203200> rotate<0,90.000000,0> translate<31.432497,-1.535000,5.112066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432497,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,3.251200>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<31.432497,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432497,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,3.657600>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<31.432497,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432497,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,4.064000>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<31.432497,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432497,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,4.470400>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<31.432497,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432497,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,4.876800>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<31.432497,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432497,-1.535000,5.112066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,5.112075>}
box{<0,0,-0.203200><0.000010,0.035000,0.203200> rotate<0,-71.560328,0> translate<31.432497,-1.535000,5.112066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,3.112878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.625847,-1.535000,2.646100>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<31.432500,-1.535000,3.112878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,5.112075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,3.112878>}
box{<0,0,-0.203200><1.999197,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.432500,-1.535000,3.112878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.573559,-1.535000,33.578800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.648397,-1.535000,33.503966>}
box{<0,0,-0.203200><0.105834,0.035000,0.203200> rotate<0,44.995834,0> translate<31.573559,-1.535000,33.578800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.573559,-1.535000,33.578800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,33.578800>}
box{<0,0,-0.203200><0.735241,0.035000,0.203200> rotate<0,0.000000,0> translate<31.573559,-1.535000,33.578800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.583531,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.551466,-1.535000,24.231600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<31.583531,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.583531,-1.535000,26.568397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.551466,-1.535000,26.568397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<31.583531,-1.535000,26.568397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.624366,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,32.512000>}
box{<0,0,-0.203200><0.684434,0.035000,0.203200> rotate<0,0.000000,0> translate<31.624366,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.625847,-1.535000,2.646100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.983100,-1.535000,2.288847>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<31.625847,-1.535000,2.646100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.648397,-1.535000,32.536031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.648397,-1.535000,33.503966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<31.648397,-1.535000,33.503966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.648397,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,32.918400>}
box{<0,0,-0.203200><0.660403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.648397,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.648397,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,33.324800>}
box{<0,0,-0.203200><0.660403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.648397,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.655453,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.844997,-1.535000,14.050822>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-8.999729,0> translate<31.655453,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.812119,-1.535000,19.049997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.278897,-1.535000,18.856650>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<31.812119,-1.535000,19.049997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.812119,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.278897,-1.535000,19.243347>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<31.812119,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.812119,-1.535000,21.589997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.278897,-1.535000,21.396650>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<31.812119,-1.535000,21.589997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.812119,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.278897,-1.535000,21.783347>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<31.812119,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.812119,-1.535000,24.129997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.278897,-1.535000,23.936650>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<31.812119,-1.535000,24.129997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.844997,-1.535000,14.050822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.027509,-1.535000,14.110122>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-17.998271,0> translate<31.844997,-1.535000,14.050822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.851600,-1.535000,27.456031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.536031,-1.535000,26.771600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<31.851600,-1.535000,27.456031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.851600,-1.535000,28.423966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.851600,-1.535000,27.456031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.851600,-1.535000,27.456031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.851600,-1.535000,28.423966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,28.881166>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.851600,-1.535000,28.423966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.934753,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,21.539200>}
box{<0,0,-0.203200><1.009047,0.035000,0.203200> rotate<0,0.000000,0> translate<31.934753,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.934759,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,19.100800>}
box{<0,0,-0.203200><1.009041,0.035000,0.203200> rotate<0,0.000000,0> translate<31.934759,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.983100,-1.535000,2.288847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.449878,-1.535000,2.095500>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<31.983100,-1.535000,2.288847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.027509,-1.535000,14.110122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.198497,-1.535000,14.197247>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<32.027509,-1.535000,14.110122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.180038,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,23.977600>}
box{<0,0,-0.203200><0.763762,0.035000,0.203200> rotate<0,0.000000,0> translate<32.180038,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.198497,-1.535000,14.197247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.353753,-1.535000,14.310047>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<32.198497,-1.535000,14.197247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.208966,-1.535000,13.411197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.470359,-1.535000,13.302925>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,22.498335,0> translate<32.208966,-1.535000,13.411197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.229166,-1.535000,6.068072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.449878,-1.535000,6.159497>}
box{<0,0,-0.203200><0.238899,0.035000,0.203200> rotate<0,-22.499155,0> translate<32.229166,-1.535000,6.068072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.229166,-1.535000,6.068072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.593203,-1.535000,6.504919>}
box{<0,0,-0.203200><0.568646,0.035000,0.203200> rotate<0,-50.191237,0> translate<32.229166,-1.535000,6.068072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.235319,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,14.224000>}
box{<0,0,-0.203200><3.045481,0.035000,0.203200> rotate<0,0.000000,0> translate<32.235319,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.252437,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.296591,-1.535000,6.096000>}
box{<0,0,-0.203200><0.044153,0.035000,0.203200> rotate<0,0.000000,0> translate<32.252437,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.278897,-1.535000,18.856650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.636150,-1.535000,18.499397>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<32.278897,-1.535000,18.856650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.278897,-1.535000,19.243347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.636150,-1.535000,19.600600>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.278897,-1.535000,19.243347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.278897,-1.535000,21.396650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.636150,-1.535000,21.039397>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<32.278897,-1.535000,21.396650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.278897,-1.535000,21.783347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.636150,-1.535000,22.140600>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.278897,-1.535000,21.783347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.278897,-1.535000,23.936650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.636150,-1.535000,23.579397>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<32.278897,-1.535000,23.936650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,33.578800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308800,-1.535000,28.881166>}
box{<0,0,-0.203200><4.697634,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.308800,-1.535000,28.881166> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.353753,-1.535000,14.310047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.489450,-1.535000,14.445744>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.353753,-1.535000,14.310047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.441147,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,18.694400>}
box{<0,0,-0.203200><0.502653,0.035000,0.203200> rotate<0,0.000000,0> translate<32.441147,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.441150,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,21.945600>}
box{<0,0,-0.203200><0.502650,0.035000,0.203200> rotate<0,0.000000,0> translate<32.441150,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.449878,-1.535000,2.095500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.955119,-1.535000,2.095500>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,0.000000,0> translate<32.449878,-1.535000,2.095500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.449878,-1.535000,6.159497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.955119,-1.535000,6.159497>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,0.000000,0> translate<32.449878,-1.535000,6.159497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.470359,-1.535000,13.302925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.670425,-1.535000,13.102859>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,44.997030,0> translate<32.470359,-1.535000,13.302925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.489450,-1.535000,14.445744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.602250,-1.535000,14.601000>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<32.489450,-1.535000,14.445744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.536031,-1.535000,26.771600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.503966,-1.535000,26.771600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<32.536031,-1.535000,26.771600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.542747,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,21.132800>}
box{<0,0,-0.203200><0.401053,0.035000,0.203200> rotate<0,0.000000,0> translate<32.542747,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.542750,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,19.507200>}
box{<0,0,-0.203200><0.401050,0.035000,0.203200> rotate<0,0.000000,0> translate<32.542750,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.551466,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,24.623938>}
box{<0,0,-0.203200><0.554847,0.035000,0.203200> rotate<0,-44.997258,0> translate<32.551466,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.551466,-1.535000,26.568397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.008662,-1.535000,26.111197>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.997226,0> translate<32.551466,-1.535000,26.568397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.591103,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,6.502400>}
box{<0,0,-0.203200><2.689697,0.035000,0.203200> rotate<0,0.000000,0> translate<32.591103,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.593203,-1.535000,6.504919>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.670425,-1.535000,6.582137>}
box{<0,0,-0.203200><0.109206,0.035000,0.203200> rotate<0,-44.995871,0> translate<32.593203,-1.535000,6.504919> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.602250,-1.535000,14.601000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.689375,-1.535000,14.771987>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<32.602250,-1.535000,14.601000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.617228,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,14.630400>}
box{<0,0,-0.203200><2.663572,0.035000,0.203200> rotate<0,0.000000,0> translate<32.617228,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.636150,-1.535000,18.499397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,18.032619>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<32.636150,-1.535000,18.499397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.636150,-1.535000,19.600600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,20.067378>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<32.636150,-1.535000,19.600600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.636150,-1.535000,21.039397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,20.572619>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<32.636150,-1.535000,21.039397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.636150,-1.535000,22.140600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,22.607378>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<32.636150,-1.535000,22.140600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.636150,-1.535000,23.579397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,23.112619>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<32.636150,-1.535000,23.579397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.639547,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,23.571200>}
box{<0,0,-0.203200><0.304253,0.035000,0.203200> rotate<0,0.000000,0> translate<32.639547,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.643113,-1.535000,15.798800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.689375,-1.535000,15.708009>}
box{<0,0,-0.203200><0.101898,0.035000,0.203200> rotate<0,62.994657,0> translate<32.643113,-1.535000,15.798800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.643113,-1.535000,15.798800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.796466,-1.535000,15.798800>}
box{<0,0,-0.203200><1.153353,0.035000,0.203200> rotate<0,0.000000,0> translate<32.643113,-1.535000,15.798800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.670425,-1.535000,6.582137>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.683144,-1.535000,6.612847>}
box{<0,0,-0.203200><0.033239,0.035000,0.203200> rotate<0,-67.497917,0> translate<32.670425,-1.535000,6.582137> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.670425,-1.535000,13.102859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,12.841466>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,67.495725,0> translate<32.670425,-1.535000,13.102859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.683144,-1.535000,6.612847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.704422,-1.535000,6.638378>}
box{<0,0,-0.203200><0.033236,0.035000,0.203200> rotate<0,-50.188357,0> translate<32.683144,-1.535000,6.612847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.689375,-1.535000,14.771987>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.748675,-1.535000,14.954500>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<32.689375,-1.535000,14.771987> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.689375,-1.535000,15.708009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.748675,-1.535000,15.525497>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<32.689375,-1.535000,15.708009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.702669,-1.535000,17.221197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,17.527378>}
box{<0,0,-0.203200><0.331410,0.035000,0.203200> rotate<0,-67.494955,0> translate<32.702669,-1.535000,17.221197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.702669,-1.535000,17.221197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,17.221197>}
box{<0,0,-0.203200><0.241131,0.035000,0.203200> rotate<0,0.000000,0> translate<32.702669,-1.535000,17.221197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.703862,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,24.384000>}
box{<0,0,-0.203200><0.239938,0.035000,0.203200> rotate<0,0.000000,0> translate<32.703862,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.703862,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,26.416000>}
box{<0,0,-0.203200><2.576937,0.035000,0.203200> rotate<0,0.000000,0> translate<32.703862,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.704422,-1.535000,6.638378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.736906,-1.535000,6.742644>}
box{<0,0,-0.203200><0.109209,0.035000,0.203200> rotate<0,-72.690569,0> translate<32.704422,-1.535000,6.638378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.711044,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,13.004800>}
box{<0,0,-0.203200><2.569756,0.035000,0.203200> rotate<0,0.000000,0> translate<32.711044,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.723713,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,22.352000>}
box{<0,0,-0.203200><0.220087,0.035000,0.203200> rotate<0,0.000000,0> translate<32.723713,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.723716,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,18.288000>}
box{<0,0,-0.203200><0.220084,0.035000,0.203200> rotate<0,0.000000,0> translate<32.723716,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.736906,-1.535000,6.742644>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,6.843531>}
box{<0,0,-0.203200><0.109200,0.035000,0.203200> rotate<0,-67.494743,0> translate<32.736906,-1.535000,6.742644> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.748675,-1.535000,14.954500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,15.144044>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<32.748675,-1.535000,14.954500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.748675,-1.535000,15.525497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,15.335953>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<32.748675,-1.535000,15.525497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.761709,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,15.036800>}
box{<0,0,-0.203200><2.519091,0.035000,0.203200> rotate<0,0.000000,0> translate<32.761709,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.761713,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,15.443200>}
box{<0,0,-0.203200><2.519087,0.035000,0.203200> rotate<0,0.000000,0> translate<32.761713,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.765797,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,19.913600>}
box{<0,0,-0.203200><0.178003,0.035000,0.203200> rotate<0,0.000000,0> translate<32.765797,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.765800,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,20.726400>}
box{<0,0,-0.203200><0.178000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.765800,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,6.843531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,6.876766>}
box{<0,0,-0.203200><0.033234,0.035000,0.203200> rotate<0,90.000000,0> translate<32.778697,-1.535000,6.876766> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,6.876766>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.788584,-1.535000,6.908500>}
box{<0,0,-0.203200><0.033239,0.035000,0.203200> rotate<0,-72.689701,0> translate<32.778697,-1.535000,6.876766> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,7.017266>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,12.841466>}
box{<0,0,-0.203200><5.824200,0.035000,0.203200> rotate<0,90.000000,0> translate<32.778697,-1.535000,12.841466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,7.017266>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.788584,-1.535000,6.908500>}
box{<0,0,-0.203200><0.109214,0.035000,0.203200> rotate<0,84.800123,0> translate<32.778697,-1.535000,7.017266> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,7.315200>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,7.721600>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,8.128000>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,8.534400>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,8.940800>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,9.347200>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,9.753600>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,10.160000>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,10.566400>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,10.972800>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,11.379200>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,11.785600>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,12.192000>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,12.598400>}
box{<0,0,-0.203200><2.502103,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778697,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,15.144044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,15.189194>}
box{<0,0,-0.203200><0.045150,0.035000,0.203200> rotate<0,90.000000,0> translate<32.778697,-1.535000,15.189194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,15.290800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778697,-1.535000,15.335953>}
box{<0,0,-0.203200><0.045153,0.035000,0.203200> rotate<0,90.000000,0> translate<32.778697,-1.535000,15.335953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.788559,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,6.908800>}
box{<0,0,-0.203200><2.492241,0.035000,0.203200> rotate<0,0.000000,0> translate<32.788559,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.807881,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,17.475200>}
box{<0,0,-0.203200><0.135919,0.035000,0.203200> rotate<0,0.000000,0> translate<32.807881,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.807884,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,23.164800>}
box{<0,0,-0.203200><0.135916,0.035000,0.203200> rotate<0,0.000000,0> translate<32.807884,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,17.527378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,18.032619>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,90.000000,0> translate<32.829497,-1.535000,18.032619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,17.881600>}
box{<0,0,-0.203200><0.114303,0.035000,0.203200> rotate<0,0.000000,0> translate<32.829497,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,20.067378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,20.572619>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,90.000000,0> translate<32.829497,-1.535000,20.572619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,20.320000>}
box{<0,0,-0.203200><0.114303,0.035000,0.203200> rotate<0,0.000000,0> translate<32.829497,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,22.607378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,23.112619>}
box{<0,0,-0.203200><0.505241,0.035000,0.203200> rotate<0,90.000000,0> translate<32.829497,-1.535000,23.112619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.829497,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,22.758400>}
box{<0,0,-0.203200><0.114303,0.035000,0.203200> rotate<0,0.000000,0> translate<32.829497,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,24.623938>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.943800,-1.535000,17.221197>}
box{<0,0,-0.203200><7.402741,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.943800,-1.535000,17.221197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.955119,-1.535000,2.095500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.421897,-1.535000,2.288847>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-22.498625,0> translate<32.955119,-1.535000,2.095500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.955119,-1.535000,6.159497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.421897,-1.535000,5.966150>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,22.498625,0> translate<32.955119,-1.535000,6.159497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.008662,-1.535000,26.111197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.796466,-1.535000,26.111197>}
box{<0,0,-0.203200><0.787803,0.035000,0.203200> rotate<0,0.000000,0> translate<33.008662,-1.535000,26.111197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.108416,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,6.096000>}
box{<0,0,-0.203200><2.172384,0.035000,0.203200> rotate<0,0.000000,0> translate<33.108416,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.161466,-1.535000,35.001197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.422859,-1.535000,34.892925>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,22.498335,0> translate<33.161466,-1.535000,35.001197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.284103,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,34.950400>}
box{<0,0,-0.203200><1.996697,0.035000,0.203200> rotate<0,0.000000,0> translate<33.284103,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.421897,-1.535000,2.288847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.779150,-1.535000,2.646100>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.421897,-1.535000,2.288847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.421897,-1.535000,5.966150>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.779150,-1.535000,5.608897>}
box{<0,0,-0.203200><0.505232,0.035000,0.203200> rotate<0,44.997030,0> translate<33.421897,-1.535000,5.966150> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.422859,-1.535000,34.892925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.622925,-1.535000,34.692859>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,44.997030,0> translate<33.422859,-1.535000,34.892925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.503966,-1.535000,26.771600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.188397,-1.535000,27.456031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.503966,-1.535000,26.771600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.554766,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,26.822400>}
box{<0,0,-0.203200><1.726034,0.035000,0.203200> rotate<0,0.000000,0> translate<33.554766,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.571450,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,2.438400>}
box{<0,0,-0.203200><1.709350,0.035000,0.203200> rotate<0,0.000000,0> translate<33.571450,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.622925,-1.535000,34.692859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,34.431466>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,67.495725,0> translate<33.622925,-1.535000,34.692859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.684584,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,34.544000>}
box{<0,0,-0.203200><1.596216,0.035000,0.203200> rotate<0,0.000000,0> translate<33.684584,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.698447,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,5.689600>}
box{<0,0,-0.203200><1.582353,0.035000,0.203200> rotate<0,0.000000,0> translate<33.698447,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,28.881166>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,34.431466>}
box{<0,0,-0.203200><5.550300,0.035000,0.203200> rotate<0,90.000000,0> translate<33.731197,-1.535000,34.431466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,28.881166>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.188397,-1.535000,28.423966>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,44.997030,0> translate<33.731197,-1.535000,28.881166> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,29.260800>}
box{<0,0,-0.203200><1.549603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.731197,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,29.667200>}
box{<0,0,-0.203200><1.549603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.731197,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,30.073600>}
box{<0,0,-0.203200><1.549603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.731197,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,30.480000>}
box{<0,0,-0.203200><1.549603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.731197,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,30.886400>}
box{<0,0,-0.203200><1.549603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.731197,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,31.292800>}
box{<0,0,-0.203200><1.549603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.731197,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,31.699200>}
box{<0,0,-0.203200><1.549603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.731197,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,32.105600>}
box{<0,0,-0.203200><1.549603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.731197,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,32.512000>}
box{<0,0,-0.203200><1.549603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.731197,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,32.918400>}
box{<0,0,-0.203200><1.549603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.731197,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,33.324800>}
box{<0,0,-0.203200><1.549603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.731197,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,33.731200>}
box{<0,0,-0.203200><1.549603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.731197,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.731197,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,34.137600>}
box{<0,0,-0.203200><1.549603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.731197,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.757963,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,28.854400>}
box{<0,0,-0.203200><1.522837,0.035000,0.203200> rotate<0,0.000000,0> translate<33.757963,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.779150,-1.535000,2.646100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.972497,-1.535000,3.112878>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,-67.495436,0> translate<33.779150,-1.535000,2.646100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.779150,-1.535000,5.608897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.972497,-1.535000,5.142119>}
box{<0,0,-0.203200><0.505237,0.035000,0.203200> rotate<0,67.495436,0> translate<33.779150,-1.535000,5.608897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.796466,-1.535000,15.798800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.057859,-1.535000,15.907072>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,-22.498335,0> translate<33.796466,-1.535000,15.798800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.796466,-1.535000,26.111197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.057859,-1.535000,26.002925>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,22.498335,0> translate<33.796466,-1.535000,26.111197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.861453,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,2.844800>}
box{<0,0,-0.203200><1.419347,0.035000,0.203200> rotate<0,0.000000,0> translate<33.861453,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.914059,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,5.283200>}
box{<0,0,-0.203200><1.366741,0.035000,0.203200> rotate<0,0.000000,0> translate<33.914059,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.919106,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,15.849600>}
box{<0,0,-0.203200><1.361694,0.035000,0.203200> rotate<0,0.000000,0> translate<33.919106,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.961166,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,27.228800>}
box{<0,0,-0.203200><1.319634,0.035000,0.203200> rotate<0,0.000000,0> translate<33.961166,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.972497,-1.535000,3.112878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.972497,-1.535000,5.142119>}
box{<0,0,-0.203200><2.029241,0.035000,0.203200> rotate<0,90.000000,0> translate<33.972497,-1.535000,5.142119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.972497,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,3.251200>}
box{<0,0,-0.203200><1.308303,0.035000,0.203200> rotate<0,0.000000,0> translate<33.972497,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.972497,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,3.657600>}
box{<0,0,-0.203200><1.308303,0.035000,0.203200> rotate<0,0.000000,0> translate<33.972497,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.972497,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,4.064000>}
box{<0,0,-0.203200><1.308303,0.035000,0.203200> rotate<0,0.000000,0> translate<33.972497,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.972497,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,4.470400>}
box{<0,0,-0.203200><1.308303,0.035000,0.203200> rotate<0,0.000000,0> translate<33.972497,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.972497,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,4.876800>}
box{<0,0,-0.203200><1.308303,0.035000,0.203200> rotate<0,0.000000,0> translate<33.972497,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.041747,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,26.009600>}
box{<0,0,-0.203200><1.239053,0.035000,0.203200> rotate<0,0.000000,0> translate<34.041747,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.057859,-1.535000,15.907072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.257925,-1.535000,16.107138>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.057859,-1.535000,15.907072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.057859,-1.535000,26.002925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.257925,-1.535000,25.802859>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,44.997030,0> translate<34.057859,-1.535000,26.002925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.164363,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,28.448000>}
box{<0,0,-0.203200><1.116437,0.035000,0.203200> rotate<0,0.000000,0> translate<34.164363,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.188397,-1.535000,27.456031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.188397,-1.535000,28.423966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<34.188397,-1.535000,28.423966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.188397,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,27.635200>}
box{<0,0,-0.203200><1.092403,0.035000,0.203200> rotate<0,0.000000,0> translate<34.188397,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.188397,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,28.041600>}
box{<0,0,-0.203200><1.092403,0.035000,0.203200> rotate<0,0.000000,0> translate<34.188397,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.257925,-1.535000,16.107138>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,16.368531>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,-67.495725,0> translate<34.257925,-1.535000,16.107138> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.257925,-1.535000,25.802859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,25.541466>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,67.495725,0> translate<34.257925,-1.535000,25.802859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.319584,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,16.256000>}
box{<0,0,-0.203200><0.961216,0.035000,0.203200> rotate<0,0.000000,0> translate<34.319584,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340628,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,25.603200>}
box{<0,0,-0.203200><0.940172,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340628,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,16.368531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,25.541466>}
box{<0,0,-0.203200><9.172934,0.035000,0.203200> rotate<0,90.000000,0> translate<34.366197,-1.535000,25.541466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,16.662400>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,17.068800>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,17.475200>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,17.881600>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,18.288000>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,18.694400>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,19.100800>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,19.507200>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,19.913600>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,20.320000>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,20.726400>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,21.132800>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,21.539200>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,21.945600>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,22.352000>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,22.758400>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,23.164800>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,23.571200>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,23.977600>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,24.384000>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,24.790400>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366197,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,25.196800>}
box{<0,0,-0.203200><0.914603,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366197,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,36.870800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.280800,-1.535000,1.219197>}
box{<0,0,-0.203200><35.651603,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.280800,-1.535000,1.219197> }
texture{col_pol}
}
#end
union{
cylinder{<11.430000,0.038000,30.480000><11.430000,-1.538000,30.480000>0.406400}
cylinder{<11.430000,0.038000,27.940000><11.430000,-1.538000,27.940000>0.406400}
cylinder{<22.860000,0.038000,27.940000><22.860000,-1.538000,27.940000>0.406400}
cylinder{<22.860000,0.038000,30.480000><22.860000,-1.538000,30.480000>0.406400}
cylinder{<9.207500,0.038000,33.655000><9.207500,-1.538000,33.655000>0.558800}
cylinder{<19.367500,0.038000,33.655000><19.367500,-1.538000,33.655000>0.558800}
cylinder{<5.080000,0.038000,33.020000><5.080000,-1.538000,33.020000>0.558800}
cylinder{<5.080000,0.038000,27.940000><5.080000,-1.538000,27.940000>0.558800}
cylinder{<26.670000,0.038000,7.620000><26.670000,-1.538000,7.620000>0.406400}
cylinder{<26.670000,0.038000,10.160000><26.670000,-1.538000,10.160000>0.406400}
cylinder{<26.670000,0.038000,12.700000><26.670000,-1.538000,12.700000>0.406400}
cylinder{<26.670000,0.038000,15.240000><26.670000,-1.538000,15.240000>0.406400}
cylinder{<26.670000,0.038000,17.780000><26.670000,-1.538000,17.780000>0.406400}
cylinder{<26.670000,0.038000,20.320000><26.670000,-1.538000,20.320000>0.406400}
cylinder{<26.670000,0.038000,22.860000><26.670000,-1.538000,22.860000>0.406400}
cylinder{<19.050000,0.038000,22.860000><19.050000,-1.538000,22.860000>0.406400}
cylinder{<19.050000,0.038000,20.320000><19.050000,-1.538000,20.320000>0.406400}
cylinder{<19.050000,0.038000,17.780000><19.050000,-1.538000,17.780000>0.406400}
cylinder{<19.050000,0.038000,15.240000><19.050000,-1.538000,15.240000>0.406400}
cylinder{<19.050000,0.038000,12.700000><19.050000,-1.538000,12.700000>0.406400}
cylinder{<19.050000,0.038000,10.160000><19.050000,-1.538000,10.160000>0.406400}
cylinder{<19.050000,0.038000,7.620000><19.050000,-1.538000,7.620000>0.406400}
cylinder{<17.780000,0.038000,27.940000><17.780000,-1.538000,27.940000>0.406400}
cylinder{<15.875000,0.038000,29.210000><15.875000,-1.538000,29.210000>0.406400}
cylinder{<17.780000,0.038000,30.480000><17.780000,-1.538000,30.480000>0.406400}
cylinder{<5.080000,0.038000,5.080000><5.080000,-1.538000,5.080000>0.508000}
cylinder{<2.540000,0.038000,5.080000><2.540000,-1.538000,5.080000>0.508000}
cylinder{<2.540000,0.038000,10.160000><2.540000,-1.538000,10.160000>0.508000}
cylinder{<5.080000,0.038000,10.160000><5.080000,-1.538000,10.160000>0.508000}
cylinder{<5.080000,0.038000,15.875000><5.080000,-1.538000,15.875000>0.508000}
cylinder{<2.540000,0.038000,15.875000><2.540000,-1.538000,15.875000>0.508000}
cylinder{<5.080000,0.038000,19.685000><5.080000,-1.538000,19.685000>0.508000}
cylinder{<2.540000,0.038000,19.685000><2.540000,-1.538000,19.685000>0.508000}
cylinder{<5.080000,0.038000,23.495000><5.080000,-1.538000,23.495000>0.508000}
cylinder{<2.540000,0.038000,23.495000><2.540000,-1.538000,23.495000>0.508000}
cylinder{<30.797500,0.038000,15.240000><30.797500,-1.538000,15.240000>0.508000}
cylinder{<30.797500,0.038000,17.780000><30.797500,-1.538000,17.780000>0.508000}
cylinder{<30.797500,0.038000,20.320000><30.797500,-1.538000,20.320000>0.508000}
cylinder{<30.797500,0.038000,22.860000><30.797500,-1.538000,22.860000>0.508000}
cylinder{<20.002500,0.038000,4.127500><20.002500,-1.538000,4.127500>0.508000}
cylinder{<22.542500,0.038000,4.127500><22.542500,-1.538000,4.127500>0.508000}
cylinder{<25.082500,0.038000,4.127500><25.082500,-1.538000,4.127500>0.508000}
cylinder{<27.622500,0.038000,4.127500><27.622500,-1.538000,4.127500>0.508000}
cylinder{<30.162500,0.038000,4.127500><30.162500,-1.538000,4.127500>0.508000}
cylinder{<32.702500,0.038000,4.127500><32.702500,-1.538000,4.127500>0.508000}
cylinder{<30.480000,0.038000,33.020000><30.480000,-1.538000,33.020000>0.406400}
cylinder{<29.210000,0.038000,31.115000><29.210000,-1.538000,31.115000>0.406400}
cylinder{<27.940000,0.038000,33.020000><27.940000,-1.538000,33.020000>0.406400}
cylinder{<32.067500,0.038000,25.400000><32.067500,-1.538000,25.400000>0.406400}
cylinder{<24.447500,0.038000,25.400000><24.447500,-1.538000,25.400000>0.406400}
cylinder{<15.240000,0.038000,2.540000><15.240000,-1.538000,2.540000>0.406400}
cylinder{<15.240000,0.038000,10.160000><15.240000,-1.538000,10.160000>0.406400}
cylinder{<16.510000,0.038000,13.970000><16.510000,-1.538000,13.970000>0.406400}
cylinder{<8.890000,0.038000,13.970000><8.890000,-1.538000,13.970000>0.406400}
cylinder{<8.890000,0.038000,16.510000><8.890000,-1.538000,16.510000>0.406400}
cylinder{<16.510000,0.038000,16.510000><16.510000,-1.538000,16.510000>0.406400}
cylinder{<8.890000,0.038000,19.685000><8.890000,-1.538000,19.685000>0.406400}
cylinder{<16.510000,0.038000,19.685000><16.510000,-1.538000,19.685000>0.406400}
cylinder{<8.890000,0.038000,23.495000><8.890000,-1.538000,23.495000>0.406400}
cylinder{<16.510000,0.038000,23.495000><16.510000,-1.538000,23.495000>0.406400}
cylinder{<24.130000,0.038000,35.560000><24.130000,-1.538000,35.560000>0.406400}
cylinder{<29.210000,0.038000,35.560000><29.210000,-1.538000,35.560000>0.406400}
cylinder{<27.940000,0.038000,27.940000><27.940000,-1.538000,27.940000>0.406400}
cylinder{<33.020000,0.038000,27.940000><33.020000,-1.538000,27.940000>0.406400}
//Bohrungen(schnell)/Durchkontaktierungen
//Bohrungen(schnell)/Platine
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Bestückungsdruck
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,30.607000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.700000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,30.607000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.446000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,30.353000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.700000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,30.607000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.700000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,29.972000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.430000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,29.972000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,29.464000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.160000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,29.464000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,29.972000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.700000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,29.972000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.430000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,27.559000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.430000,0.000000,27.559000> }
difference{
cylinder{<11.430000,0,29.210000><11.430000,0.036000,29.210000>2.616200 translate<0,0.000000,0>}
cylinder{<11.430000,-0.1,29.210000><11.430000,0.135000,29.210000>2.463800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<11.430000,0.000000,28.702000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,27.813000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.590000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,27.813000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.590000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,28.067000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.590000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,27.813000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.336000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,28.448000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.860000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,28.448000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,28.956000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.130000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,28.956000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.590000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,28.448000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.590000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,28.448000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.590000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,30.861000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.860000,0.000000,30.861000> }
difference{
cylinder{<22.860000,0,29.210000><22.860000,0.036000,29.210000>2.616200 translate<0,0.000000,0>}
cylinder{<22.860000,-0.1,29.210000><22.860000,0.135000,29.210000>2.463800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-90.000000,0> translate<22.860000,0.000000,29.718000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.255500,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.319500,0.000000,34.925000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.255500,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.255500,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.255500,0.000000,32.385000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.255500,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.319500,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.255500,0.000000,32.385000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.255500,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.319500,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.319500,0.000000,34.925000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.319500,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<9.207500,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<10.223500,0.000000,33.655000>}
box{<0,0,-0.381000><1.016000,0.036000,0.381000> rotate<0,0.000000,0> translate<9.207500,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<19.367500,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<18.351500,0.000000,33.655000>}
box{<0,0,-0.381000><1.016000,0.036000,0.381000> rotate<0,0.000000,0> translate<18.351500,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.922500,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.287500,0.000000,33.655000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.287500,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.271500,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.271500,0.000000,34.290000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.271500,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.271500,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.287500,0.000000,33.655000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,32.003271,0> translate<13.271500,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.287500,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.763500,0.000000,33.655000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.763500,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.287500,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.271500,0.000000,33.020000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-32.003271,0> translate<13.271500,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.287500,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.287500,0.000000,33.655000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.287500,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.287500,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.287500,0.000000,34.290000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.287500,0.000000,34.290000> }
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-180.000000,0> translate<15.684500,0.000000,33.655000>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-180.000000,0> translate<11.303000,0.000000,33.655000>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-180.000000,0> translate<17.272000,0.000000,33.655000>}
//G1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.540000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.540000,0.000000,28.575000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<2.540000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.540000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.540000,0.000000,33.655000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<2.540000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.905000,0.000000,33.020000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<1.905000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,34.798000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,35.560000>}
box{<0,0,-0.076200><1.077631,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.540000,0.000000,34.798000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,35.560000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.302000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,34.798000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,35.560000>}
box{<0,0,-0.076200><1.077631,0.036000,0.076200> rotate<0,44.997030,0> translate<6.858000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,34.798000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,26.162000>}
box{<0,0,-0.076200><8.636000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.620000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,26.162000>}
box{<0,0,-0.076200><1.077631,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.858000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,25.400000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.302000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,25.400000>}
box{<0,0,-0.076200><1.077631,0.036000,0.076200> rotate<0,44.997030,0> translate<2.540000,0.000000,26.162000> }
difference{
cylinder{<5.080000,0,33.020000><5.080000,0.036000,33.020000>1.346200 translate<0,0.000000,0>}
cylinder{<5.080000,-0.1,33.020000><5.080000,0.135000,33.020000>1.193800 translate<0,0.000000,0>}}
difference{
cylinder{<5.080000,0,27.940000><5.080000,0.036000,27.940000>1.346200 translate<0,0.000000,0>}
cylinder{<5.080000,-0.1,27.940000><5.080000,0.135000,27.940000>1.193800 translate<0,0.000000,0>}}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,0.000000,6.350000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.939000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,24.130000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.781000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,24.130000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.939000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,6.350000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.939000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,6.350000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.876000,0.000000,6.350000> }
object{ARC(1.016000,0.152400,0.000000,180.000000,0.036000) translate<22.860000,0.000000,6.350000>}
//IC2 silk screen
object{ARC(2.666972,0.152400,197.149509,308.247193,0.036000) translate<17.779997,0.000000,29.209500>}
object{ARC(2.666972,0.152400,51.752807,162.850491,0.036000) translate<17.779997,0.000000,29.210500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,27.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,31.305000>}
box{<0,0,-0.076200><4.190000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.431000,0.000000,31.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,26.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,28.924000>}
box{<0,0,-0.076200><1.968000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.034000,0.000000,28.924000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,26.555000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,26.956000>}
box{<0,0,-0.076200><0.401000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.034000,0.000000,26.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,28.924000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,29.496000>}
box{<0,0,-0.076200><0.572000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.034000,0.000000,29.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,31.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,31.865000>}
box{<0,0,-0.076200><0.401000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.034000,0.000000,31.865000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,29.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,31.464000>}
box{<0,0,-0.076200><1.968000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.034000,0.000000,31.464000> }
object{ARC(2.666978,0.152400,162.850518,197.149482,0.036000) translate<17.780000,0.000000,29.210000>}
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.810000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.810000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.810000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.350000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.715000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<5.715000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,6.350000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<1.270000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<1.270000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.270000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,6.350000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,0.000000,6.350000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<5.080000,0.000000,5.080000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<2.540000,0.000000,5.080000>}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,11.430000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,10.795000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,9.525000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.810000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,8.890000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,9.525000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.270000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,10.795000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.270000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,8.890000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<1.270000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,8.890000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,11.430000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.810000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,11.430000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,10.795000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<5.715000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,9.525000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.350000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,8.890000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.715000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,8.890000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,9.525000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.810000,0.000000,9.525000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<2.540000,0.000000,10.160000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<5.080000,0.000000,10.160000>}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,14.605000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,15.240000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.810000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,16.510000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.810000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,17.145000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.810000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,16.510000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.350000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,15.240000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.715000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,17.145000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<5.715000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,17.145000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,14.605000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,14.605000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,15.240000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<1.270000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,16.510000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<1.270000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,17.145000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.270000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,17.145000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,16.510000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,0.000000,17.145000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<5.080000,0.000000,15.875000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<2.540000,0.000000,15.875000>}
//JP4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,18.415000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,19.050000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.810000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,20.320000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.810000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,20.955000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.810000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,20.320000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.350000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,19.050000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.715000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,20.955000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<5.715000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,20.955000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,18.415000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,18.415000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,19.050000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<1.270000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,20.320000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<1.270000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,20.955000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.270000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,20.955000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,20.320000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,0.000000,20.955000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<5.080000,0.000000,19.685000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<2.540000,0.000000,19.685000>}
//JP5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,22.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,22.860000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.810000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,24.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.810000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,24.765000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.810000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,24.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.350000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,22.860000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.715000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,24.765000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<5.715000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,24.765000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,22.225000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,22.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,22.860000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<1.270000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,24.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<1.270000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,24.765000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.270000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,24.765000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,24.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,0.000000,24.765000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<5.080000,0.000000,23.495000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<2.540000,0.000000,23.495000>}
//JP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,19.685000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.527500,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,20.955000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.527500,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,21.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.527500,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,21.590000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.162500,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,20.955000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.432500,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,19.685000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.067500,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,19.050000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.432500,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,15.875000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.527500,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,16.510000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.527500,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,16.510000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.162500,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,15.875000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.432500,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,17.145000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.527500,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,18.415000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.527500,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,19.050000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.527500,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,19.050000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.162500,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,18.415000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.432500,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,17.145000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.067500,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,16.510000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.432500,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,13.970000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.162500,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,13.970000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.527500,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,14.605000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.432500,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,14.605000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.067500,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,23.495000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.527500,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,24.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.527500,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,24.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.162500,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,23.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.432500,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,21.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.527500,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,22.225000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.432500,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,22.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.067500,0.000000,22.225000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<30.797500,0.000000,20.320000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<30.797500,0.000000,17.780000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<30.797500,0.000000,15.240000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<30.797500,0.000000,22.860000>}
//JP7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.987500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.257500,0.000000,5.397500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.987500,0.000000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.257500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.892500,0.000000,4.762500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<28.257500,0.000000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.892500,0.000000,4.762500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.892500,0.000000,3.492500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.892500,0.000000,3.492500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.892500,0.000000,3.492500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.257500,0.000000,2.857500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.257500,0.000000,2.857500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.892500,0.000000,4.762500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,5.397500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.892500,0.000000,4.762500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.797500,0.000000,5.397500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.527500,0.000000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.797500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,4.762500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<30.797500,0.000000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,4.762500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,3.492500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.432500,0.000000,3.492500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,3.492500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.797500,0.000000,2.857500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.797500,0.000000,2.857500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.797500,0.000000,2.857500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,2.857500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.527500,0.000000,2.857500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.527500,0.000000,2.857500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.892500,0.000000,3.492500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<28.892500,0.000000,3.492500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.812500,0.000000,4.762500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.447500,0.000000,5.397500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.812500,0.000000,4.762500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.447500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.717500,0.000000,5.397500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.447500,0.000000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.717500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.352500,0.000000,4.762500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<25.717500,0.000000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.352500,0.000000,4.762500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.352500,0.000000,3.492500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.352500,0.000000,3.492500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.352500,0.000000,3.492500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.717500,0.000000,2.857500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.717500,0.000000,2.857500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.717500,0.000000,2.857500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.447500,0.000000,2.857500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.447500,0.000000,2.857500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.447500,0.000000,2.857500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.812500,0.000000,3.492500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.812500,0.000000,3.492500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.987500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.352500,0.000000,4.762500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.352500,0.000000,4.762500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.352500,0.000000,3.492500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.987500,0.000000,2.857500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<26.352500,0.000000,3.492500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.257500,0.000000,2.857500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.987500,0.000000,2.857500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.987500,0.000000,2.857500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.637500,0.000000,5.397500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.367500,0.000000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.637500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.272500,0.000000,4.762500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.637500,0.000000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.272500,0.000000,4.762500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.272500,0.000000,3.492500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.272500,0.000000,3.492500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.272500,0.000000,3.492500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.637500,0.000000,2.857500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.637500,0.000000,2.857500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.272500,0.000000,4.762500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907500,0.000000,5.397500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.272500,0.000000,4.762500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.177500,0.000000,5.397500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.907500,0.000000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.177500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.812500,0.000000,4.762500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.177500,0.000000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.812500,0.000000,4.762500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.812500,0.000000,3.492500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.812500,0.000000,3.492500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.812500,0.000000,3.492500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.177500,0.000000,2.857500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.177500,0.000000,2.857500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.177500,0.000000,2.857500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907500,0.000000,2.857500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.907500,0.000000,2.857500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907500,0.000000,2.857500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.272500,0.000000,3.492500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.272500,0.000000,3.492500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.732500,0.000000,4.762500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.732500,0.000000,3.492500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.732500,0.000000,3.492500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.732500,0.000000,4.762500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.732500,0.000000,4.762500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.732500,0.000000,3.492500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367500,0.000000,2.857500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.732500,0.000000,3.492500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.637500,0.000000,2.857500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367500,0.000000,2.857500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.367500,0.000000,2.857500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.337500,0.000000,5.397500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.067500,0.000000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.337500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.972500,0.000000,4.762500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<33.337500,0.000000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.972500,0.000000,4.762500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.972500,0.000000,3.492500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.972500,0.000000,3.492500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.972500,0.000000,3.492500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.337500,0.000000,2.857500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.337500,0.000000,2.857500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,4.762500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.432500,0.000000,4.762500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.432500,0.000000,3.492500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,2.857500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.432500,0.000000,3.492500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.337500,0.000000,2.857500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.067500,0.000000,2.857500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.067500,0.000000,2.857500> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<30.162500,0.000000,4.127500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<27.622500,0.000000,4.127500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<25.082500,0.000000,4.127500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<22.542500,0.000000,4.127500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.002500,0.000000,4.127500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<32.702500,0.000000,4.127500>}
//Q1 silk screen
object{ARC(2.413000,0.152400,246.318150,293.681850,0.036000) translate<29.210000,0.000000,33.020000>}
object{ARC(2.412984,0.152400,293.682096,407.464096,0.036000) translate<29.209697,0.000000,33.019984>}
object{ARC(2.412984,0.152400,132.535904,246.317904,0.036000) translate<29.210303,0.000000,33.019984>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.841000,0.000000,34.798000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.579000,0.000000,34.798000>}
box{<0,0,-0.076200><3.262000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.579000,0.000000,34.798000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<24.447500,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<25.336500,0.000000,25.400000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<24.447500,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<32.067500,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<31.178500,0.000000,25.400000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<31.178500,0.000000,25.400000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.543500,0.000000,24.638000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.543500,0.000000,26.162000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<25.971500,0.000000,26.162000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<25.971500,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.797500,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.797500,0.000000,24.638000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.797500,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.543500,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,24.384000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.162500,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.035500,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,24.384000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<30.035500,0.000000,24.511000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.543500,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,26.416000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.162500,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.035500,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.162500,0.000000,26.416000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.035500,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.479500,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.352500,0.000000,24.384000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.352500,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.479500,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.035500,0.000000,24.511000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.479500,0.000000,24.511000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.479500,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.352500,0.000000,26.416000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<26.352500,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.479500,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.035500,0.000000,26.289000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.479500,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.971500,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.352500,0.000000,24.384000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.971500,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.971500,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.352500,0.000000,26.416000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.971500,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.717500,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.717500,0.000000,24.638000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.717500,0.000000,24.638000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<25.527000,0.000000,25.400000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<30.988000,0.000000,25.400000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<15.240000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<15.240000,0.000000,9.271000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<15.240000,0.000000,9.271000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<15.240000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<15.240000,0.000000,3.429000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<15.240000,0.000000,3.429000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<14.478000,0.000000,4.064000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<16.002000,0.000000,4.064000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<16.002000,0.000000,8.636000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<14.478000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,3.810000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.478000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,4.445000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.224000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,4.445000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.224000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,4.445000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.256000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,4.445000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<16.129000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,8.255000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<14.224000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,4.572000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.351000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,8.255000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.129000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,4.572000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.129000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,8.255000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.224000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,8.255000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.256000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,8.890000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.478000,0.000000,8.890000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<15.240000,0.000000,9.080500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<15.240000,0.000000,3.619500>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<8.890000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<9.779000,0.000000,13.970000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<8.890000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<16.510000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<15.621000,0.000000,13.970000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<15.621000,0.000000,13.970000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<14.986000,0.000000,13.208000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<14.986000,0.000000,14.732000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<10.414000,0.000000,14.732000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<10.414000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,13.208000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.240000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,12.954000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,12.954000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<14.478000,0.000000,13.081000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,14.986000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,14.859000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,14.986000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.478000,0.000000,14.859000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,12.954000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.795000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,13.081000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.922000,0.000000,13.081000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,14.859000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,14.986000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<10.795000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,14.859000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,14.859000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.922000,0.000000,14.859000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,12.954000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.414000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,14.986000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.414000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,13.208000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.160000,0.000000,13.208000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<9.969500,0.000000,13.970000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<15.430500,0.000000,13.970000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<16.510000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<15.621000,0.000000,16.510000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<15.621000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<8.890000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<9.779000,0.000000,16.510000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<8.890000,0.000000,16.510000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<10.414000,0.000000,17.272000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<10.414000,0.000000,15.748000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<14.986000,0.000000,15.748000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<14.986000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,17.272000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.160000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,17.526000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.414000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,17.526000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<10.795000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,15.494000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.414000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,15.494000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.795000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,17.526000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.478000,0.000000,17.399000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,17.399000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.922000,0.000000,17.399000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,15.494000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<14.478000,0.000000,15.621000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,15.621000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.922000,0.000000,15.621000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,17.526000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,15.494000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,17.272000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.240000,0.000000,17.272000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<15.430500,0.000000,16.510000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<9.969500,0.000000,16.510000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<16.510000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<15.621000,0.000000,19.685000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<15.621000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<8.890000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<9.779000,0.000000,19.685000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<8.890000,0.000000,19.685000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<10.414000,0.000000,20.447000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<10.414000,0.000000,18.923000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<14.986000,0.000000,18.923000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<14.986000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,20.447000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.160000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,20.701000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.414000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,20.701000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<10.795000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,18.669000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.414000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,18.669000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.795000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,20.701000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.478000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,20.574000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.922000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,18.669000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<14.478000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,18.796000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.922000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,20.701000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,18.669000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,20.447000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.240000,0.000000,20.447000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<15.430500,0.000000,19.685000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<9.969500,0.000000,19.685000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<16.510000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<15.621000,0.000000,23.495000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<15.621000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<8.890000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<9.779000,0.000000,23.495000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<8.890000,0.000000,23.495000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<10.414000,0.000000,24.257000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<10.414000,0.000000,22.733000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<14.986000,0.000000,22.733000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<14.986000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,24.257000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.160000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,24.511000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.414000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,24.511000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<10.795000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,22.479000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.414000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,22.479000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.795000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,24.511000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.478000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,24.384000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.922000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,22.479000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<14.478000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,22.606000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.922000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,24.511000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,22.479000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,24.257000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.240000,0.000000,24.257000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<15.430500,0.000000,23.495000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<9.969500,0.000000,23.495000>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<29.210000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<28.702000,0.000000,35.560000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<28.702000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<24.130000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<24.638000,0.000000,35.560000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<24.130000,0.000000,35.560000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<25.146000,0.000000,36.195000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<25.146000,0.000000,34.925000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<28.194000,0.000000,34.925000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<28.194000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.892000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.892000,0.000000,36.195000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.892000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,36.449000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.146000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,36.449000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<25.400000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,34.671000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.146000,0.000000,34.671000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,34.798000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,34.671000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.400000,0.000000,34.671000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,36.449000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.813000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,36.322000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.527000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,34.798000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,34.671000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<27.813000,0.000000,34.798000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,34.798000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,34.798000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.527000,0.000000,34.798000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.194000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,36.449000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.940000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.194000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,34.671000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.940000,0.000000,34.671000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.448000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.448000,0.000000,36.195000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.448000,0.000000,36.195000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<24.765000,0.000000,35.560000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<28.575000,0.000000,35.560000>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<33.020000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<32.512000,0.000000,27.940000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<32.512000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<27.940000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<28.448000,0.000000,27.940000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<27.940000,0.000000,27.940000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<28.956000,0.000000,28.575000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<28.956000,0.000000,27.305000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<32.004000,0.000000,27.305000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<32.004000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.702000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.702000,0.000000,28.575000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.702000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,28.829000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.956000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,28.829000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<29.210000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,27.051000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.956000,0.000000,27.051000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,27.051000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.210000,0.000000,27.051000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,28.829000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.623000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,28.702000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.337000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,27.051000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<31.623000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,27.178000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.337000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,28.829000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.750000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,27.051000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.750000,0.000000,27.051000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,28.575000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.258000,0.000000,28.575000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<28.575000,0.000000,27.940000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<32.385000,0.000000,27.940000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  XPARK(-18.250000,0,-19.045000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//G1	AB9V	AB9V
