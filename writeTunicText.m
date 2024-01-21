function [] = writeTunicText(string)


%% Read in the dictionary 

dict_opts = detectImportOptions('C:\Users\jamz\Documents\ProgrammingProjects\TunicLanguageWriter\Dictionaries\en_UK.txt');
dict_opts.Encoding = 'utf-8';

dict_table = readmatrix('C:\Users\jamz\Documents\ProgrammingProjects\TunicLanguageWriter\Dictionaries\en_UK.txt',dict_opts);

%% Assume string is a single word for now

string = lower(string);
found_word = 0;
for word_ind = 1:size(dict_table,1);
    
   if strcmpi(string,dict_table{word_ind,1})
       found_word = 1;
       break
   end
    
end

if found_word
    plotSyllables(dict_table{word_ind,2})
end
    

