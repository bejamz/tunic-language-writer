function [] = plotSyllables(ipa_string)

spaces_between_letters = 1;
letter_space_scale = 1.1;
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
   
    [x,y,z] = constructSyllable(all_consonants(i,:),all_vowels(i,:),0);
    x = x + (i-1)*letter_shift;
    y = y - (i-1)*letter_shift;
    plot3(x,y,z,'k','LineWidth',5)
    
end

if ~spaces_between_letters
    xlim([0,2+(i-1)]); ylim([-(i-1),2]);
else
    xlim([0,2+letter_space_scale*(i-1)]); ylim([-(i-1)*letter_space_scale,2]);
end 
zlim([-1.5 2.5])

axis off