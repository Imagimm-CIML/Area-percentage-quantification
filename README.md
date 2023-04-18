# Quantification-percentage-of-cell-surface-per-tissue-area-
Quantification of cell surface in a region using percentage of signal intensity above a threshold in a tissue area. Two methods are used to choose the threshold (manual or automatic method). Two channels (= two different cell types) can be quantified.

### 1- Open the macro named "Macro_Quantif_Area_percentage_v2.ijm and run it :
![interface](https://user-images.githubusercontent.com/41480459/228158116-d758b401-a873-45f5-ac9c-869ae67a495a.jpg)
### 2- Z stack is projected in MIP 
### 3- A gaussian blur is used : set the diameter in pixel
### 4- Two methods of signal threshold are proposed: manual or automatic using "triangle" or "moments"
The threshold value of automatic threshold is not exported but printed in the log file.  
Example of result : "Triangle" method (value=34) : area percentage= 4%
![Clipboard](https://user-images.githubusercontent.com/41480459/228169425-96cd1521-8432-4a5f-ba3f-92a011cec6d2.jpg)

### 6- Choose the folder containing your .czi or .tif images 
### 7- You will obtain a result folder in the same image folder containing a file in csv with 3 columns (title, area percentage, area) for the two channels 
Area percentage is the area percentage above the threshold in the image, Area is the area of the image in micron² (if calibrated), area_percentage*area= area of the labelling above the threshold in micron².


