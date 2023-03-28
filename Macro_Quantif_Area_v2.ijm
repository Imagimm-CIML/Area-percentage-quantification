////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Mathieu Fallet for Hugues Lelouard (CIML)
// 28/03/2023

// When it is not possible to segment cells, the area percentage is a measure of cells density
// Measure area and area percentage with auto threshold or manuel threshold for two channels

// For multiple channels image with z stack (a MIP projection is used)
// And several images in a folder 
// Gaussian filter in pixels 

// IN : image multichannels and Z stack
// OUT : results file  with area pourcentage and title image  for two channels
// OUT : log file 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Reset
run("Clear Results");
print("\\Clear");
run("Close All");

// set measurements with label (image name)
run("Set Measurements...", "area area_fraction display redirect=None decimal=3");

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// choose directory containing images
//dir = getDirectory("ChooseDirectory");
//list= getFileList(dir); 

Dialog.create("Quantify area percentage with manual or auto threshold");

Dialog.addDirectory("Image path", "C:/Users/fallet/Desktop/230112_HL_S100a4vsCD101/");
Dialog.addNumber("gaussian blur pixel = ", 2);
Dialog.addCheckbox("Manual threshold", false);
Dialog.addNumber("First Channel to threshold ", 4);
Dialog.addNumber("Second Channel to threshold ", 6);
Dialog.addNumber("First Channel  Threshold = ", 100);
Dialog.addNumber("Second Channel Threshold = ", 40);

Dialog.addChoice("Auto threshold method", newArray("Triangle","Moments"));


Dialog.show();

// modify the / in  \ ?
dir = Dialog.getString();
Blur_pixel = Dialog.getNumber();
list= getFileList(dir); 
method_thershold_manuel= Dialog.getCheckbox();
FirstChannel = Dialog.getNumber();
SecondChannel = Dialog.getNumber();
Thr_First_channel = Dialog.getNumber();
Thr_Second_channel = Dialog.getNumber();
Auto_Thr_method = Dialog.getChoice();

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// calculate the number of czi and tif images 
Nb_images = 0;
// filter on format .czi
for (i=0; i < list.length; i++) {
	//print(list[i]);
    if (endsWith(list[i], ".czi")||endsWith(list[i], ".tif") ) {
 	Nb_images = Nb_images +1;
    }
 }
print("Nb images="+Nb_images);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// create a results directory in the same folder for results 
File.makeDirectory(dir+ "results");
path_results = dir+"results"+"/results.csv";
//path_results = replace(path_results, "\\", "/");

// calculate area percentage with threshold
if (method_thershold_manuel == true){
	area_pourcentage_First_channel = Quantify_area_pourcentage(FirstChannel,Thr_First_channel);
	area_pourcentage_Second_channel = Quantify_area_pourcentage(SecondChannel,Thr_Second_channel);
}
// calculate area percentage with autothreshold
else {
	 Quantify_area_pourcentage_thr_auto(FirstChannel,Auto_Thr_method);
     Quantify_area_pourcentage_thr_auto(SecondChannel,Auto_Thr_method);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// save log file
selectWindow("Log");
saveAs("Text", dir +"results/Log.txt");
print("END");

																											
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function Quantify_area_pourcentage(channel,threshold) { 
	
Area_pourcentage = newArray();
run("Clear Results");
	for (i=0;i<Nb_images;i++) {
		run("Bio-Formats Windowless Importer", "open=["+dir+list[i]+"]");
		Title = getTitle();
		print("Titre = "+Title);
		run("Z Project...", "projection=[Max Intensity]");
		print("channel="+channel);
		run("Duplicate...", "duplicate channels="+channel);
		
		// Gaussian blur to remove noise
		run("Gaussian Blur...", "sigma="+Blur_pixel);
		
		// Threshold
		print("Threshold= "+threshold);
		setThreshold(threshold, 255, "raw");
		//measure area and area fraction
		run("Measure");
		
		// to check all images have the same area
		Area_pourcentage_value = getResult("%Area", i);
		print("Area_pourcentage = " + Area_pourcentage_value);
		Area_pourcentage = Array.concat(Area_pourcentage,Area_pourcentage_value);
		Area_value = getResult("Area", i);
		print("Area = " + Area_value);
		setResult("Label", i, Title+"_channel_"+channel);
		run("Close All");
	}
selectWindow("Results");
saveAs("Results", dir + "results/Results_channel_"+channel+"_threshold_"+threshold+".csv");
return Area_pourcentage;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function Quantify_area_pourcentage_thr_auto(channel,method) { 
	
Area_pourcentage = newArray();
run("Clear Results");
	for (i=0;i<Nb_images;i++) {
		run("Bio-Formats Windowless Importer", "open=["+dir+list[i]+"]");
		Title = getTitle();
		print("Titre = "+Title);
		run("Z Project...", "projection=[Max Intensity]");
		print("channel="+channel);
		run("Duplicate...", "duplicate channels="+channel);
		
		// Gaussian blur to remove noise
		run("Gaussian Blur...", "sigma="+Blur_pixel);

		// Threshold
		print("Threshold="+ method);
        setAutoThreshold(method +" dark");
		//measure area and area fraction
		run("Measure");
		
		// to check all images have the same area
		Area_pourcentage_value = getResult("%Area", i);
		print("Area_pourcentage = " + Area_pourcentage_value);
		Area_pourcentage = Array.concat(Area_pourcentage,Area_pourcentage_value);
		Area_value = getResult("Area", i);
		print("Area = " + Area_value);
		setResult("Label", i, Title+"_channel_"+channel);
		run("Close All");
	}
selectWindow("Results");
saveAs("Results", dir + "results/Results_channel_"+channel+"_"+ method +".csv");
return Area_pourcentage;

}