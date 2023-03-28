# Area-percentage-quantification-on-directory
Quantification number of cells by area percentage  above a threshold apply 

### 1- Open the macro named "Macro_Quantif_Area_percentage_v2.ijm
### 2-  Z stack is projected in MIP 
### 3- A gaussian blur is also applied to decrease the noise
### 4- You can use two methods to process your images : manual or auto thershold  
### 6- Apply the macro on a folder containing your .czi images (and tif images)
### 7- You will obtain a result folder in the same image folder containing a result file with 3 columns (title, area percentage, area) 
Area percentage is the area percentage above the threshold in the image, Area is the area of the image in micron² (if calibrated), area_percentage*area= area of the labelling above the threshold in micron².

![interface](https://user-images.githubusercontent.com/41480459/228158116-d758b401-a873-45f5-ac9c-869ae67a495a.jpg)
