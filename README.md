"Neural image brightness cluster analysis script" developed, created and programmed by Lauri Lahti, Department of Computer Science, Aalto University School of Science, Finland (email: lauri.lahti@aalto.fi), first published on 15 July 2022 and openly available in the following document: Lahti, Lauri (2022). Developing ethical and transparent artificial intelligence algorithms to support decision making in healthcare based on brain research and personal care events of patients. Research article manuscript self-archived on 15 July 2022 at https://aaltodoc.aalto.fi/handle/123456789/115565. Open access: http://urn.fi/URN:NBN:fi:aalto-202207154400.

This script can be used by anyone for non-commercial purposes while citing the just-mentioned research article (Lahti, Lauri, 2022) which provides further details.

This script is openly available at the following GitHub repository: https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script

This script can be used on the public online computing environment of the Binder Project that is a non-profit project built, led and supported by an open community (https://mybinder.org). 

To start the running of this script online you can access the following web address: 
https://mybinder.org/v2/gh/laurilahti/neural-image-brightness-cluster-analysis-script/HEAD?urlpath=rstudio

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/laurilahti/neural-image-brightness-cluster-analysis-script/HEAD?urlpath=rstudio)

<br>

**Description:**

Motivated by the previous research and open source algorithm components (Holmes & Huber, 2020; Hagler et al., 2006) Lauri Lahti developed and created a new cluster analysis method and programmed a new R language script to identify and analyze the emergence of brightness clusters in the given neural images (input images). This new script (referred to as "Neural image brightness cluster analysis script") and its related protocol is openly available in the research article manuscript (Lahti, 2022). The script relies on, among others, R language libraries magrittr, tidyverse, imager, BiocManager, locfit, magick, spatstat, EBImage and ggplot2. The script takes as inputs the maximum intensity projection tiff images and their corresponding manually defined mask images. The script computes and outputs visualizations and exact numeric result files describing pixel regions that the script has identified in the input image file matching the conditions defined by the script's adjustable parameter values about the minimum brightness threshold value (for example 0.4). These numeric result files describe the number of identified brightness regions per image and the area of each of these brightness regions. To support identification of brightness clusters based on agglomerating separate but relatively closely positioned bright pixels, the script enables using supplementary smoothed versions of input image files to identify brightness regions. These supplementary smoothed versions of input image files can be generated with the script’s functionality that implements Gaussian blurring with desired adjustable parameter values of the size of "the brush" of the Gaussian kernel and the value of the sigma for "the brush" of the Gaussian kernel.

<br>

**Usage:**

Step 1. To start the running of the script online on the Binder Project environment you can access with a web browser the following web address: https://mybinder.org/v2/gh/laurilahti/neural-image-brightness-cluster-analysis-script/HEAD?urlpath=rstudio

Step 2. For some time the web browser shows a web page containing a message about starting the following GitHub repository: https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script

Step 3. After some time the web browser redirects to a new web page which shows the actual interactive online computing environment of the Binder Project.

Step 4. In the online computing environment there is window that enables operating folders and files. Among the shown files select the script "neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R". Now in the online computing environment there appears a new window showing the script text.

Step 5. In the upper part of the online computing environment you can see a menu bar to give commands. From the menu bar select the following command path: Code -> Run Region -> Run All. (Or alternatively give the following keyboard command: Ctrl+Alt+R). The script should now start running.

Step 6. When running the script "neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R" for the first time, the initialization and installation phases may take a long time (for example 30 minutes or more) before the actual analysis results become generated. However, after that the subsequent new running of the script generates the actual analysis results much more quickly. When the running of the script has ended and the actual analysis results have become generated, this is indicated by an emerging message in the console window of the online computing environment:
"The running of the script https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script/blob/main/neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R has ended and aimed to generate analysis results."
In brief, the script generates analysis result files into the folder "experiments" based on the files that are located in the folders "inputimages" and "maskimages" relying on, among others, the settings described by the parameter values defined in the beginning of the script text.

Step 7. It is possible to make various personal adjustments for running the script "neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R" on the online computing environment. These adjustments can be done by modifying the text that is in the window showing the script text. The window that enables operating folders and files offers also a possibility to upload and download files for various purposes of analysis. If the running of the script "neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R" produces error messages this may be related to having some conflicting settings. Some error messages can originate from diverse file type codings used in the image files which can be difficult to interpret by the script. The errors concerning these image file type codings may become solved by running the script "supplementary-script-for-reading-and-writing-files-of-inputimages-and-maskimages-developed-by-lauri-lahti.R" before running the script "neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R".


