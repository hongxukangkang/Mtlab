function coloraxis(Name,Type,h)
% œ‘ æ¥Û–°
FontSize = 14;

switch Type
case 1
   set(text(-0.25,-1.3,1.1,Name),'FontWeight','bold',...
      'FontSize',FontSize,'Color',[0,0,0]);
   t = linspace(0,pi*3/2,60);
   x = cos(t)*1.1;
   y = sin(t)*1.1;
   set(plot3(x,y,zeros(size(x)),'k-'),'LineWidth',2.5,'Color',[1,1,1]*0.8);
   x = [x,-0.1,0,-0.1];
   y = [y,-1.05,-1.1,-1.15];
   set(plot3(x,y,ones(size(x)),'k-'),'LineWidth',2.5);   
case 2
   set(text(0,-0.6,0.15,Name),'FontWeight','bold','FontSize',FontSize,'Color',[0,0,0]);
   set(plot3([-0.05,0,0.05,0,0],[-0.9,-1,-0.9,-1,0],[0,0,0,0,0],'k-'),'LineWidth',2.5);
case 3
   set(text(0,0.15,1.3,Name),'FontWeight','bold','FontSize',FontSize,'Color',[0,0,0]);
   set(plot3([0,0,0,0,0],[-0.05,0,0.05,0,0],[1.6,1.7,1.6,1.7,0],'k-'),'LineWidth',2.5);
case 4
   set(text(0,0.15,2.4,Name),'FontWeight','bold','FontSize',FontSize,'Color',[0,0,0]);
   set(plot3([0,0,0,0,0],[-0.05,0,0.05,0,0],[2.4,2.5,2.4,2.5,0],'k-'),'LineWidth',2.5);
case 5
   set(text(0.6,0,h+0.15,Name),'FontWeight','bold','FontSize',FontSize,'Color',[0,0,0]);
   set(plot3([0.9,1,0.9,1,-1,-0.9,-1,-0.9],[-0.05,0,0.05,0,0,-0.05,0,0.05],...
      zeros(1,8)+h,'k-'),'LineWidth',2.5);
case 6
   set(text(0,0.6,h+0.15,Name),'FontWeight','bold','FontSize',FontSize,'Color',[0,0,0]);
   set(plot3([-0.05,0,0.05,0,0,-0.05,0,0.05],[0.9,1,0.9,1,-1,-0.9,-1,-0.9],...
      zeros(1,8)+h,'k-'),'LineWidth',2.5);
end
end