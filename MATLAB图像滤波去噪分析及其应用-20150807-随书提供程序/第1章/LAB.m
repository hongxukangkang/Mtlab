function LAB
clc,clear,close all
warning off
feature jit off

   [x,y,z,Tri] = makeshape('Blobs');
   load CData_LAB.mat
   myplot(x,y,2*z,Tri,CData);
   coloraxis('L*',4);
   coloraxis('a*',5,2); 
   coloraxis('b*',6,2); 
axis equal;
axis off;
pbaspect([1,1,1]);
view(70,27);
rotate3d on;
end

function [x,y,z,Tri] = makeshape(Shape)
% 3D立方形 Cube
N = 12;    % Vertices per edge
% 立方形参数
Nth = 25; Nr = 4;  Nz = 8; 

   Nz = 47;
   [u,v] = meshgrid(linspace(0,2*pi,Nth),linspace(0,1,Nz));
   Tri = trigrid(Nth,Nz);
   r = sin(v(:)*pi*3).^2.*(1 - 0.6*abs(2*v(:) - 1));
   x = r.*cos(u(:));
   y = r.*sin(u(:));
   z = v(:);   
end