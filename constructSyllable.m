function [x,y,z] = constructSyllable(consonant,vowel,flipped)

%% Match the vowels first

%p_midline = plot3([0,1],[1,0],[1,1],'k','LineWidth',5);
%{
if ~isempty(vowel)
    switch vowel

        case 'e?' % e? = "ay" as in wait
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            xvow = [0,1];
            yvow = [1,1];
            zvow = [2,2];

        case 'a?' % 'a?' as in light, my
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            xvow = [1,1];
            yvow = [0,1];
            zvow = [2,2];

        case '??' % ?? as in boy
            %p8 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            xvow = [0,0];
            yvow = [0,1];
            zvow = [0,0];

        case 'a?' % a? as in power, ow
            %p8 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,1];
            yvow = [0,0];
            zvow = [0,0];

        case {'?','??'} % as in father, far, arrr
            %p8 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            %p8 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            xvow = [0,0;0,1;0,1;1,1];
            yvow = [0,1;0,0;1,1;0,1];
            zvow = [0,0;0,0;2,2;2,2];

        case '?'
            %p8 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            %p8 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,1];
            yvow = [0,1;0,0];
            zvow = [0,0;0,0];

        case '?' % uh as in but, up.  (may also include uh as in the vague enlgish vowel in the game but not sure)
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            xvow = [0,1;1,1];
            yvow = [1,1;0,1];
            zvow = [2,2;2,2];

        case '?' % -o- as in stop
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1];
            yvow = [1,1;1,1;1,1];
            zvow = [1,2;0,1;2,2];

        case 'æ'
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1;1,1];
            yvow = [1,1;1,1;1,1;0,1];
            zvow = [1,2;0,1;2,2;2,2];

        case 'u?' % u? = oo, as in shoot
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            %p4 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1;1,1;0,0];
            yvow = [1,1;1,1;1,1;0,1;0,1];
            zvow = [1,2;0,1;2,2;2,2;0,0];

        case 'e?' % e? = 'oh' as in 'show' (this may also be 'oh' as in hold, but some stylise this as o?...)
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            %p4 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1;1,1;0,0;0,1];
            yvow = [1,1;1,1;1,1;0,1;0,1;0,0];
            zvow = [1,2;0,1;2,2;2,2;0,0;0,0];

        case {'i','i?'}
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p4 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1;0,0;0,1];
            yvow = [1,1;1,1;1,1;0,1;0,0];
            zvow = [1,2;0,1;2,2;0,0;0,0];

        case 'e'
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p4 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,0;0,1];
            yvow = [1,1;1,1;0,1;0,0];
            zvow = [1,2;0,1;0,0;0,0];

        case '??' % = or, door
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1;1,1;0,1];
            yvow = [1,1;1,1;1,1;0,1;0,0];
            zvow = [1,2;0,1;2,2;2,2;0,0];

        case '?' % ? = er, as in teachER 
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            %p4 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);

            xvow = [0,0;0,0;1,1;0,0;0,1];
            yvow = [1,1;1,1;0,1;0,1;0,0];
            zvow = [1,2;0,1;2,2;0,0;0,0];

        case 'e?' % = air
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1];
            yvow = [1,1;1,1;0,0];
            zvow = [1,2;0,1;0,0];

        case '??' % ear
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1;0,1];
            yvow = [1,1;1,1;1,1;0,0];
            zvow = [1,2;0,1;2,2;0,0];

        case '?' % good, should, woods
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p4 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,0];
            yvow = [1,1;1,1;0,1];
            zvow = [1,2;0,1;0,0];

    end
else
    xvow = [];
    yvow = [];
    zvow = [];
end
%}

