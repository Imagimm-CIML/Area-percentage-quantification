// Measure area and area percentage above threshold
// for multiple channels
// and multiple images
// Mathieu Fallet for Hugues Lelouard
// 17/01/2023

// Before to use it you need to set the thresold (on activate  vs control) for channels
// in this macro we use  : 
// chanel 6 thr= 40
// chanel 4 thr = 100

// IN : image multichannels and Z stack
// OUT : results file  with area pourcentage and title image  for channel 4 and 6
// OUT : log file 

// Reset
run("Clear Results");
print("\\Clear");
run("Close All");

// set measurements with label (image name)
run("Set Measurements...", "area area_fraction display redirect=None decimal=3");

// choose directory containing images
dir = getDirectory("ChooseDirectory");
list= getFileList(dir); 

// calculate the number of images (if folder results inside the image list)
Nb_images = 0;
// filter on format .czi
for (i=0; i < list.length; i++) {
	//print(list[i]);
    if (endsWith(list[i], ".czi")) {
 	Nb_images = Nb_images +1;
    }
 }
print("Nb images="+Nb_images);

// create a results directory in the same folder for results 
File.makeDirectory(dir+ "results");
path_results = dir+"results"+"/results.csv";
//print(path_results);
path_results = replace(path_results, "\\", "/");
//print(path_results);


// calculate area percentage  for channel 6 with threshold =  40 
area_pourcentage_chanel6 = Quantify_area_pourcentage(6,40);

// calculate area percentage  for channel 4 with threshold =  100 
area_pourcentage_chanel4 = Quantify_area_pourcentage(4,100);

//  write results Title, Area pourcentage for the two channels 6 and 4
//File.append( "Title" + "," + "Area_pourcentage_channel_6"+ "," + "Area_pourcentage_channel_4", path_results);
//for (m=0; m < Nb_images; m++) {
//	File.append(list[m] + ","+ area_pourcentage_chanel6[m]+ ","+ area_pourcentage_chanel4[m] ,path_results);
//}

// save log file (due to print to check evrything is ok))
selectWindow("Log");
saveAs("Text", dir +"results/Log.txt");
																											
/////////////////////////////////////////////////////////////////////////////////

function Quantify_area_pourcentage(chanel,threshold) { 
	
Area_pourcentage = newArray();
run("Clear Results");
	for (i=0;i<Nb_images;i++) {
		run("Bio-Formats Windowless Importer", "open=["+dir+list[i]+"]");
		Title = getTitle();
		print("Titre = "+Title);
		run("Z Project...", "projection=[Max Intensity]");
		print("chanel="+chanel);
		run("Duplicate...", "duplicate channels="+chanel);
		
		// Gaussian blur to remove noise
		run("Gaussian Blur...", "sigma=2");
		
		// Threshold
		print("Threshold="+threshold);
		setThreshold(threshold, 255, "raw");
		
		//measure area and area fraction
		run("Measure");
		
		// to check all images have the same area
		Area_pourcentage_value = getResult("%Area", i);
		print("Area_pourcentage = " + Area_pourcentage_value);
		Area_pourcentage = Array.concat(Area_pourcentage,Area_pourcentage_value);
		Area_value = getResult("Area", i);
		print("Area = " + Area_value);
		setResult("Label", i, Title+"_chanel_"+chanel);
		run("Close All");
	}
selectWindow("Results");
saveAs("Results", dir + "results/Results_chanel_"+chanel+"_threshold_"+threshold+".csv");
return Area_pourcentage;

}
