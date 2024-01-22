function [] = plotSyllables(ipa_string)

spaces_between_letters = 1;
letter_space_scale = 1.1;
z_limits = [-1.5,2.5];
xy_limits = [0,2];
flipped = 1;
theta = 0:pi/50:2*pi;

if spaces_between_letters
    letter_shift = letter_space_scale;
else letter_shift = 1;
end

[all_consonants,all_vowels,all_orders] = parseSyllables(ipa_string);



clf;
hold on;
view(-45,45)
xlim([0,2]); ylim([0,2])

for i = 1:size(all_consonants,1)
   
    [x,y,z] = constructSyllable(all_consonants(i,:),all_vowels(i,:),flipped);
    x = x + (i-1)*letter_shift;
    y = y - (i-1)*letter_shift;
    plot3(x,y,z,'k','LineWidth',5)
    if flipped
        hold on;
        %circlex = 0.1*(xy_limits(2)-xy_limits(1))*cos(theta); circley = 0.1*(z_limits(2)-z_limits(1))*sin(theta);
        circlex = 0.1*cos(theta); circley = 0.1*(1/cosd(45))*sin(theta) - 0.1; % reduce y centre to move downwards! % 1/cos45 corrects for the angle of the camera!
        p = plot3(circlex,circley,zeros(size(circlex)),'k','LineWidth',3);
        rotate(p,[0,0,1],-45,[0,0,0])
        view(-45,45)
        xlim([-1,2]); ylim([-1,2])
        zlim([-1.5 2.5])
    end
    
end

if ~spaces_between_letters
    xlim([-1,2+(i-1)]); ylim([-1+(i-1),2]);
else
    xlim([-1,2+letter_space_scale*(i-1)]); ylim([-(i-1)*letter_space_scale,2]);
end 
zlim([-1.5 2.5])

axis square
axis off