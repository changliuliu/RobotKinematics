% This file provides an example on how to get .mat robot model from .stl
% file. 'filename' should be changed to the path to your stl files.
%
% Function 'stlread' is available at
%   https://www.mathworks.com/matlabcentral/fileexchange/22409-stl-file-reader


base={};link={};
prefix=pwd;
% The base
filename=[prefix,'/figure/seperate parts/J1BASE_UNIT_0_ver2.stl'];
[v, f, n, c, stltitle]=stlread(filename);
base{1}.v = v;
base{1}.f = f;
base{1}.n = n;
base{1}.c = c;
base{1}.color = 'k';

i = 2;
filename=[prefix,'/figure/seperate parts/J2ARM_UNIT_ver2.stl'];
[v, f, n, c, stltitle]=stlread(filename);
link{i}.v = v;
link{i}.f = f;
link{i}.n = n;
link{i}.c = c;
link{i}.color = 'y';

i = 1;
filename=[prefix,'/figure/seperate parts/J2BASE_UNIT_0_ver2.stl'];
[v, f, n, c, stltitle]=stlread(filename);
link{i}.v = v;
link{i}.f = f;
link{i}.n = n;
link{i}.c = c;
link{i}.color = 'y';

i = 4;
filename=[prefix,'/figure/seperate parts/J3ARM_UNIT_ver2.stl'];
[v, f, n, c, stltitle]=stlread(filename);
link{i}.v = v;
link{i}.f = f;
link{i}.n = n;
link{i}.c = c;
link{i}.color = 'y';

i = 3;
filename=[prefix,'/figure/seperate parts/J3HOUSING_UNIT_0_ver2.stl'];
[v, f, n, c, stltitle]=stlread(filename);
link{i}.v = v;
link{i}.f = f;
link{i}.n = n;
link{i}.c = c;
link{i}.color = 'y';

i = 5;
filename=[prefix,'/figure/seperate parts/WRIST_UNIT_0_ver3.stl'];
[v, f, n, c, stltitle]=stlread(filename);
link{i}.v = v;
link{i}.f = f;
link{i}.n = n;
link{i}.c = c;
link{i}.color = 'y';
for j=1:size(v,1)
    link{i}.v(j,:) = link{i}.v(j,[1,3,2]);
end