if ~isempty(vowel)
    vowel = double(vowel);
    if length(vowel)==1
        vowel(2)=0;
    end

        if vowel(1)==101 && vowel(2)==618 %'e?' % e? = "ay" as in wait
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            xvow = [0,1];
            yvow = [1,1];
            zvow = [2,2];

        elseif vowel(1)==97 && vowel(2)==618 %'a?' % 'a?' as in light, my
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            xvow = [1,1];
            yvow = [0,1];
            zvow = [2,2];

        elseif vowel(1)==596 && vowel(2)==618  % '??' % ?? as in boy
            %p8 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            xvow = [0,0];
            yvow = [0,1];
            zvow = [0,0];

        elseif vowel(1)==97 && vowel(2)==650 %'a?' % a? as in power, ow
            %p8 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,1];
            yvow = [0,0];
            zvow = [0,0];

        elseif (vowel(1)==593 && vowel(2)==0) || (vowel(1)==593 && vowel(2)==720) %{'?','??'} % as in father, far, arrr
            %p8 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            %p8 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            xvow = [0,0;0,1;0,1;1,1];
            yvow = [0,1;0,0;1,1;0,1];
            zvow = [0,0;0,0;2,2;2,2];

        elseif (vowel(1)==618 && vowel(2)==0) % '?'
            %p8 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            %p8 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,1];
            yvow = [0,1;0,0];
            zvow = [0,0;0,0];

        elseif (vowel(1)==652 && vowel(2)==0)% '?' % uh as in but, up.  (may also include uh as in the vague enlgish vowel in the game but not sure)
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            xvow = [0,1;1,1];
            yvow = [1,1;0,1];
            zvow = [2,2;2,2];

        elseif (vowel(1)==594 && vowel(2)==0) % '?' % -o- as in stop
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1];
            yvow = [1,1;1,1;1,1];
            zvow = [1,2;0,1;2,2];

        elseif (vowel(1)==230 && vowel(2)==0) %'æ'
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1;1,1];
            yvow = [1,1;1,1;1,1;0,1];
            zvow = [1,2;0,1;2,2;2,2];

        elseif (vowel(1)==117 && vowel(2)==720) % 'u?' % u? = oo, as in shoot
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            %p4 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1;1,1;0,0];
            yvow = [1,1;1,1;1,1;0,1;0,1];
            zvow = [1,2;0,1;2,2;2,2;0,0];

        elseif (vowel(1)==101 && vowel(2)==650) %'e?' % e? = 'oh' as in 'show' (this may also be 'oh' as in hold, but some stylise this as o?...)
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            %p4 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1;1,1;0,0;0,1];
            yvow = [1,1;1,1;1,1;0,1;0,1;0,0];
            zvow = [1,2;0,1;2,2;2,2;0,0;0,0];

        elseif (vowel(1)==105 && vowel(2)==720)||(vowel(1)==105 && vowel(2)==0) %{'i','i?'}
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p4 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1;0,0;0,1];
            yvow = [1,1;1,1;1,1;0,1;0,0];
            zvow = [1,2;0,1;2,2;0,0;0,0];

        elseif (vowel(1)==101 && vowel(2)==0) || (vowel(1)==603 && vowel(2)==0) % 'e'
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p4 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,0;0,1];
            yvow = [1,1;1,1;0,1;0,0];
            zvow = [1,2;0,1;0,0;0,0];

        elseif (vowel(1)==596 && vowel(2)==720) %'??' % = or, door
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1;1,1;0,1];
            yvow = [1,1;1,1;1,1;0,1;0,0];
            zvow = [1,2;0,1;2,2;2,2;0,0];

        elseif (vowel(1)==601 && vowel(2)==0) || (vowel(1)==592 && vowel(2)==0) || (vowel(1)==604&&vowel(2)==720)%'?' % ? = er, as in teachER (SCHWA)
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p5 = plot3([1 1],[0 1],[2 2],'k','LineWidth',5);
            %p4 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);

            xvow = [0,0;0,0;1,1;0,0;0,1];
            yvow = [1,1;1,1;0,1;0,1;0,0];
            zvow = [1,2;0,1;2,2;0,0;0,0];

        elseif (vowel(1)==101 && vowel(2)==601) %'e?' % = air
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1];
            yvow = [1,1;1,1;0,0];
            zvow = [1,2;0,1;0,0];

        elseif (vowel(1)==618 && vowel(2)==601) || (vowel(1)==105 && vowel(2)==601) % '??' % ear
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p6 = plot3([0 1],[1 1],[2 2],'k','LineWidth',5);
            %p3 = plot3([0 1],[0 0],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,1;0,1];
            yvow = [1,1;1,1;1,1;0,0];
            zvow = [1,2;0,1;2,2;0,0];

        elseif (vowel(1)==650 && vowel(2)==0) %'?' % good, should, woods
            %p8 = plot3([0 0],[1 1],[1 2],'k','LineWidth',5);
            %p7 = plot3([0 0],[1 1],[0 1],'k','LineWidth',5);
            %p4 = plot3([0 0],[0 1],[0 0],'k','LineWidth',5);
            xvow = [0,0;0,0;0,0];
            yvow = [1,1;1,1;0,1];
            zvow = [1,2;0,1;0,0];

        else
            xvow = [];
            yvow = [];
            zvow = [];
        end
