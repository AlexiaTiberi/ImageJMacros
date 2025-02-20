dir = getDirectory("Input directory");
outputdir=getDirectory("select output directory for the tiff files");
File.openSequence(dir, " step=2");
fullName	= getTitle();
saveAs("Tiff", outputdir+File.separator+fullName+"_gcamp"+".tif");
run("Close All");
File.openSequence(dir, " start=2 step=2");
fullName	= getTitle();
saveAs("Tiff", outputdir+File.separator+fullName+"_hemo"+".tif");
run("Close All");