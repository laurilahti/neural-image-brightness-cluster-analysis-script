#   "Neural image brightness cluster analysis script" developed, created and programmed by Lauri Lahti, Department of Computer Science, Aalto University School of Science, Finland (email: lauri.lahti@aalto.fi), first published on 15 July 2022 and openly available in the following document: Lahti, Lauri (2022). Developing ethical and transparent artificial intelligence algorithms to support decision making in healthcare based on brain research and personal care events of patients. Research article manuscript self-archived on 15 July 2022 at https://aaltodoc.aalto.fi/handle/123456789/115565. Open access: http://urn.fi/URN:NBN:fi:aalto-202207154400.

#   This script can be used by anyone for non-commercial purposes while citing the just-mentioned research article (Lahti, Lauri, 2022) which provides further details.

#   This current version (20221026a) of the script is completed and published by Lauri Lahti at https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script on 26 October 2022.

#   Please kindly note: This current version (20221026a) of the script is intended primarily for testing purposes and a later version of the script is expected to have further functionality. 


image_x_axis_length = 512
image_y_axis_length = 512
x_func_axis_length = image_x_axis_length
y_func_axis_length = image_y_axis_length

library(magrittr)
library(tidyverse)
library(imager)
library(BiocManager)
library(locfit)
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
"/experiments/set001/"  
)

analysis_list_of_max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed <- c( -1 )

analysis_list_of_brightness_thresholdvalue <- c(0.10 )

brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot = 2

