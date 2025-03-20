**Neural image analysis method developed by Lauri Lahti**

<br>

**Author: Lauri Lahti**

<br>

**1. Neural image brightness cluster analysis script (https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script/blob/main/neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R)**

"Neural image brightness cluster analysis script" developed, created and programmed by Lauri Lahti, Department of Computer Science, Aalto University School of Science, Finland (email: lauri.lahti@aalto.fi), first published on 15 July 2022 and openly available in the following document: Lahti, Lauri (2022). Developing ethical and transparent artificial intelligence algorithms to support decision making in healthcare based on brain research and personal care events of patients. Research article manuscript self-archived on 15 July 2022 at https://aaltodoc.aalto.fi/handle/123456789/115565. Open access: http://urn.fi/URN:NBN:fi:aalto-202207154400.

Lauri Lahti has developed, created, programmed and used this script to generate data analysis results for the following published peer-reviewed journal article in which he is a co-author:

Pushpa Khanal, Zoran Boskovic, Lauri Lahti, Aruna Ghimire, Rimante Minkeviciene, Patricio Opazo and Pirta Hotulainen (2023). Gas7 is a novel dendritic spine initiation factor. eNeuro, 24 March 2023, 10 (4): ENEURO.0344-22.2023. DOI: https://doi.org/10.1523/ENEURO.0344-22.2023. https://www.eneuro.org/content/10/4/ENEURO.0344-22.2023. Received 26 August 2022, accepted 14 March 2023, first published 24 March 2023.<br>
Available also at (licence CC BY): https://research.aalto.fi/files/108158616/Gas7_Is_a_Novel_Dendritic_Spine_Initiation_Factor.pdf

Lauri Lahti's (LL) contributions as a co-author of the journal article are indicated in the following documents:

