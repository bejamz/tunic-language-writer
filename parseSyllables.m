function [all_consonants,all_vowels,all_orders] = parseSyllables(ipa_string)

assert(strcmpi(class(ipa_string),'char'))
fprintf('THIS WORD: %s \n',ipa_string)
fprintf('THIS NUMS: %d \n\n',ipa_string)

%% First we need to identify what syllables exist in the string

%%% NOTE: Diphthongs in the en_UK txt dict are formatted with [x 8205 y]
%%% We can use this to parse if two consecutive ipa symbols belong to the
%%% same symbol or different symbols!

vowel_list = [97;101;105;117;230;592;594;596;601;603;604;618;650;652;720;1230];
consonant_list = [98;100;102;103;104;106;107;108;109;110;112;115;116;118;119;122;240;331;609;633;643;658;952];

ipa_double = double(ipa_string);

all_consonants = NaN(length(ipa_double),2);
all_vowels = NaN(length(ipa_double),2);
all_orders = NaN(length(ipa_double),2);
all_indexer = zeros(length(ipa_double),1); % This is used to tell which rows in the all_con/all_vowels are the actual output and which are just NaNs

% Delete characters we don't want
% 712 = [']
% 716 = [,]
%  47 = [/]
ipa_double(ipa_double==47) = [];
ipa_double(ipa_double==712) = [];
ipa_double(ipa_double==716) = [];

new_syllable = 1; % boolean to index if this iteration belongs in the same syllable or a new syllable to the previous one
                   % initialise at 1 as by default we start with a new syllable
for symbol = 1:length(ipa_double)
    
    if new_syllable % RESET THE TEMP VARIABLES
        this_vowel = [];
        this_consonant = [];
        this_order = []; % 0 if consonant first; 1 if vowel first
    end
    
    this_symbol = ipa_double(symbol);
    is_vowel_this       = any(vowel_list==this_symbol);
    is_consonant_this   = any(consonant_list==this_symbol);
    is_in_diphthong     = 0;

    % Print
    fprintf('This symbol = %s \n',char(this_symbol))
    fprintf('... is vowel: %d, is consonant: %d \n',is_vowel_this,is_consonant_this)
    fprintf('... current vowel: %s, current consonant: %s \n',this_vowel,this_consonant)
    
    if is_vowel_this % WRITE TO THE TEMP VARIABLES
        this_vowel = [this_vowel,this_symbol];
    elseif is_consonant_this
        this_consonant = [this_consonant,this_symbol];
    elseif this_symbol == 8205 % this indicates the previous syllable is likely joined to the next one!
        is_in_diphthong = 1; % Need some special logic to see if we are in a legal diphthong or not
    else 
        fprintf('UH OH - UNKNOWN SYMBOL: %s \n\n',this_symbol)
        keyboard
    end
    fprintf('... new vowel: %s, new consonant: %s \n',this_vowel,this_consonant)
    fprintf('... is 8205: %d \n',is_in_diphthong)
    
    if symbol+1>length(ipa_double)
        fprintf('\n FINAL SYLLABLE: %s %s \n\n',this_consonant,this_vowel)
        all_consonants(symbol,1:length(this_consonant)) = this_consonant;
        all_vowels(symbol,1:length(this_vowel)) = this_vowel;
        all_indexer(symbol) = 1;
        break % break out the for loop before the inevitable error
    end
    
    if is_in_diphthong % we need to see if the diphthong is legit or if it is a weird use that is not a true diphthong we are interested in
        if (ipa_double(symbol-1) == 97) && (any([618,650]==ipa_double(symbol+1)))
            
        elseif (ipa_double(symbol-1) == 101) && (any([618,650]==ipa_double(symbol+1)))
            
        elseif (ipa_double(symbol-1) == 105) && (any([601,618,650]==ipa_double(symbol+1)))
            
        elseif (ipa_double(symbol-1) == 601) && (any([618,650]==ipa_double(symbol+1)))
            
        elseif (ipa_double(symbol-1) == 100) && (any([658]==ipa_double(symbol+1)))
            
        elseif (ipa_double(symbol-1) == 116) && (any([643]==ipa_double(symbol+1)))
            
        else
            is_in_diphthong = 0;
        end
    end
    
    fprintf('... is in diphthong: %d \n',is_in_diphthong)
    
    next_symbol       = ipa_double(symbol+1);
    is_vowel_next       = any(vowel_list==next_symbol);
    is_consonant_next   = any(consonant_list==next_symbol);
    
    if (is_vowel_next&is_vowel_this&next_symbol~=720) || (is_consonant_next&is_consonant_this)
    % new syllable if the next symbol is the same type as the previous (but
    % not if next syllable is 720 = stressor)
        new_syllable = 1;
        
    elseif (~isempty(this_vowel)&&~isempty(this_consonant)) && ~is_in_diphthong && next_symbol~=8205 && next_symbol~=720 && (is_consonant_next||is_vowel_next)
    % OR if we already have a consonant/vowel pair for this syllable 
    % e.g.:
    % [C-V-C]
    %    ^-^
    % this-next   
    % AND the next symbol is not 8205 (i.e. we aren't halfway through a
    % diphthong) or 720 (i.e. an elongator)
        new_syllable = 1;
        
    else 
    % I think the next syllable will be a part of this syllable
        new_syllable = 0; 
        
    end
    
    if new_syllable
    % Write finished syllable to permanent variable
        fprintf('\n FINAL SYLLABLE: %s %s \n\n',this_consonant,this_vowel)
        all_consonants(symbol,1:length(this_consonant)) = this_consonant;
        all_vowels(symbol,1:length(this_vowel)) = this_vowel;
        all_indexer(symbol) = 1;
    end
    
    clear is_vowel_this is_vowel_next is_consonant_next is_vowel_next
    
end

all_indexer = logical(all_indexer);
all_consonants = all_consonants(all_indexer,:);
all_vowels = all_vowels(all_indexer,:);
all_consonants(isnan(all_consonants))=0;
all_vowels(isnan(all_vowels))=0;

%keyboard

