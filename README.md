# Area-percentage-quantification-on-directory
Quantification number of cells by area percentage  above a threshold apply 

### 1- Open the macro named "Macro_Quantif_Area_percentage.ijm
### 2- By default, the Z stack is projected in MIP (line 72) 
### 3- A gaussian blur is also applied (line 77) to decrease the noise
### 4- Determine the low threshold value for both control and stimulated condition
### 5- Enter in the macro the chanel and the threshold you need to quantify (line 46)
### 6- Apply the macro on a folder containing your .czi images (you could change to other format, change the line 31)
### 7- You will obtain a result folder in the same image folder containing a result file with 3 columns (title, area percentage, area) 
Area percentage is the area percentage above the threshold in the image, Area is the area of the image in micron (if calibrated), area_percentage*area= area of the labelling above the threshold in micron.

![Clipboard](https://user-images.githubusercontent.com/41480459/212920264-813d813d-510c-46ad-9826-1e9b113057ca.jpg)


In this example, the red labelling above the threshold = 33 have an area percentage of 4.442 % (it means it is occupied 4.442 % percent of the image)

![Clipboard](https://user-images.githubusercontent.com/41480459/212902564-c3b8409e-91c2-4efd-ac91-04b61997e146.jpg)
