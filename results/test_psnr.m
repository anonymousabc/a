clc; clear;
refdir=dir('groundtruth/*.png');

testdirs = ['flexisp/';'sem/    ';'deep/   ';'ours/   '];
celldata = cellstr(testdirs);
nfiles = length(refdir); % Number of files 

for jj=1:length(celldata)
    psnrsum = 0;
    
    for ii=1:nfiles
        currentfilename = refdir(ii).name;
        ref = imread(['groundtruth/' currentfilename]);
        a = imread([char(celldata(jj)) currentfilename]);
        psnrsum = psnrsum + psnr(ref, a);
    end

    psnravg = psnrsum/nfiles;
    sprintf('PSNR of %s : %.4f', char(celldata(jj)), psnravg)
end