#   "Supplementary script for reading and writing files of inputimages and maskimages" developed, created and programmed by Lauri Lahti, Department of Computer Science, Aalto University School of Science, Finland (email: lauri.lahti@aalto.fi), first published on 30 October 2022.

#   This script is a supplement to "Neural image brightness cluster analysis script" developed, created and programmed by Lauri Lahti, Department of Computer Science, Aalto University School of Science, Finland (email: lauri.lahti@aalto.fi), first published on 15 July 2022 and openly available in the following document: Lahti, Lauri (2022). Developing ethical and transparent artificial intelligence algorithms to support decision making in healthcare based on brain research and personal care events of patients. Research article manuscript self-archived on 15 July 2022 at https://aaltodoc.aalto.fi/handle/123456789/115565. Open access: http://urn.fi/URN:NBN:fi:aalto-202207154400.

#   This supplementary script can be used by anyone for non-commercial purposes while citing the just-mentioned research article (Lahti, Lauri, 2022) which provides further details.

#   This current version (20230111a) of the script is completed and published by Lauri Lahti at https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script on 11 January 2023.

#   Please kindly note: This current version (20230111a) of the script is intended primarily for testing purposes and a later version of the script is expected to have further functionality. 

#   If the running of the script "neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R" produces error messages this may be related to having some conflicting settings. Some error messages can originate from diverse file type codings used in the image files which can be difficult to interpret by the script. The errors concerning these image file type codings may become solved by running the script "supplementary-script-for-reading-and-writing-files-of-inputimages-and-maskimages-developed-by-lauri-lahti.R" before running the script "neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R".


if( !("BiocManager" %in% rownames( installed.packages() ) ) ) {
  install.packages("BiocManager")
}

if( !("locfit" %in% rownames( installed.packages() ) ) ) {
   install.packages("locfit")
}

if( !("EBImage" %in% rownames( installed.packages() ) ) ) {
  BiocManager::install("EBImage", update=FALSE, ask=FALSE)
}


library(BiocManager)
library(locfit)
library(EBImage)


current_working_directory = "."

filepath_segment_for_folder_inputimages <- "\\inputimages\\"

filepath_segment_for_folder_maskimages <- "\\maskimages\\"

list_of_files_to_be_evaluated <- list.files( paste( current_working_directory ,  filepath_segment_for_folder_inputimages , sep="" )  , include.dirs = TRUE, full.names = TRUE, recursive = TRUE )

list_of_files_to_be_evaluated <-  list_of_files_to_be_evaluated[lapply(list_of_files_to_be_evaluated,function(x) length(grep("readme-inputimages.txt",x,value=FALSE))) == 0]


for( list_of_files_to_be_evaluated_counter in 1:( length(list_of_files_to_be_evaluated ) ) ) {


filepath_of_image_for_analysis_input_test = list_of_files_to_be_evaluated[ list_of_files_to_be_evaluated_counter ]

filepath_of_image_for_analysis_output_test = list_of_files_to_be_evaluated[ list_of_files_to_be_evaluated_counter ]


image_test_in_ebimageformat_exp_temp <- readImage(filepath_of_image_for_analysis_input_test)

writeImage(image_test_in_ebimageformat_exp_temp, filepath_of_image_for_analysis_output_test, quality=100);

image_test_in_ebimageformat_exp <-  readImage(filepath_of_image_for_analysis_output_test)

plot(image_test_in_ebimageformat_exp)


}





list_of_files_to_be_evaluated <- list.files( paste( current_working_directory ,  filepath_segment_for_folder_maskimages , sep="" )  , include.dirs = TRUE, full.names = TRUE, recursive = TRUE )

list_of_files_to_be_evaluated <-  list_of_files_to_be_evaluated[lapply(list_of_files_to_be_evaluated,function(x) length(grep("readme-maskimages.txt",x,value=FALSE))) == 0]


for( list_of_files_to_be_evaluated_counter in 1:( length(list_of_files_to_be_evaluated ) ) ) {


filepath_of_image_for_analysis_input_test = list_of_files_to_be_evaluated[ list_of_files_to_be_evaluated_counter ]

filepath_of_image_for_analysis_output_test = list_of_files_to_be_evaluated[ list_of_files_to_be_evaluated_counter ]


image_test_in_ebimageformat_exp_temp <- readImage(filepath_of_image_for_analysis_input_test)

writeImage(image_test_in_ebimageformat_exp_temp, filepath_of_image_for_analysis_output_test, quality=100);

image_test_in_ebimageformat_exp <-  readImage(filepath_of_image_for_analysis_output_test)

plot(image_test_in_ebimageformat_exp)


}





print( "The running of the script https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script/blob/main/supplementary-script-for-reading-and-writing-files-of-inputimages-and-maskimages-developed-by-lauri-lahti.R has ended and aimed to read and write files of inputimages and maskimages." )