end

        

%% Consonants

if ~isempty(consonant)
    consonant = double(consonant);
    if length(consonant)==1
        consonant(2)=0;
    end

    if consonant(1)==115 && consonant(2)==0 % 's'
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        xcon = [1,1;0,0;0,1;0,1];
        ycon = [1,1;0,0;0,0;1,1];
        zcon = [0,2;0,2;2,2;0,0];
        
    elseif consonant(1)==98 && consonant(2)==0 % 'b'
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        xcon = [1,1;1,1];
        ycon = [1,1;0,1];
        zcon = [0,2;0,0];
        
    elseif (consonant(1)==100 && consonant(2)==658) %'d??' % j (may need d without line under)
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        xcon = [1,1;0,1];
        ycon = [1,1;1,1];
        zcon = [0,2;0,0];
        
    elseif (consonant(1)==108 && consonant(2)==0) % 'l'
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        xcon = [1,1;0,0];
        ycon = [1,1;0,0];
        zcon = [0,2;0,2];
            
    elseif (consonant(1)==116 && consonant(2)==0) % 't'
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        xcon = [0,0;0,1;0,0];
        ycon = [0,0;0,0;0,1];
        zcon = [0,2;2,2;2,2];
        
    elseif (consonant(1)==110 && consonant(2)==0) % 'n'
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        xcon = [0,0;0,1;1,1];
        ycon = [0,1;1,1;0,1];
        zcon = [2,2;0,0;0,0];
        
    elseif (consonant(1)==119 && consonant(2)==0) % 'w'
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        xcon = [0,1;0,0];
        ycon = [0,0;0,1];
        zcon = [2,2;2,2];
        
    elseif (consonant(1)==100 && consonant(2)==0) %'d'
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        xcon = [1,1;0,1;1,1];
        ycon = [1,1;1,1;0,1];
        zcon = [0,2;0,0;0,0];
        
    elseif (consonant(1)==109 && consonant(2)==0) % 'm'
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        xcon = [0,1;1,1];
        ycon = [1,1;0,1];
        zcon = [0,0;0,0];
        
    elseif (consonant(1)==116 && consonant(2)==643) %'t??' % ch (may need not underlined t)
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        xcon = [0,0;0,0];
        ycon = [0,0;0,1];
        zcon = [0,2;2,2];
    
    elseif (consonant(1)==122 && consonant(2)==0) % 'z'
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        xcon = [0,0;0,0;1,1;1,1];
        ycon = [0,0;0,1;0,1;1,1];
        zcon = [0,2;2,2;0,0;0,2];
        
        %% NEEDS TESTING FROM HERE
    elseif (consonant(1)==104 && consonant(2)==0) % h
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        xcon = [1,1;0,0;1,1];
        ycon = [1,1;0,0;0,1];
        zcon = [0,2;0,2;0,0];
        
    elseif (consonant(1)==240 && consonant(2)==0) % eth (as in, THis)
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        xcon = [1,1;0,0;1,1;0,1];
        ycon = [1,1;0,0;0,1;1,1];
        zcon = [0,2;0,2;0,0;0,0];
        
    elseif (consonant(1)==331 && consonant(2)==0) % ng 
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        xcon = [1,1;0,0;1,1;0,1;0,1;0,0];
        ycon = [1,1;0,0;0,1;1,1;0,0;0,1];
        zcon = [0,2;0,2;0,0;0,0;2,2;2,2];
        
    elseif (consonant(1)==658 && consonant(2)==0) % zj (treaSure)
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        xcon = [1,1;1,1;0,1;0,1;0,0];
        ycon = [1,1;0,1;1,1;0,0;0,1];
        zcon = [0,2;0,0;0,0;2,2;2,2];
        
    elseif (consonant(1)==952 && consonant(2)==0) % thot as in truTH
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        xcon = [1,1;0,0;0,1;0,0];
        ycon = [1,1;0,0;0,0;0,1];
        zcon = [0,2;0,2;2,2;2,2];
        
    elseif (consonant(1)==633 && consonant(2)==0) % r (symbol is upside down r)
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        xcon = [1,1;0,0;0,1];
        ycon = [1,1;0,0;0,0];
        zcon = [0,2;0,2;2,2];
        
    elseif (consonant(1)==106 && consonant(2)==0) % y (Yobbo)
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        xcon = [1,1;0,0;0,0];
        ycon = [1,1;0,0;0,1];
        zcon = [0,2;0,2;2,2];
        
    elseif (consonant(1)==112 && consonant(2)==0) % p 
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        xcon = [0,0;0,1];
        ycon = [0,0;0,0];
        zcon = [0,2;2,2];
        
    elseif (consonant(1)==609 && consonant(2)==0) || (consonant(1)==103 && consonant(2)==0) % g  %% NOT 103???  Added both just in case
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        xcon = [0,0;0,1;1,1];
        ycon = [0,0;0,0;0,1];
        zcon = [0,2;2,2;0,0];
        
    elseif (consonant(1)==102 && consonant(2)==0) % f
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        xcon = [0,0;0,1;0,1];
        ycon = [0,0;0,0;1,1];
        zcon = [0,2;2,2;0,0];
        
    elseif (consonant(1)==643 && consonant(2)==0) % sh
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        xcon = [0,0;0,1;0,0;0,1;1,1];
        ycon = [0,0;0,0;0,1;1,1;0,1];
        zcon = [0,2;2,2;2,2;0,0;0,0];
        
    elseif (consonant(1)==107 && consonant(2)==0) % k
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        xcon = [1,1;1,1;0,1];
        ycon = [1,1;0,1;0,0];
        zcon = [0,2;0,0;2,2];
        
    elseif (consonant(1)==118 && consonant(2)==0) % v
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        xcon = [1,1;1,1;0,0];
        ycon = [1,1;0,1;0,1];
        zcon = [0,2;0,0;2,2];
        
    else
        xcon = [];
        ycon = [];
        zcon = [];
    end
