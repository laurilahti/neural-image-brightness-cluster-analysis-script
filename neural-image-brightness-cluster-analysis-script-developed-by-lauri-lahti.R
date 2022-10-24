#   "Neural image brightness cluster analysis script" developed, created and programmed by Lauri Lahti, Department of Computer Science, Aalto University School of Science, Finland (email: lauri.lahti@aalto.fi), first published on 15 July 2022 and openly available in the following document: Lahti, Lauri (2022). Developing ethical and transparent artificial intelligence algorithms to support decision making in healthcare based on brain research and personal care events of patients. Research article manuscript self-archived on 15 July 2022 at https://aaltodoc.aalto.fi/handle/123456789/115565. Open access: http://urn.fi/URN:NBN:fi:aalto-202207154400.

#   This script can be used by anyone for non-commercial purposes while citing the just-mentioned research article (Lahti, Lauri, 2022) which provides further details.

#   This current version (20221024a) of the script is completed and published by Lauri Lahti at https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script on 24 October 2022.

#   Please kindly note: The actual script is not included in this current version (20221024a) of the script and the actual script will be included in a later version of the script. This current version (20221024a) of the script is intended primarily for testing purposes. 


#   A testing segment begins here.

#   A testing about a R language script.

print("A testing.")


image_x_axis_length = 512
image_y_axis_length = 512
x_func_axis_length = image_x_axis_length
y_func_axis_length = image_y_axis_length

library(magrittr)
library(tidyverse)
library(imager)
library(magick)
library(spatstat)
library(EBImage)
library(ggplot2)


analysis_list_of_filenames_initial <- c(
"image001"  
)

analysis_list_of_filenames_initial_original_nonblurred_images <- c(
"image001" 
)

analysis_list_of_folders_initial <- c(
".\\experiments\\test_set001\\" 
)

analysis_list_of_max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed <- c( -1 )

analysis_list_of_brightness_thresholdvalue <- c( 0.10 )

brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot = 2


	
for( counter_index_for_analysis in 1:length(analysis_list_of_filenames_initial) ) {

                   
	
   for( counter_index_for_max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed in 1:length( analysis_list_of_max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed ) ) {


      for( counter_index_for_brightness_thresholdvalue in 1:length(analysis_list_of_brightness_thresholdvalue) ) {

        

print( paste( "counter_index_for_analysis on nyt arvoltaan ", counter_index_for_analysis, sep="" )  )


filepath_of_image_for_input_folder_initial <- ".\\inputimages\\"


filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_folder_initial <- ".\\maskimages\\"


filepath_of_image_for_input_filename_initial <- analysis_list_of_filenames_initial[ counter_index_for_analysis ]


filepath_of_image_for_input_filename_initial_original_nonblurred_images <- analysis_list_of_filenames_initial_original_nonblurred_images[ counter_index_for_analysis ]


filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_filename_initial <- paste( analysis_list_of_filenames_initial_original_nonblurred_images[ counter_index_for_analysis ] , "_mask01nb", sep="" )


filepath_of_image_for_output_folder_initial <- analysis_list_of_folders_initial[ counter_index_for_analysis ]


filepath_of_image_for_output_filename_initial <- analysis_list_of_filenames_initial[ counter_index_for_analysis ]


brightness_thresholdvalue <- analysis_list_of_brightness_thresholdvalue[ counter_index_for_brightness_thresholdvalue ]


filepath_of_image_for_input_combined <- paste( filepath_of_image_for_input_folder_initial, filepath_of_image_for_input_filename_initial, ".tif", sep="" ) 


filepath_of_image_for_input_original_nonblurred_images_combined <- paste( filepath_of_image_for_input_folder_initial, filepath_of_image_for_input_filename_initial_original_nonblurred_images, ".tif", sep="" ) 


filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_combined <- paste( filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_folder_initial, filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_filename_initial, ".png", sep="" ) 




      }    


   }    



}    



#   A testing segment ends here.

