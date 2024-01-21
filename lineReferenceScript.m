figure;
hold on;
view(-45,45)
xlim([0 2]);
ylim([0 2]);

% straight lines up
p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);

% bottom cuboid lines
p3 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
p4 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);

% top cuboid lines
p3 = plot3([0 0],[0 1],[2 2],'k','LineWidth',5);
p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);

p_midline = plot3([0,1],[1,0],[1,1],'k','LineWidth',5);



