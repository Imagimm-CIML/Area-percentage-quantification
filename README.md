# Area-percentage-quantification-on-directory
Quantification number of cells by area percentage  above a threshold apply 

## Open the macro named "Macro_Quantif_Area_percentage.ijm
## By default, the Z stack is projected (MIP) A gaussian blur is applied (line 72)
## A gaussian blur is also applied (line 77) to decrese the noise
## Determine the low threshold value for both control and stimulated condition
## Change in the macro the chanel and the threshold you need to quantify (line 46)
## Apply the macro on a folder containing your .czi images (you could change to other format, change the line 31)
# You will obtain a result file containing 3 columns (title, area percentage, area)
Area percentage is the area above the threshold, Area is the area of the image, area_percentage*area= area of the labelling above the threshold
