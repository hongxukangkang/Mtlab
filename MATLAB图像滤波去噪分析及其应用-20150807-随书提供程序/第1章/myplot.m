function myplot(x,y,z,Tri,CData)
% Èý½ÇÍø¸ñ
cla;
CData = min(max(CData,0),1);
patch('Faces',Tri,'Vertices',[x,y,z],'FaceVertexCData',CData,...
   'FaceColor','interp','EdgeColor','none');
hold on;
end