current_working_directory <- "."


	
for( counter_index_for_analysis in 1:length(analysis_list_of_filenames_initial) ) {

                   	
   for( counter_index_for_max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed in 1:length( analysis_list_of_max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed ) ) {

	
      for( counter_index_for_brightness_thresholdvalue in 1:length(analysis_list_of_brightness_thresholdvalue) ) {


filepath_of_image_for_input_folder_initial <- paste( current_working_directory , "/inputimages/" , sep="") 

filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_folder_initial <- paste( current_working_directory , "/maskimages/" , sep="")

filepath_of_image_for_input_filename_initial <- analysis_list_of_filenames_initial[ counter_index_for_analysis ]

filepath_of_image_for_input_filename_initial_original_nonblurred_images <- analysis_list_of_filenames_initial_original_nonblurred_images[ counter_index_for_analysis ]

filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_filename_initial <- paste( analysis_list_of_filenames_initial_original_nonblurred_images[ counter_index_for_analysis ] , "_mask01nb", sep="" )

filepath_of_image_for_output_folder_initial <- paste( current_working_directory , analysis_list_of_folders_initial[ counter_index_for_analysis ] , sep="")

filepath_of_image_for_output_filename_initial <- analysis_list_of_filenames_initial[ counter_index_for_analysis ]

brightness_thresholdvalue <- analysis_list_of_brightness_thresholdvalue[ counter_index_for_brightness_thresholdvalue ]

filepath_of_image_for_input_combined <- paste( filepath_of_image_for_input_folder_initial, filepath_of_image_for_input_filename_initial, ".tif", sep="" ) 

filepath_of_image_for_input_original_nonblurred_images_combined <- paste( filepath_of_image_for_input_folder_initial, filepath_of_image_for_input_filename_initial_original_nonblurred_images, ".tif", sep="" ) 

filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_combined <- paste( filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_folder_initial, filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_filename_initial, ".png", sep="" ) 


c2 <- readImage( filepath_of_image_for_input_combined )

plot(c2)

c2_gray = channel(c2, 'gray')

plot(c2_gray)



	      
filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_originalaspngfile",  ".png", sep="" ) 



png(filename = filepath_of_image_for_output_temp, dim(c2_gray)[1] , dim(c2_gray)[2] , type="cairo" )

par(mar = c(0, 0, 0, 0))

plot(c2_gray)


dev.off()





image_test_in_magickimageformat_observ <- image_read( filepath_of_image_for_input_combined )

plot(image_test_in_magickimageformat_observ)


image_test_in_magickimageformat_observ2 <- image_read( filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_combined )

plot(image_test_in_magickimageformat_observ2)


filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_mask", ".png", sep="" ) 

image_write(image_test_in_magickimageformat_observ2, path = filepath_of_image_for_output_temp, format = "png")

filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_masktr", ".png", sep="" ) 


maskimage_in_ebimageformat = readImage( filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_combined )

maskimage_in_ebimageformat_gray = channel(maskimage_in_ebimageformat, 'gray')

maskimage_thresholded = thresh(maskimage_in_ebimageformat_gray, 10, 10, 0.05)


c2_gray_original_nonblurred_image <- readImage( filepath_of_image_for_input_original_nonblurred_images_combined )

plot(c2_gray_original_nonblurred_image)


c2_gray_original_nonblurred_image_gray = channel(c2_gray_original_nonblurred_image, 'gray')

plot(c2_gray_original_nonblurred_image_gray)





c2_gray_original_nonblurred_image_incolormode_keepinggrayshades <- rgbImage(red = c2_gray_original_nonblurred_image, green = c2_gray_original_nonblurred_image, blue = c2_gray_original_nonblurred_image )

plot(c2_gray_original_nonblurred_image_incolormode_keepinggrayshades)



maskimage_transparentlyoverlayed_over_orginalnonblurredimage = paintObjects( maskimage_in_ebimageformat_gray  , c2_gray_original_nonblurred_image_incolormode_keepinggrayshades  , col=c('#ff00ff', '#ffff00'), opac=c(0.1, 0.1) )


plot( maskimage_transparentlyoverlayed_over_orginalnonblurredimage )


writeImage(maskimage_transparentlyoverlayed_over_orginalnonblurredimage, filepath_of_image_for_output_temp, quality=100);





image_test_in_magickimageformat_observ2_whitecolorchangedtobetransparent <- image_transparent(image_test_in_magickimageformat_observ2, 'white')

plot(image_test_in_magickimageformat_observ2_whitecolorchangedtobetransparent)

image_layer_list_observ <- c(image_test_in_magickimageformat_observ, image_test_in_magickimageformat_observ2_whitecolorchangedtobetransparent)

image_in_magickimageformat_combined_with_layers_observ <- image_mosaic(image_layer_list_observ)


plot(image_in_magickimageformat_combined_with_layers_observ)



filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix", ".png", sep="" ) 



image_write(image_in_magickimageformat_combined_with_layers_observ, path = filepath_of_image_for_output_temp, format = "png")




filepath_of_image_for_input_maskedpix_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix", ".png", sep="" ) 

c2_gray_masked_pixels <- readImage( filepath_of_image_for_input_maskedpix_temp )

plot(c2_gray_masked_pixels)




c2_gray_eval_brightnessabovethresholdvalue <- c2_gray_masked_pixels > brightness_thresholdvalue 

plot( c2_gray_eval_brightnessabovethresholdvalue )




max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed <- analysis_list_of_max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed[ counter_index_for_max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed ]

filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix_brig",  gsub("\\.", "dot", formatC( brightness_thresholdvalue ,format='f', digits=brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot )  ), "_areg",  gsub("\\.", "dot", max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed), ".png", sep="" ) 



filepath_output_c2_gray_eval_brightnessabovethresholdvalue_cnt <- filepath_of_image_for_output_temp

      
c2_gray_eval_brightnessabovethresholdvalue_cnt_initial <- bwlabel(  c2_gray_eval_brightnessabovethresholdvalue  ) 

fts_initial <- computeFeatures.shape( c2_gray_eval_brightnessabovethresholdvalue_cnt_initial )



area_initial <- fts_initial[,1]  

df_area_element_candidates_initial <- area_initial

c2_gray_eval_brightnessabovethresholdvalue_cnt <- rmObjects( c2_gray_eval_brightnessabovethresholdvalue_cnt_initial , which(   df_area_element_candidates_initial <= max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed     ) )

plot( c2_gray_eval_brightnessabovethresholdvalue_cnt  )




fts_initial_testingifnoelements <- computeFeatures.shape( c2_gray_eval_brightnessabovethresholdvalue_cnt )


         if (   not(  is.null( fts_initial_testingifnoelements )  )  )  { 



png(filename = filepath_of_image_for_output_temp, dim(c2_gray)[1] , dim(c2_gray)[2] , type="cairo" )

par(mar = c(0, 0, 0, 0))


plot( c2_gray_eval_brightnessabovethresholdvalue_cnt  )

dev.off()






c2_gray_eval_brightnessabovethresholdvalue_cnt_withcolorlabels <- colorLabels( c2_gray_eval_brightnessabovethresholdvalue_cnt )


plot( c2_gray_eval_brightnessabovethresholdvalue_cnt_withcolorlabels )





filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix_brig",  gsub("\\.", "dot", formatC( brightness_thresholdvalue ,format='f', digits=brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot )  ), "_areg",  gsub("\\.", "dot", max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed), "_reg_colorlabels",  ".png", sep="" ) 



png(filename = filepath_of_image_for_output_temp, dim(c2_gray)[1] , dim(c2_gray)[2] , type="cairo" )

par(mar = c(0, 0, 0, 0))

plot ( c2_gray_eval_brightnessabovethresholdvalue_cnt_withcolorlabels )

dev.off()





c2_gray_original_nonblurred_image <- readImage( filepath_of_image_for_input_original_nonblurred_images_combined )


plot(c2_gray_original_nonblurred_image)


c2_gray_original_nonblurred_image_gray = channel(c2_gray_original_nonblurred_image, 'gray')

plot(c2_gray_original_nonblurred_image_gray)




ftb <- computeFeatures.basic(  c2_gray_eval_brightnessabovethresholdvalue_cnt , c2_gray_original_nonblurred_image_gray )


ftb_moment <- computeFeatures.moment(  c2_gray_eval_brightnessabovethresholdvalue_cnt , c2_gray_original_nonblurred_image_gray )




head(ftb, 10)


par(mar = c(0, 0, 0, 0))


plot(NULL, xlim=c(0,  dim(c2_gray)[1] ), ylim=c(0,  dim(c2_gray)[2] ), xaxs="i", yaxs="i")


text(x= ftb_moment[,1] , y= (  dim(c2_gray)[2]  - ftb_moment[,2] ) ,labels=1:(length( ftb_moment[,1] )) )



filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix_brig",  gsub("\\.", "dot", formatC( brightness_thresholdvalue ,format='f', digits=brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot )  ), "_areg",  gsub("\\.", "dot", max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed), "_reg_numberlabels",  ".png", sep="" ) 


png(filename = filepath_of_image_for_output_temp,  dim(c2_gray)[1] , dim(c2_gray)[2]  , type="cairo" )

par(mar = c(0, 0, 0, 0))


plot(NULL, xlim=c(0, dim(c2_gray)[1] ), ylim=c(0, dim(c2_gray)[2] ), xaxs="i", yaxs="i")


text(x= ftb_moment[,1] , y= (  dim(c2_gray)[2]  - ftb_moment[,2] ) ,labels=1:(length( ftb_moment[,1] )) )

dev.off()



library(ggplot2)


average_signal_per_pixel_of_region <- ftb[,1]


fts <- computeFeatures.shape( c2_gray_eval_brightnessabovethresholdvalue_cnt )


area <- fts[,1]  
perimeter <- fts[,2] 



df <- as.data.frame(average_signal_per_pixel_of_region)

df$area <- area


signal_per_area_of_region <- average_signal_per_pixel_of_region * area

df$signal_per_area_of_region <- df$average_signal_per_pixel_of_region * df$area


df$region_index <- seq(1:nrow(df))



df_situation_current <- df


area_situation_current <- area

average_signal_per_pixel_of_region_situation_current <- average_signal_per_pixel_of_region

signal_per_area_of_region_situation_current <- signal_per_area_of_region


region_index_situation_current <- c(1:(length(area_situation_current)))



ftb_situation_current <- ftb

fts_situation_current <- fts



w_list_of_outlineregions_masscenterpoint_coordpoints = cbind( ftb_moment[,1], ftb_moment[,2] )



regions_x_coord = w_list_of_outlineregions_masscenterpoint_coordpoints[, 1]

regions_y_coord = w_list_of_outlineregions_masscenterpoint_coordpoints[, 2]


area_specialcol = c(0, (dim(c2_gray)[1]) , 0, (dim(c2_gray)[2]))


area_specialcol

names(area_specialcol) = c("xl", "xu", "yl", "yu")

area_specialcol


list_test_as_numeric_new = list(  x = as.numeric(regions_x_coord), y= as.numeric(  (dim(c2_gray)[2]) -  regions_y_coord), area = area_specialcol)


list_test_as_numeric_new_as_ppp = as.ppp(list_test_as_numeric_new)

 w_func <- matrix(0, (dim(c2_gray)[1]) , (dim(c2_gray)[2]) )



looping_endvalue = length(list_test_as_numeric_new_as_ppp$x )   



for (n_looping in 1:looping_endvalue){

w_func[ list_test_as_numeric_new_as_ppp$x[n_looping],      (  (dim(c2_gray)[2])  -   list_test_as_numeric_new_as_ppp$y[n_looping]  )   ] = 1
 


}



display(w_func, method="raster")




filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix_brig",  gsub("\\.", "dot", formatC( brightness_thresholdvalue ,format='f', digits=brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot )  ), "_areg",  gsub("\\.", "dot", max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed), "_reg_masscenterp",  ".png", sep="" ) 




png(filepath_of_image_for_output_temp, width= (dim(c2_gray)[1]) , height= (dim(c2_gray)[2]) );   

par(mar=c(0, 0, 0, 0));


display(w_func, method="raster")

dev.off();   





filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix_brig",  gsub("\\.", "dot", formatC( brightness_thresholdvalue ,format='f', digits=brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot )  ), "_areg",  gsub("\\.", "dot", max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed), "_trdc", ".png", sep="" ) 



maskimage_in_ebimageformat = readImage( filepath_output_c2_gray_eval_brightnessabovethresholdvalue_cnt )


maskimage_in_ebimageformat_gray = channel(maskimage_in_ebimageformat, 'gray')

maskimage_thresholded = thresh(maskimage_in_ebimageformat_gray, 10, 10, 0.05)




c2_gray_original_nonblurred_image <- readImage( filepath_of_image_for_input_original_nonblurred_images_combined )


plot(c2_gray_original_nonblurred_image)


c2_gray_original_nonblurred_image_gray = channel(c2_gray_original_nonblurred_image, 'gray')

plot(c2_gray_original_nonblurred_image_gray)




c2_gray_original_nonblurred_image_incolormode_keepinggrayshades <- rgbImage(red = c2_gray_original_nonblurred_image, green = c2_gray_original_nonblurred_image, blue = c2_gray_original_nonblurred_image )

plot(c2_gray_original_nonblurred_image_incolormode_keepinggrayshades)



maskimage_transparentlyoverlayed_over_orginalnonblurredimage = paintObjects( maskimage_in_ebimageformat_gray  , c2_gray_original_nonblurred_image_incolormode_keepinggrayshades  , col=c('#ff00ff', '#00ff00'), opac=c(0.1, 0.1) )


plot( maskimage_transparentlyoverlayed_over_orginalnonblurredimage )




writeImage(maskimage_transparentlyoverlayed_over_orginalnonblurredimage, filepath_of_image_for_output_temp, quality=100);




filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix_brig",  gsub("\\.", "dot", formatC( brightness_thresholdvalue ,format='f', digits=brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot )  ), "_areg",  gsub("\\.", "dot", max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed), "_trsc", ".png", sep="" ) 



maskimage_in_ebimageformat = readImage( filepath_output_c2_gray_eval_brightnessabovethresholdvalue_cnt )


maskimage_in_ebimageformat_gray = channel(maskimage_in_ebimageformat, 'gray')

maskimage_thresholded = thresh(maskimage_in_ebimageformat_gray, 10, 10, 0.05)




c2_gray_original_nonblurred_image <- readImage( filepath_of_image_for_input_original_nonblurred_images_combined )


plot(c2_gray_original_nonblurred_image)


c2_gray_original_nonblurred_image_gray = channel(c2_gray_original_nonblurred_image, 'gray')

plot(c2_gray_original_nonblurred_image_gray)




c2_gray_original_nonblurred_image_incolormode_keepinggrayshades <- rgbImage(red = c2_gray_original_nonblurred_image, green = c2_gray_original_nonblurred_image, blue = c2_gray_original_nonblurred_image )

plot(c2_gray_original_nonblurred_image_incolormode_keepinggrayshades)



maskimage_transparentlyoverlayed_over_orginalnonblurredimage = paintObjects( maskimage_in_ebimageformat_gray  , c2_gray_original_nonblurred_image_incolormode_keepinggrayshades  , col=c('#00ff00', '#00ff00'), opac=c(0.1, 0.1)  )


plot( maskimage_transparentlyoverlayed_over_orginalnonblurredimage )



writeImage(maskimage_transparentlyoverlayed_over_orginalnonblurredimage, filepath_of_image_for_output_temp, quality=100);




filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix_brig",  gsub("\\.", "dot", formatC( brightness_thresholdvalue ,format='f', digits=brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot )  ), "_areg",  gsub("\\.", "dot", max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed), "_truc", ".png", sep="" ) 




maskimage_in_ebimageformat = readImage( filepath_output_c2_gray_eval_brightnessabovethresholdvalue_cnt )


maskimage_in_ebimageformat_gray = channel(maskimage_in_ebimageformat, 'gray')

maskimage_thresholded = thresh(maskimage_in_ebimageformat_gray, 10, 10, 0.05)




c2_gray_original_nonblurred_image <- readImage( filepath_of_image_for_input_original_nonblurred_images_combined )


plot(c2_gray_original_nonblurred_image)


c2_gray_original_nonblurred_image_gray = channel(c2_gray_original_nonblurred_image, 'gray')

plot(c2_gray_original_nonblurred_image_gray)





c2_gray_original_nonblurred_image_incolormode_keepinggrayshades <- rgbImage(red = c2_gray_original_nonblurred_image, green = c2_gray_original_nonblurred_image, blue = c2_gray_original_nonblurred_image )

plot(c2_gray_original_nonblurred_image_incolormode_keepinggrayshades)



maskimage_transparentlyoverlayed_over_orginalnonblurredimage = paintObjects( maskimage_in_ebimageformat_gray  , c2_gray_original_nonblurred_image_incolormode_keepinggrayshades  , col=c('#ff0000', NA), opac=c(1.0, NA) )


plot( maskimage_transparentlyoverlayed_over_orginalnonblurredimage )




writeImage(maskimage_transparentlyoverlayed_over_orginalnonblurredimage, filepath_of_image_for_output_temp, quality=100);






list_test_as_numeric_new_as_ppp

list_test_as_numeric_new_as_ppp$x

list_test_as_numeric_new_as_ppp$y


list_test_as_numeric_new_as_ppp_situation_current <-  list_test_as_numeric_new_as_ppp


list_test_as_numeric_new_as_ppp_xcoord_situation_current <-  list_test_as_numeric_new_as_ppp$x

list_test_as_numeric_new_as_ppp_ycoord_situation_current <-  list_test_as_numeric_new_as_ppp$y





combination_of_properties_about_regions_situation_current <- cbind( region_index_situation_current, area_situation_current, average_signal_per_pixel_of_region_situation_current,  signal_per_area_of_region_situation_current,  list_test_as_numeric_new_as_ppp_xcoord_situation_current, list_test_as_numeric_new_as_ppp_ycoord_situation_current   )


str( combination_of_properties_about_regions_situation_current  )

head( combination_of_properties_about_regions_situation_current , 10 )



combination_of_properties_about_regions_writeoutputformatting <- combination_of_properties_about_regions_situation_current

colnames(combination_of_properties_about_regions_writeoutputformatting)[1] <- "region_index"

colnames(combination_of_properties_about_regions_writeoutputformatting)[2] <- "area"

colnames(combination_of_properties_about_regions_writeoutputformatting)[3] <- "average_signal_per_pixel_of_the_region"

colnames(combination_of_properties_about_regions_writeoutputformatting)[4] <- "signal_per_area_of_the_region"

colnames(combination_of_properties_about_regions_writeoutputformatting)[5] <- "x_coordinate_of_the_region_s_mass_center_point"

colnames(combination_of_properties_about_regions_writeoutputformatting)[6] <- "y_coordinate_of_the_region_s_mass_center_point"

head( combination_of_properties_about_regions_writeoutputformatting, 10 )




filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix_brig",  gsub("\\.", "dot", formatC( brightness_thresholdvalue ,format='f', digits=brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot )  ), "_areg",  gsub("\\.", "dot", max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed), "_reg_statmeasures",  ".txt", sep="" ) 



write.table(combination_of_properties_about_regions_writeoutputformatting, filepath_of_image_for_output_temp,sep="\t", row.names=FALSE, quote=F,fileEncoding="UTF-8", append=FALSE)



         } else {  


combination_of_properties_about_regions_writeoutputformatting_simplenotationthat_theanalysis_didnotidentify_regions_basedonthegivenconditions <- "The analysis did not identify regions based on the given conditions,"   


filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix_brig",  gsub("\\.", "dot", formatC( brightness_thresholdvalue ,format='f', digits=brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot )  ), "_areg",  gsub("\\.", "dot", max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed), "_reg_statmeasures",  ".txt", sep="" ) 



write.table( combination_of_properties_about_regions_writeoutputformatting_simplenotationthat_theanalysis_didnotidentify_regions_basedonthegivenconditions, filepath_of_image_for_output_temp,sep="\t", row.names=FALSE, quote=F,fileEncoding="UTF-8", append=FALSE)


         }    


      }    


   }    



}    