eNeuro Accepted Manuscript version, Early Release article, first published 24 March 2023, 10.1523/ENEURO.0344-22.2023 (https://www.eneuro.org/content/eneuro/early/2023/03/20/ENEURO.0344-22.2023.full.pdf):<br>
LL developed and created a new cluster analysis method and programmed a new R language script named "Neural image brightness cluster analysis script" and performed all cluster analyses, presented in Figures 1C, 5C, 5E, 5F, 6B, 6C, 6E, 6F and 7B.<br>
LL wrote the chapter "Cluster analysis".<br>
All authors read, edited, and approved the final manuscript.<br>
This Early Release article has been peer-reviewed and accepted, but has not been through the composition and copyediting processes. The final version may differ slightly in style or formatting and will contain links to any extended data.

eNeuro Final version April 2023, 10 (4): ENEURO.0344-22.2023 (https://www.eneuro.org/content/eneuro/10/4/ENEURO.0344-22.2023.full.pdf):<br>
P.K., L.L., P.O., and P.H. analyzed data.

This script can be used by anyone for non-commercial purposes while citing the just-mentioned research article (Lahti, Lauri, 2022) which provides further details.

This script is openly available at the following GitHub repository: https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script

This script can be used on the public online computing environment of the Binder Project that is a non-profit project built, led and supported by an open community (https://mybinder.org).

To start the running of this script online you can access the following web address: https://mybinder.org/v2/gh/laurilahti/neural-image-brightness-cluster-analysis-script/HEAD?urlpath=rstudio

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/laurilahti/neural-image-brightness-cluster-analysis-script/HEAD?urlpath=rstudio)

<br>

**2. Neural image brightness cluster analysis script with adaptive thresholding (https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script/blob/main/neural-image-brightness-cluster-analysis-script-with-adaptive-thresholding-developed-by-lauri-lahti.R)**

"Neural image brightness cluster analysis script with adaptive thresholding" developed, created and programmed by Lauri Lahti, Department of Computer Science, Aalto University School of Science, Finland (email: lauri.lahti@aalto.fi), a previous version of the script with global thresholding first published on 15 July 2022 and openly available in the following document: Lahti, Lauri (2022). Developing ethical and transparent artificial intelligence algorithms to support decision making in healthcare based on brain research and personal care events of patients. Research article manuscript self-archived on 15 July 2022 at https://aaltodoc.aalto.fi/handle/123456789/115565. Open access: http://urn.fi/URN:NBN:fi:aalto-202207154400.

This version of the script with adaptive thresholding is completed and published by Lauri Lahti at https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script/blob/main/neural-image-brightness-cluster-analysis-script-with-adaptive-thresholding-developed-by-lauri-lahti.R on 20 March 2025. A previous version of the script with global thresholding is completed and published by Lauri Lahti at https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script/blob/main/neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R on 11 January 2023.

This script can be used by anyone for non-commercial purposes while citing the just-mentioned research article (Lahti, Lauri, 2022) which provides further details.

This script is openly available at the following GitHub repository: https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script

This script can be used on the public online computing environment of the Binder Project that is a non-profit project built, led and supported by an open community (https://mybinder.org).

To start the running of this script online you can access the following web address: https://mybinder.org/v2/gh/laurilahti/neural-image-brightness-cluster-analysis-script/HEAD?urlpath=rstudio

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/laurilahti/neural-image-brightness-cluster-analysis-script/HEAD?urlpath=rstudio)

<br>

**3. Description**

Motivated by the previous research and open source algorithm components (Holmes & Huber, 2020; Hagler et al., 2006) Lauri Lahti developed and created a new cluster analysis method and programmed a new R language script to identify and analyze the emergence of brightness clusters in the given neural images (input images). This new script (referred to as "Neural image brightness cluster analysis script") and its related protocol is openly available in the research article manuscript (Lahti, 2022). There are two main versions of the script: "Neural image brightness cluster analysis script" relying on the global thresholding value (https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script/blob/main/neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R) and "Neural image brightness cluster analysis script with adaptive thresholding" relying on the moving rectangular window and thresholding offset from the averaged value (https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script/blob/main/neural-image-brightness-cluster-analysis-script-with-adaptive-thresholding-developed-by-lauri-lahti.R). The script relies on, among others, R language libraries magrittr, tidyverse, imager, BiocManager, locfit, magick, spatstat, EBImage and ggplot2. The script takes as inputs the maximum intensity projection tiff images and their corresponding manually defined mask images. The script computes and outputs visualizations and exact numeric result files describing pixel regions that the script has identified in the input image file matching the conditions defined by the script's adjustable parameter values, among others the values about the brightness requirement (for example 0.4). These numeric result files describe the number of identified brightness regions per image and the area of each of these brightness regions. To support identification of brightness clusters based on agglomerating separate but relatively closely positioned pixels which match the brightness requirement, the script enables using supplementary smoothed versions of input image files to identify brightness regions. These supplementary smoothed versions of input image files can be generated with the script's functionality that implements Gaussian blurring (i.e., smoothing) with desired adjustable parameter values of the size of "the brush" of the Gaussian kernel and the value of the sigma for "the brush" of the Gaussian kernel.

<br>

**4. Usage**

Step 1. To start the running of the script online on the Binder Project environment you can access with a web browser the following web address: https://mybinder.org/v2/gh/laurilahti/neural-image-brightness-cluster-analysis-script/HEAD?urlpath=rstudio

Step 2. For some time the web browser shows a web page containing a message about starting the following GitHub repository: https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script

Step 3. After some time the web browser redirects to a new web page which shows the actual interactive online computing environment of the Binder Project.

Step 4. In the online computing environment there is a window that enables operating folders and files. Among the shown files select a desired script: "neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R" (relying on the global thresholding value) or neural-image-brightness-cluster-analysis-script-with-adaptive-thresholding-developed-by-lauri-lahti.R (relying on the moving rectangular window and thresholding offset from the averaged value). Now in the online computing environment there appears a new window showing the script text.

Step 5. In the upper part of the online computing environment you can see a menu bar to give commands. From the menu bar select the following command path: Code -> Run Region -> Run All. (Or alternatively give the following keyboard command: Ctrl+Alt+R.) The script should now start running.

Step 6. When running the script for the first time, the initialization and installation phases may take a long time (for example 30 minutes or more) before the actual analysis results become generated. However, after that the subsequent new running of the script generates the actual analysis results much more quickly. When the running of the script has ended and the actual analysis results have become generated, this is indicated by an emerging message in the console window of the online computing environment ("The running of the script https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script/blob/main/neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R has ended and aimed to generate analysis results." or "The running of the script https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script/blob/main/neural-image-brightness-cluster-analysis-script-with-adaptive-thresholding-developed-by-lauri-lahti.R has ended and aimed to generate analysis results."). In brief, the script generates analysis result files into the folder "experiments" based on the files that are located in the folders "inputimages" and "maskimages" relying on, among others, the settings described by the parameter values defined in the beginning of the script text.

Step 7. It is possible to make various personal adjustments for running the script on the online computing environment. These adjustments can be done by modifying the text that is in the window showing the script text. The window that enables operating folders and files offers also a possibility to upload and download files for various purposes of analysis. If the running of the script produces error messages this may be related to having some conflicting settings. Some error messages can originate from diverse file type codings used in the image files which can be difficult to interpret by the script. The errors concerning these image file type codings may become solved by running the script "supplementary-script-for-reading-and-writing-files-of-inputimages-and-maskimages-developed-by-lauri-lahti.R" before running the script "neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R" or the script "neural-image-brightness-cluster-analysis-script-with-adaptive-thresholding-developed-by-lauri-lahti.R".

<br>

**5. Defining and interpreting parameter values**

<br>

**5.1 Defining the script's adjustable parameter values**

The script computes and outputs visualizations and exact numeric result files describing pixel regions that the script has identified in the input image file matching the conditions defined by the script's adjustable parameter values, among others the values about the brightness requirement (for example 0.4). These numeric result files describe the number of identified brightness regions per image and the area of each of these brightness regions. The script generates analysis result files into the folder "experiments". In the subfolders of the folder "experiments" (set1, set2, set3 etc.) it is possibly to identify from the unique notations in the file names what were the parameter values that were used to generate each of these files.

Each input image file in the folder "inputimages" needs to be in the tiff format and have the suffix .tif.<br>
Each mask image file in the folder "maskimages" needs to be in the png format and have the suffix _mask01nb.png and match otherwise the naming of the corresponding tiff file.<br>
Each mask image file should contain a black-and-white mask image so that the black areas of the mask image show what areas are excluded from the cluster analysis of the actual neural image. To prevent malfunctioning of the script, a 1-pixel-wide black marginal must be present at the outermost borders of each mask image (up, down, left and right), and this detail should also be taken into consideration when interpreting the results.

The input image files (in the tiff format) are defined with the variable by listing them in double quotes, separated with commas, without the suffix .tif, for example:<br>
analysis_list_of_filenames_inputimages <- c( "image001", "image002", "image003" )

The size of "the brush" of the Gaussian kernel is defined with the variable, for example:<br>
size_of_brush_of_Gaussian_kernel <- 51

The value of sigma for "the brush" of the Gaussian kernel can be defined to get various alternative values and these are defined with the variable by listing them, separated with commas, and writing a decimal value with a dot. Please note also a special case: use the value -1 to generate results without any Gaussian blurring. For example:<br>
value_of_sigma_for_brush_of_Gaussian_kernel_list <- c( -1, 0.7, 0.8, 0.9 )

Defining the brightness requirement for "Neural image brightness cluster analysis script" relying on the global thresholding value (https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script/blob/main/neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R):<br>
The brightness requirement can be defined to get various alternative values and these are defined with the variable by listing them, separated with commas, and writing a decimal value with a dot. For example:<br>
analysis_list_of_brightness_thresholdvalue <- c( 0.09, 0.10, 0.11 )

Defining the brightness requirement for "Neural image brightness cluster analysis script with adaptive thresholding" relying on the moving rectangular window and thresholding offset from the averaged value (https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script/blob/main/neural-image-brightness-cluster-analysis-script-with-adaptive-thresholding-developed-by-lauri-lahti.R):<br>
The brightness requirement can be defined to get various alternative values and these are defined with the variable by listing them, separated with commas, and writing a decimal value with a dot. For example:<br>
analysis_list_of_brightness_thresholdvalue_relying_on_the_moving_rectangular_window_and_thresholding_offset_from_the_averaged_value <- c( 0.09, 0.10, 0.11 )<br>
In addition, it is possible to define with the variables the half width and the half height of the moving rectangular window for adaptive thresholding, for example:<br>
half_width_of_moving_rectangular_window_for_adaptive_thresholding <- 10<br>
half_height_of_moving_rectangular_window_for_adaptive_thresholding <- 10

The area size threshold value causes to take into a further consideration only such clusters that contain more pixels than the threshold value.
The area size threshold value can be defined to get various alternative values and these are defined with the variable by listing them, separated with commas, and writing a decimal value with a dot. Please note also a special case: use the value -1 to generate results taking into a further consideration all the identified clusters. (Thus the parameter value -1 causes to take into a further consideration all the clusters that contained at least 0 pixels (i.e., >=0), thus taking into further consideration indeed all the identified clusters.)
For example:<br>
analysis_list_of_max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed <- c( -1, 5, 10 )

<br>

**5.2 Interpreting the notations used in the analysis result files**

For example, a numeric result file with the suffix _sm0dot6_maskedpix_brig0dot40_areg-1_reg_statmeasures.txt describes a situation with the following parameter values:

sm0dot6 = the value of sigma for "the brush" of the Gaussian blurring kernel is 0.6

brig0dot40 = the value about the brightness requirement is 0.40 (the value 0.40 indicates that the requirement is >0.40)

areg-1 = the area size threshold value is -1 (i.e., the area size is >=0 pixels)


Certain parameter values can lead to a situation that the analysis cannot identify regions based on the given conditions.
With such conditions the analysis may not generate image files concerning clusters but anyway a text file should still then become generated containing the text:<br>
"The analysis did not identify regions based on the given conditions,"

Some further explanation about the notations used in the file names of the analysis result files:

Files with the suffix "_mask.png":<br>
A black-and-white mask image so that the black areas of the mask image show what areas are excluded from the cluster analysis of the actual neural image. To prevent malfunctioning of the script, a 1-pixel-wide black marginal must be present at the outermost borders of each mask image (up, down, left and right), and this detail should also be taken into consideration when interpreting the results.

Files with the suffix "maskedpix.png":<br>
Shows what areas remain to be analyzed when the mask image has been applied to the neural image.

Files with the suffix "_sm0dot6_maskedpix_brig0dot10_areg-1.png":<br>
The identified regions are highlighted with a white color.

Files with the suffix "_sm0dot6_maskedpix_brig0dot10_areg-1_reg_colorlabels.png":<br>
The identified regions are highlighted with separate colors (color labels).

Files with the suffix "_sm0dot6_maskedpix_brig0dot10_areg-1_reg_masscenterp.png":<br>
For the identified regions their "mass center points" are shown (the middle point for the region's pixels). For each of these points the values of the x coordinate and the y coordinate are shown in the columns x_coordinate_of_the_region_s_mass_center_point and y_coordinate_of_the_region_s_mass_center_point of the corresponding file with the suffix "_statmeasures.txt".

Files with the suffix "_sm0dot6_maskedpix_brig0dot10_areg-1_reg_numberlabels.png":<br>
For the identified regions their "index numbers" are shown (number labels) so that this numbering matches with the numbering used in the column region_index of the corresponding file with the suffix "_statmeasures.txt".

Files with the suffix "_sm0dot6_maskedpix_brig0dot10_areg-1_reg_statmeasures.txt":<br>
Exact numeric results are shown computed for the identified regions. The columns of this text file describe the following values: region_index (the region's identification number that is unique for each region), area (the number of pixels belonging to the region), average_signal_per_pixel_of_the_region (the average brightness value per pixel of the region), signal_per_area_of_the_region (the average brightness value per pixel of the region multiplied by the number of pixels belonging to the region), x_coordinate_of_the_region_s_mass_center_point (the x coordinate of the middle point for the region's pixels) and y_coordinate_of_the_region_s_mass_center_point (the y coordinate of the middle point for the region's pixels).

The identified regions are highlighted with a transparent overlay description, in three variants:

Files with the suffix "_trdc.png":<br>
This image file illustrates each region with a transparent (the strength of transparency 0.1) purple outlining and a transparent (the strength of transparency 0.1) green inside of the outlined region.

Files with the suffix "_trsc.png":<br>
This image file illustrates each region with a transparent (the strength of transparency 0.1) green outlining and a transparent (the strength of transparency 0.1) green inside of the outlined region.

Files with the suffix "_truc.png":<br>
This image file illustrates each region with a non-transparent (the strength of transparency 1.0) red outlining and inside of the outlined region is shown as in the original input image (thus there are no added colors and not any transparent overlay descriptions shown concerning the inside of the outlined region).

Some other analysis result files:

Files with the suffix "_masktr.png":<br>
This image file illustrates the "observation path" (i.e., showing what areas are included in the cluster analysis of the actual neural image, based on the mask defined by the file with the suffix "_mask.png") with a transparent (the strength of transparency 0.1) purple outlining and a transparent (the strength of transparency 0.1) yellow inside of the outlined segment.

Files with the suffix "_originalaspngfile.png" or "_sm0dot6_originalaspngfile.png":<br>
The original neural image is represented here as a png image file with possible Gaussian blurring applied to it, depending on the notation of the file name. If the file name does not contain a segment like "sm0dot6" then the original neural image is represented here without any Gaussian blurring, and otherwise the segment like "sm0dot6" indicates the Gaussian blurring applied to the original neural image. For example the notation "sm0dot6" indicates that the value of sigma for "the brush" of the Gaussian blurring kernel is 0.6

<br>

**References:**

Hagler DJ Jr., Saygin AP, Sereno MI (2006) Smoothing and cluster thresholding for cortical surface-based group analysis of fMRI data. Neuroimage 33:1093–1103. https://doi.org/10.1016/j.neuroimage.2006.07.036 ; pmid:17011792

Holmes S, Huber W (2022) Modern statistics for modern biology. Lab 9: Image Data, May 7, 2020. Available at https://web.stanford.edu/class/bios221/book/ .

Lahti, Lauri (2022). Developing ethical and transparent artificial intelligence algorithms to support decision making in healthcare based on brain research and personal care events of patients. Research article manuscript self-archived on 15 July 2022 at https://aaltodoc.aalto.fi/handle/123456789/115565. Open access: http://urn.fi/URN:NBN:fi:aalto-202207154400.

Pushpa Khanal, Zoran Boskovic, Lauri Lahti, Aruna Ghimire, Rimante Minkeviciene, Patricio Opazo and Pirta Hotulainen (2023). Gas7 is a novel dendritic spine initiation factor. eNeuro, 24 March 2023, 10 (4): ENEURO.0344-22.2023. DOI: https://doi.org/10.1523/ENEURO.0344-22.2023. https://www.eneuro.org/content/10/4/ENEURO.0344-22.2023. Received 26 August 2022, accepted 14 March 2023, first published 24 March 2023. 
https://www.eneuro.org/content/eneuro/early/2023/03/20/ENEURO.0344-22.2023.full.pdf ; https://www.eneuro.org/content/eneuro/10/4/ENEURO.0344-22.2023.full.pdf ; https://research.aalto.fi/files/108158616/Gas7_Is_a_Novel_Dendritic_Spine_Initiation_Factor.pdf 

<br>

<br>

<br>
