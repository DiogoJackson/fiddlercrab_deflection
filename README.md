# 🦀 Fiddler crab claws work as a deflection antipredator defence 🦀
   
_Diogo J. A. Silva, Samuel B. Powell, Marilia F. Erickson, Fabio Cortesi, Daniel M. A. Pessoa, Karen L. Cheney_
     
***

**Journal**: [Biology letters](https://royalsocietypublishing.org/journal/rsbl)

**DOI**: [xxxxxxx](xxxx)

## Content of the repository

1. __data__: the folder `data` contains:  
    * The raw data which contains the spread sheet with experimental data and the reflectances.
    * The processed raw data of the experiment.

2. __outputs__: the folder `output` contains  
    * The figures, figure 2 and 3 generated.

3. __R__: the folder `R` contains  
    * Scripts (.R) to import and clean reflectance and raw data, fit models, and generate Figures 2 and 3 used in the manuscript.

### Folder structure

-   📁 data
    -   📁 raw
        -   🟩 data_deflection.xlsx (raw data spreadsheet of the experiment)
        -   📄 data_deflection_READ_ME.txt (information about raw data variables)
        -   📁 reflectance
           -   📁 color_comparation
               -   📄 black_carapace.txt (black carapace reflectance)
               -   📄 black_paint.txt (black paint reflectance)
               -   📄 blue_carapace.txt (blue carapace reflectance)
               -   📄 blue_paint.txt (blue paint reflectance)
               -   📄 cloth.txt (reflectance of cloth stained with mud)
               -   📄 mudflat.txt (mudflat reflectance)
               -   📄 orange_manus.txt (orange manus reflectance of the claw)
               -   📄 orange_paint.txt (orange paint reflectance)
               -   📄 pink_dactylus.txt (pink dactylus reflectance of the claw)
               -   📄 pink_paint.txt (pink paint reflectance)
           -   📁 vomeris_colors
               -   📄 black_carapace.txt (same as above)
               -   📄 blue_carapace.txt (same as above)
               -   📄 mudflat.txt (same as above)
               -   📄 orange_manus.txt (same as above)
               -   📄 pink_dactylus.txt (same as above)
    -   📁 processed
         - 🟩 00_color_comparation.csv (reflectance spreadsheet of the robot crab and G. vomeris)
         - 🟩 00_vomeris_colors.csv (reflectance spreadsheet of G. vomeris and mudflat)
         - 🟩 data_deflection_processed.csv (Processed data for deflection prepared for fitting models and creating figures.)
-   📁 outputs
    -    📁 figures
          -    📊 Figure_2_color_comparations.png (Figure 2 comparing robotcrab and fiddler crab reflectances)
          -    📊 Figure_3_first-atk-result.png (Figure 3 showing the total number of first attacks in each treatment)
-   📁 R
    -    🔵 00_ADD_reflectance-data.R (Import the txt reflectances, create a spreadsheet of the reflectances, and save it)
    -    🔵 01_S_reflectance.R (Create Figure 2)
    -    🔵 02_C_raw-data.R (Clean raw data)
    -    🔵 02_D_binomial-regression.R (Fit the model for the main result)
    -    🔵 02_S_results.R (Create Figure 3)

***
When using the __data available__ in this repository, please cite the original publication and dataset.

Contact diogojackson@hotmail.com for any further information.  

**Citation:**

> xxxx xxxx xxxx xxxx

**Dataset DOI:**
   
[![DOI](https://zenodo.org/badge/779948542.svg)](https://doi.org/10.5281/zenodo.15046834)
   
> Diogo J. A. Silva, Samuel B. Powell, Marilia F. Erickson, Fabio Cortesi, Daniel M. A. Pessoa, Karen L. Cheney. (2025). Data and code for: Fiddler crab claws work as a deflection antipredator defence (v1.0.0) [Data set]. Zenodo. https://doi.org/10.5281/zenodo.15046834
***
