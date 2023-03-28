# Area-percentage-quantification-on-directory
Quantification  cells density using area percentage above a threshold when cells segmentation is not possible. Two methods are used to choose the threshold (manual or automatic method)

### 1- Open the macro named "Macro_Quantif_Area_percentage_v2.ijm and run it :
![interface](https://user-images.githubusercontent.com/41480459/228158116-d758b401-a873-45f5-ac9c-869ae67a495a.jpg)
### 2- Z stack is projected in MIP 
### 3- A gaussian blur is used : set the diamater in ixel
### 4- You can use two methods to process your images : manual or auto thershold  ("triangle" or "moments")
### 6- Choose the folder containing your .czi images (and tif images)
### 7- You will obtain a result folder in the same image folder containing a result file with 3 columns (title, area percentage, area) 
Area percentage is the area percentage above the threshold in the image, Area is the area of the image in micron² (if calibrated), area_percentage*area= area of the labelling above the threshold in micron².


