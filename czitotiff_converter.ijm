// czi to tiff importer and saver
extension = "czi"; 
dir = getDirectory("Select a directory containing one or several ."+extension+" files.");
outputdir=getDirectory("select output directory for the tiff files");
files = getFileList(dir);


setBatchMode(true);
for(f=0; f<files.length; f++) {
	id = dir+files[f];
	run("Bio-Formats Importer", "open=["+id+"] autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
	fullName	= getTitle();
	saveAs("tiff", outputdir+File.separator+fullName+".tif");
	print("SAVING TIFFS");
}
run("Close All");
setBatchMode(false);
showMessage("Done with the series!");