.nr RF "hello"
.TL
General Purpose SATCOM on the Move Two-Axis Gimbal System for Low Altitude
Applications 
.br
\f[I]\s-2 Progress Report 1
15.04.22\f[]
.AU
Buğra Coşkun - 180223028
Akanji Leonel - 170223087
Evliya Arslan - 140224016
.RF
.AI
\f[B]Kocaeli University, Dep. of Engineering, 
Mechatronics Engineering\f[]
.AE
.nr RF test
.nr PS 12p \" set the font size to 10p
.nr GROWPS 3
.nr HY 0
.nr MINGW 0.5n \" Minimum gutter width
.nr e 0 1 \" Equation counter for tags
.nr f 0 1 \" Figure counter
.2C 
.de sub \" In text subscript macro
\s-3
\h'-0.4'\d\\$1\u
\s+3
.end
..
\" If any of the macros go out of whack check the trailing whitespaces!
\" \h request only works when used with on the line its supposed to affect.
.de sup \" In text superscript macro
\s-3
\u\\$1\d
\s+3
.end
..
.de dot \" Dot macro for putting dots on the start of the texts.
\[char46]
.end
..
.de eqt \" Equation numbering
.sp -1
.tl ' ' '(\\$1)'
.end
..
\" construct because sign, used with \*b
.ds b \v'0.16' \v'-0.4'\[pc]\v'0.4'\[pc]\v'-0.4'\[pc]\v'0.4' \v'-0.16'
.ds d \[char46] \" dot, for using it in line starts as well
.sp -4
.SH 
\f[I] Note From Buğra Coşkun \f[]
.LP
This project is heavily inspired from my current project and past experiences 
I had the privilege of acquiring as a part of Profen Communication 
Technologies R&D Center working as a control engineer. As such the technical
details and design similarities must be first confirmed with the appropriate
authorities in the company before I share them in these reports and open source
platform. Thus there might be details that are left off in the progress and 
project reports but me and my group will work hard to fill in the gaps.
.NH 1 
Introduction
.PP
In our project we aspire to create an open source hardware satcom on the move
system for a wide range of applications. As the frequency and bandwidth of
satellite communication increases the radiation pattern shrinks to sub degree
orientations which in turn necessitates the employment of robotic pedestals
that can track the satellite and reject outside disturbances. There has not 
been many research to practical design of such systems and most of the research
that goes into such systems are kept behind few company walls. As such we work
to create a practical gimbal system that can support a relatively medium sized
antenna from low-cost and easily accessible parts.
.NH 1
Purpose
.PP
The end-goal of this project is the creation of an open source hardware system
that can track GEO (geostationary), LEO (low earth orbit) and MEO (medium earth
orbit) satellites using their TLE (two line keplerian elements set) by means
of cancelling out orientation changes of the host vehicle while simultaneously
updating azimuth and elevation coordinates of the satellite and tracking it.
For our current goal as a part of this research project we aspire to complete
the prototype that can support a 30cm parabolic antenna and orient it using 
two axis mounted in spherical coordinate orientations while cancelling out the
orientation disturbances under the pedestal i.e. vehicle movement.
.NH 1
General Contributions
.PP
The hopeful future contributions of this project is the widescale distribution
of an open source hardware SOTM (Satcom on the move) construction guide,
tracking algorithm, parts data and all other relevant information for the 
creation of such system to help organizations, companies and individuals to
meet their needs whatever they may be.
.bp
.NH 1
Work Plan

.LP
.CW
.SM
[1]Tracking and disturbance rejection algorithm

[2]Material selection and 3D Cad model

[3]Electronic schematics and component selection

[4]Writing the control program

[5]Separate hardware tests

[6]Prototype integration

[7]Hardware in the loop test

[8]Performance analysis

[9]Finalization

.NH 1
Team

.LP
Buğra Coşkun,
.I
        Project lead, 
        Control algorithm,
        Satcom and RF systems,
        Prototype integration
        Performance analysis
.R

Akanji Leonel
.I
        Embedded programming,
        Interface design,
        Electronics design
.R

