function [ data ] = mor_data( start_point )
%proceeding forward
data=zeros(20,7,7,11);
cd 'C:\Users\Prabhsimran\Desktop\data'
source_dir='C:\Users\Prabhsimran\Desktop\data';
dest_dir='C:\Users\Prabhsimran\Documents\MATLAB\tensor_com';
subdirs = dir(source_dir);
%This filters out all the items in the main folder that are not directories
subdirs(~[subdirs.isdir]) = [];
%And this filters out the parent and current directory '.' and '..'
tf = ismember( {subdirs.name}, {'.', '..'});
subdirs(tf) = [];
%numberOfFolders = length(subdirs);
% %Here i am creating the variables to iterate over the date folders
%subdirs
 s={subdirs.name};
 for i=1:length(s)
     %s(i)
     fol=strcat('C:\Users\Prabhsimran\Desktop\data\',s(i));
     fold=char(fol);
     filePattern=fullfile(fold, '*.xlsx');
     
     xlsfiles=dir(filePattern);
     files={xlsfiles.name};
     cd(fold)
     for j=1:length(files)
         %files(j)
         X=xlsread(char(files(j)));
         data(:,:,j,i)=X(2:8,start_point:(start_point+19))';
     end
 end
 cd(dest_dir)
end

