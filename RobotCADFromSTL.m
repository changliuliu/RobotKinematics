% This file provides an example on how to get .mat robot model from .stl
% file. 'filename' should be changed to the path to your stl files. Kinova
% robots use a different reference frame from Fanuc robot. Specifically,
% the Kinova robots' reference frame located at the latter joint. And the
% Fanuc robot's reference frame located at the former joint. To shift the 
% reference frame from latter joint to former joint. We need to modify the
% original reference frame for each components first. Then we should
% calculate a new set of D-H parameters based on the modified reference
% frames.
%
% Function 'stlread' is available at
%   https://www.mathworks.com/matlabcentral/fileexchange/29906-binary-stl-file-reader


base={};link={};
prefix=pwd;
filename=[prefix,'/meshes/base_link.STL'];
[v, f, n, c, stltitle]=stlread(filename);
base{1}.v = v;
base{1}.f = f;
base{1}.n = n;
base{1}.c = c;
base{1}.color = 'w';

i = 1;
filename=[prefix,'/meshes/shoulder_link.STL'];
[v, f, n, c, stltitle]=stlread(filename);
link{i}.v = v;
link{i}.f = f;
link{i}.n = n;
link{i}.c = c;
link{i}.color = 'w';

for j=1:size(v,1)
    link{i}.v(j,:) = link{i}.v(j,:) + [0,0,0.1284];
end

for j=1:size(v,1)
    link{i}.v(j,:) = link{i}.v(j,[1,3,2]);
    link{i}.v(j,2) = link{i}.v(j,2);
    link{i}.v(j,3) = -link{i}.v(j,3);
end

i = 2;
filename=[prefix,'/meshes/half_arm_1_link.STL'];
[v, f, n, c, stltitle]=stlread(filename);
link{i}.v = v;
link{i}.f = f;  
link{i}.n = n;
link{i}.c = c;
link{i}.color = 'w';

for j=1:size(v,1)
    link{i}.v(j,1) = -link{i}.v(j,1);
    link{i}.v(j,3) = -link{i}.v(j,3);
    link{i}.v(j,:) = link{i}.v(j,[1,3,2]);
end


i = 3;
filename=[prefix,'/meshes/half_arm_2_link.STL'];
[v, f, n, c, stltitle]=stlread(filename);
link{i}.v = v;
link{i}.f = f;
link{i}.n = n;
link{i}.c = c;
link{i}.color = 'w';

for j=1:size(v,1)
    link{i}.v(j,2) = -link{i}.v(j,2);
    link{i}.v(j,:) = link{i}.v(j,[1,3,2]);
    link{i}.v(j,:) = link{i}.v(j,:) + [0, 0.2104, -0.0064];
end

i = 4;
filename=[prefix,'/meshes/forearm_link.STL'];
[v, f, n, c, stltitle]=stlread(filename);
link{i}.v = v;
link{i}.f = f;
link{i}.n = n;
link{i}.c = c;
link{i}.color = 'w';

for j=1:size(v,1)
    link{i}.v(j,:) = link{i}.v(j,[1,3,2]);
end

i = 5;
filename=[prefix,'/meshes/spherical_wrist_2_link.STL'];
[v, f, n, c, stltitle]=stlread(filename);
link{i}.v = v;
link{i}.f = f;
link{i}.n = n;
link{i}.c = c;
link{i}.color = 'w';

for j=1:size(v,1)
    link{i}.v(j,3) = -link{i}.v(j,3);
    link{i}.v(j,2) = -link{i}.v(j,2);
    link{i}.v(j,:) = link{i}.v(j,:) + [0, 0, -0.0064];
end

i = 6;
filename=[prefix,'/meshes/spherical_wrist_1_link.STL'];
[v, f, n, c, stltitle]=stlread(filename);
link{i}.v = v;
link{i}.f = f;
link{i}.n = n;
link{i}.c = c;
link{i}.color = 'w';

for j=1:size(v,1)
    link{i}.v(j,3) = -link{i}.v(j,3);
    link{i}.v(j,2) = -link{i}.v(j,2);
    link{i}.v(j,:) = link{i}.v(j,:) + [0, 0, -0.1059];
end


save('figure/KinovaGen3.mat', 'base','link')