Evliya Arslan
.I
        Mechanical design,
        Materials selection,
        Prototype QA and documentation

.NH 1 
Material Selection
.LP
.SM
Material for construction: Pure PLA for high rigidity

Material for high temperature areas: Aliminium or ABS

Motor selection: Nema 23 Stepper Motors

Motor drivers: TB6600

Power transfer component: Timing belts

Control unit: Raspberry Pi Pico with Micropython Firmware

Orientation sensor: Adafruit IMU (Exact model will be decided depending stocks)

Antenna: Mesh parabolic antenna with X band LNB
.NH 1
Prototype and Experiments

.PP
.I
These experiments and simulations are copied over from my (BC) paper for 
Velocity Control Method for Two-Axis Sotm Antenna.
.NH 2
Algorithm Test
.PP
For assuring ourselves that the calculations we have performed are free of
errors we need to simulate a proper scenario. To achieve this without relying
on any proprietary software and/or toolboxes we need to first numerically  
define the basic limits of our system such as the maximum angular acceleration 
and angular rate allowed. Luckily by just defining the angular accelerations
and deriving to get the angular rates about the principal axes of the vehicle
we are able to do just that. For this application we produce angular velocities
that are 120 degrees apart in phase and sinusoidal.

.EQ
    gsize 11
    alpha = dot max ( alpha ) cos ( a t + b )
.EN
.eqt \n+e
.EQ
    omega = int alpha ~ dt = max ( alpha ) int cos ( a t + b ) ~ dt
.EN
.eqt \n+e
.EQ
    = max ( alpha ) ~ left [ 1 over a sin ( a t + b ) + C right ] 
.EN
.eqt \n+e
.EQ
    \[tf] ~ max ( omega ) = { max ( alpha ) } over a + C max ( alpha )
.EN
.eqt \n+e
.EQ
    C = dot 0 ~~~ \[rA] ~~~ a max ( omega ) = max ( alpha ) 
.EN
.eqt \n+e

.LP
As this is just a test to see if the basic algorithm is accurate we can be
satisfied with disturbance of equal amplitude and 2\[*p]/3 radians apart in
phase. A small side note: coordinate axes can be represented by enumeration
them as 1,2,3 for x,y,z respectively.

.EQ
    alpha sub i = dot max ( alpha sub i ) 
    cos left [ a sub i t + {2 pi} over 3 (i-1) right ]
.EN
.eqt \n+e
.EQ
    \[tf] ~ omega sub v,i = left ( { max ( alpha sub i ) } over a sub i right )
    sin left [ a sub i t + {2 pi} over 3 (i-1) right ]
.EN

.eqt \n+e
.LP
So we can use the angular rates to calculate the propagated orientation matrix
according to the convention used by XSENS[x].

.EQ
    R sub v = R sub z ( psi ) R sub y ( theta ) R sub x ( phi ) ~~ \[rA]
.EN
.eqt \n+e
.EQ
    R' sub v = dot R sub z ( psi + omega sub v,z dt ) 
    R sub y ( theta + omega sub v,y dt ) R sub x ( phi + omega sub v,x dt)
.EN

.eqt \n+e

.LP
Using the propagated orientation matrix and the angular rates we have used to
propagate that said matrix we follow the algorithm we have constructed before
to calculate the angular rate we want the motors to have. Because that we are
working with an ideal system right now we will assume that the motor rates will
be whatever we define them to be.
.PSPIC -C "img/vehicle_angles.eps"
.SM
.I
.ce
Figure \n+f: Vehicle Euler Angles 
.LP
As such we add the true angular rate the LOSv
vector is doing about the axes of the vehicle frame and the reference velocity
we produce using a PID approach from the position error. Vehicle euler angles
in the simulation is given in figure 4 while LOSl vector and manipulator angles
are given in figure 5 and the position error is given in figure 6.
.PSPIC -C "img/manipulator_and_losv_angles.eps"
.SM
.I
.ce
Figure \n+f: Tracking Results
.PSPIC -C "img/tracking_error.eps"
.I
.ce
Figure \n+f: Tracking Error
