lc=50.000000;
Point(1)={-3000.000000, -3000.000000, 0, lc};
Point(2)={4000.000000, -3000.000000, 0, lc};
Point(3)={4000.000000, 5000.000000, 0, lc};
Point(4)={-3000.000000, 5000.000000, 0, lc};
Line(1) = {1,2} ;
Line(2) = {3,2} ;
Line(3) = {3,4} ;
Line(4) = {4,1} ;
Line Loop(5) = {4,1,-2,3} ; 
Plane Surface(6) = {5} ; 
Point(5)={800.000000,1000.000000,0.000000,5.000000};
Point(6)={200.000000,1000.000000,0.000000,5.000000};
Point(7)={600.000000,1000.000000,0.000000,5.000000};
Point(8)={400.000000,1000.000000,0.000000,5.000000};
out0[]=Extrude {0, 0, -5000.000000} { Surface {6};};
Point{5, 6, 7, 8} In Surface{6};
Physical Volume("volume-1") = {1} ;
Physical Surface("Top") = { -6 };
Physical Surface("Bottom") = { -out0[0] };
Physical Surface("Left") = { -out0[2] };
Physical Surface("Right") = { -out0[4] };
Physical Surface("Front") = { -out0[5] };
Physical Surface("Back") = { -out0[3] };
Field[1] = Box;
Field[1].VIn=lc;
Field[1].VOut=5*lc;
Field[1].XMax=1000.000000;
Field[1].XMin=0;
Field[1].YMax=2000.000000;
Field[1].YMin=0;
Field[1].ZMax=0;
Field[1].ZMin=-2000.000000;
Field[2] = Attractor;
Field[2].NodesList = {5, 6, 7, 8};
Field[3] = Threshold;
Field[3].IField = 2;
Field[3].LcMin = lc / 5;
Field[3].LcMax = 100*lc;
Field[3].DistMin = 50;
Field[3].DistMax = 100;
Field[4] = Min;
Field[4].FieldsList = {1, 3};
Background Field = 4;
Mesh.CharacteristicLengthExtendFromBoundary = 0;