end

%{
switch consonant
   
    case 's'
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        xcon = [1,1;0,0;0,1;0,1];
        ycon = [1,1;0,0;0,0;1,1];
        zcon = [0,2;0,2;2,2;0,0];
        
    case 'b'
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        xcon = [1,1;1,1];
        ycon = [1,1;0,1];
        zcon = [0,2;0,0];
        
    case 'd??' % j (may need d without line under)
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        xcon = [1,1;0,1];
        ycon = [1,1;1,1];
        zcon = [0,2;0,0];
        
    case 'l'
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        xcon = [1,1;0,0];
        ycon = [1,1;0,0];
        zcon = [0,2;0,2];
            
    case 't'
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        xcon = [0,0;0,1;0,0];
        ycon = [0,0;0,0;0,1];
        zcon = [0,2;2,2;2,2];
        
    case 'n'
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        xcon = [0,0;0,1;1,1];
        ycon = [0,1;1,1;0,1];
        zcon = [2,2;0,0;0,0];
        
    case 'w'
        %p4 = plot3([0 1],[0 0],[2 2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        xcon = [0,1;0,0];
        ycon = [0,0;0,1];
        zcon = [2,2;2,2];
        
    case 'd'
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        xcon = [1,1;0,1;1,1];
        ycon = [1,1;1,1;0,1];
        zcon = [0,2;0,0;0,0];
        
    case 'm'
        %p6 = plot3([0 1],[1 1],[0 0],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        xcon = [0,1;1,1];
        ycon = [1,1;0,1];
        zcon = [0,0;0,0];
        
    case 't??' % ch (may need not underlined t)
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        xcon = [0,0;0,0];
        ycon = [0,0;0,1];
        zcon = [0,2;2,2];
    
    case 'z'
        %p2 = plot3([0,0],[0,0],[0,2],'k','LineWidth',5);
        %p5 = plot3([0,0],[0 1],[2 2],'k','LineWidth',5);
        %p5 = plot3([1 1],[0 1],[0 0],'k','LineWidth',5);
        %p1 = plot3([1,1],[1,1],[0,2],'k','LineWidth',5);
        xcon = [0,0;0,0;1,1;1,1];
        ycon = [0,0;0,1;0,1;1,1];
        zcon = [0,2;2,2;0,0;0,2];        
end
%}

x = [xvow;xcon;0,1];
y = [yvow;ycon;1,0];
z = [zvow;zcon;1,1];


x = x';
y = y';
z = z';


