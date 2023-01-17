# Area-percentage-quantification-on-directory
Quantification number of cells by area percentage  above a threshold apply 

### 1- Open the macro named "Macro_Quantif_Area_percentage.ijm
### 2- By default, the Z stack is projected in MIP (line 72) 
### 3- A gaussian blur is also applied (line 77) to decrese the noise
### 4- Determine the low threshold value for both control and stimulated condition
### 5- Enter in the macro the chanel and the threshold you need to quantify (line 46)
### 6- Apply the macro on a folder containing your .czi images (you could change to other format, change the line 31)
### 7- You will obtain a result folder  containing a result file with 3 columns (title, area percentage, area) in the same image folder 
Area percentage is the area above the threshold, Area is the area of the image, area_percentage*area= area of the labelling above the threshold
![Clipboard](https://user-images.githubusercontent.com/41480459/212902564-c3b8409e-91c2-4efd-ac91-04b61997e146.jpg)
