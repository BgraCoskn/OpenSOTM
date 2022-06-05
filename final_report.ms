.ce
\f[R]\s+2 KOCAELI UNIVERSITY
.br
  
.br
.ce
MECHATRONICS ENGINEERING
\f[]
.br
.PSPIC -C "img/koulogo.eps" 1.3

.ce
\f[R]\s <COURSE NAME>
.br
  
.br
.ce
FINAL REPORT
\f[]

.TL
Open Source General Purpose 2-Axis Satcom-on-the-Move Pedestal for Ku Band Antennas
\f[]

.br
.br

.R
\f[R]\s+1 Project Group
\f[]
.AU
\s+2 Buğra Coşkun
\s-2 180223028    +905072737619    bgra.coskn@gmail.com

\s+2 Akanji Leonel
\s-2 117022308    +900000000000    emailemail.com

\s+2 Evliya Arslan
\s-2 140224016    +900000000000    emailemail.com










.R
06.22, KOCAELI, TURKEY

.nr PS 12p \" set the font size to 12p
.nr HY 0
.nr MINGW 0.5n \" Minimum gutter width
.nr e 0 1 \" Equation counter for tags
.nr f 0 1 \" Figure counter
.1C 
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

.bp
.ce
This page is intentionally left blank.
.bp

.ce
\f[I] ABSTRACT \f[]

.PP
In this project we have designed and constructed a low cost and open source
hardware, general purpose 2-axis satcom-on-the-move stabilized tracking mount
that can also be used to house different apparatus that needs similar tracking
and disturbance rejection capabilities. For disturbance rejection we have used
a 6 DoF strapped down IMU, but the algorithm itself was designed for 10 DoF 
IMUs with integrated magnetometer sensors for absolute orientation data. Alas
for budget concerns we have opted to go with using dead-reckoning from a 
calibrated position at epoch. Using this method we have achieved acceptable 
results that suffice for a proof-of-concept prototype. The current results
focus on the disturbance rejection i.e. gimbal capabilities of the mount as
most Ku-Band satellites of concern for SOTM terminals are usually in geostationary
orbit while the pedestal design itself is capable of tracking low-earth-orbit
satellites if more precise and more rigid mechanical components are used and
tracking coordinates as azimuth and elevation angles are calculated. The 
pedestal employs parts that are optimized for additive manufacturing and to be
coupled with standard and easy to acquire parts for easy assembly, 
extensibility and repair. One of the main goals of this project was to create
a platform in which anybody that can acquire the parts can build a pedestal 
for any tracking and disturbance rejection application while freely modifying
and building on the design. As we openly distribute the design files and 
details of this project we believe we have completed this crucial goal.



.ce
\f[I] ÖZ \f[]

.PP
Bu projede düşük bütçe ve açık kaynakk olarak genel kullanıma uygun 2-eksenli 
bir mobil uydu terminalini yaptık. Farklı takip ve dengeleme aplikasyonları
bütçe ve açık kaynak olarak 

.bp

.SH
ACKNOWLEDGEMENTS

.SH
TABLE OF CONTENTS

.SH
LIST OF TABLES

.SH
LIST OF FIGURES

.SH
LIST OF ABREVIATIONS

.NH 1
LITERATURE SURVEY

.NH 1
PROBLEM DEFINITION AND DESIGN SPECIFICATIONS

.NH 1
CONCEPTUAL DESIGN

.NH 2
Parts Design

.NH 2
Control Approach

.NH 2
3D Renders

.NH 1
DETAIL DESIGN

.NH 2
Control Algorithm

.NH 2
3D Printed Parts

.NH 2
Parts List

.NH 2
Electronics and Control System

.NH 2
Process of Assembly and Methods Used

.NH 2
Constructed Prototype

.SH
CONCLUSIONS AND FUTURE STUDIES

.SH
REFERENCES

.SH
APPENDIX

