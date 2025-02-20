// batch processing for puncta VGAT and GEPHIRYN
//Before starting you will need to change the directory of where you want to save the excel file
//Make sure that the channel corresponds to what you want to analyze
//Before starting, sample some images to find the best fixed threshold for each channel or set up an automatic threshold

//starts asking your input and output directories for the batch
dir = getDirectory("Input directory");
files= getFileList(dir);

run("Read and Write Excel", "file=[C:/Users/alexi/Documents/LAB_Lejeune/IN VITRO_EXPERIMENTS/RESULTS_WPI_I/DATA_VGAT_2a_nts.xlsx] file_mode=read_and_open");
setBatchMode(true);
for(f=0; f<files.length; f++) {
	id = dir+files[f];
	open(id);
	run("8-bit");
	run("Z Project...", "projection=[Max Intensity]");

	run("Split Channels");
	//process VGAT
	title = getTitle();
	selectWindow(title);
	run("Subtract Background...", "rolling=20 stack");
	run("Despeckle");
	setAutoThreshold("Moments dark");
	setThreshold(40, 255, "raw");
	waitForUser("Select appropriate threshold and/or ROI"); 
	run("Analyze Particles...", "display clear include summarize add");

	selectWindow("Results");
	run("Read and Write Excel", "stack_results file_mode=queue_write");
	run("Close All");

}
run("Read and Write Excel", "file_mode=write_and_close");

setBatchMode(false);
showMessage("Done with the series!");