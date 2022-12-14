#   "Neural image brightness cluster analysis script" developed, created and programmed by Lauri Lahti, Department of Computer Science, Aalto University School of Science, Finland (email: lauri.lahti@aalto.fi), first published on 15 July 2022 and openly available in the following document: Lahti, Lauri (2022). Developing ethical and transparent artificial intelligence algorithms to support decision making in healthcare based on brain research and personal care events of patients. Research article manuscript self-archived on 15 July 2022 at https://aaltodoc.aalto.fi/handle/123456789/115565. Open access: http://urn.fi/URN:NBN:fi:aalto-202207154400.

#   This script can be used by anyone for non-commercial purposes while citing the just-mentioned research article (Lahti, Lauri, 2022) which provides further details.

#   This current version (20230111c) of the script is completed and published by Lauri Lahti at https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script on 11 January 2023.

#   Please kindly note: This current version (20230111c) of the script is intended primarily for testing purposes and a later version of the script is expected to have further functionality. 

#   If the running of the script "neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R" produces error messages this may be related to having some conflicting settings. Some error messages can originate from diverse file type codings used in the image files which can be difficult to interpret by the script. The errors concerning these image file type codings may become solved by running the script "supplementary-script-for-reading-and-writing-files-of-inputimages-and-maskimages-developed-by-lauri-lahti.R" before running the script "neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R".


if( !("magrittr" %in% rownames( installed.packages() ) ) ) {
   install.packages("magrittr")
}

if( !("tidyverse" %in% rownames( installed.packages() ) ) ) {
   install.packages("tidyverse")
}

if( !("imager" %in% rownames( installed.packages() ) ) ) {
   install.packages("imager")
}

if( !("magick" %in% rownames( installed.packages() ) ) ) {
   install.packages("magick")
}

if( !("spatstat" %in% rownames( installed.packages() ) ) ) {
   install.packages("spatstat")
}

if( !("BiocManager" %in% rownames( installed.packages() ) ) ) {
   install.packages("BiocManager")
}

if( !("locfit" %in% rownames( installed.packages() ) ) ) {
   install.packages("locfit")
}

if( !("EBImage" %in% rownames( installed.packages() ) ) ) {
   BiocManager::install("EBImage", update=FALSE, ask=FALSE)
}

if( !("ggplot2" %in% rownames( installed.packages() ) ) ) {
   install.packages("ggplot2")
}


library(magrittr)
library(tidyverse)
library(imager)
library(magick)
library(spatstat)
library(BiocManager)
library(locfit)
library(EBImage)
library(ggplot2)


current_working_directory <- "."

filepath_segment_for_folder_inputimages <- "/inputimages/"

filepath_segment_for_folder_maskimages <- "/maskimages/"

filepath_segment_for_folder_experiments <- "/experiments/"

file_name_supplement_for_maskimages <- "_mask01nb"

analysis_list_of_filenames_inputimages <- c(
"image001"  
)



size_of_brush_of_Gaussian_kernel <- 51

value_of_sigma_for_brush_of_Gaussian_kernel_list <- c( 0.8 )

analysis_list_of_brightness_thresholdvalue <- c( 0.10 )

analysis_list_of_max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed <- c( -1 )

brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot = 2

inputimages_from_imagestack_frame_to_be_picked <- 1


analysis_list_of_filenames_initial <- NULL

analysis_list_of_filenames_initial_original_nonblurred_images <- NULL

analysis_list_of_folders_initial <- NULL


list_of_files_to_be_removed <- list.files( paste( current_working_directory , filepath_segment_for_folder_experiments, sep="" )  , include.dirs = TRUE, full.names = TRUE, recursive = TRUE )

list_of_files_to_be_removed <-  list_of_files_to_be_removed[lapply(list_of_files_to_be_removed,function(x) length(grep("readme-experiments.txt",x,value=FALSE))) == 0]

unlink( list_of_files_to_be_removed , recursive = TRUE )
 





for( analysis_list_of_filenames_inputimages_counter in 1:(   length( analysis_list_of_filenames_inputimages )  ) )  {


for( value_of_sigma_for_brush_of_Gaussian_kernel_list_counter in 1:(   length( value_of_sigma_for_brush_of_Gaussian_kernel_list )  ) )  {



sigma_value_for_brush = value_of_sigma_for_brush_of_Gaussian_kernel_list[value_of_sigma_for_brush_of_Gaussian_kernel_list_counter]


filepath_of_image_for_blurringinput_initial_withoutending =  analysis_list_of_filenames_inputimages[analysis_list_of_filenames_inputimages_counter] 


filepath_of_image_for_blurringinput_combined = paste( current_working_directory , filepath_segment_for_folder_inputimages , filepath_of_image_for_blurringinput_initial_withoutending  , ".tif", sep="")




if( sigma_value_for_brush > -1 ) {


filepath_of_image_for_output_combined = paste( current_working_directory ,  filepath_segment_for_folder_inputimages , filepath_of_image_for_blurringinput_initial_withoutending , "_sm",  gsub("\\.", "dot", sigma_value_for_brush) , ".tif", sep="")




image_test_in_ebimageformat_exp_temp <- readImage(filepath_of_image_for_blurringinput_combined)

writeImage(image_test_in_ebimageformat_exp_temp, "./temporary-image-file-1.tif", quality=100);

image_test_in_ebimageformat_exp <-  readImage( "./temporary-image-file-1.tif" )

plot(image_test_in_ebimageformat_exp)


image_test_in_ebimageformat_exp


w_brush = makeBrush(size = size_of_brush_of_Gaussian_kernel, shape = "gaussian", sigma = sigma_value_for_brush)

tibble(w_brush = w_brush[(nrow(w_brush)+1)/2, ]) %>% ggplot(aes(y = w_brush, x = seq(along = w_brush))) + geom_point()


nucSmooth = filter2(getFrame( image_test_in_ebimageformat_exp , inputimages_from_imagestack_frame_to_be_picked), w_brush)


EBImage::display(nucSmooth, method = "raster")


writeImage(nucSmooth, filepath_of_image_for_output_combined )


         if (   not(  is.null( analysis_list_of_filenames_initial )  )  )  { 

                          analysis_list_of_filenames_initial <- c(   analysis_list_of_filenames_initial , paste( filepath_of_image_for_blurringinput_initial_withoutending , "_sm",  gsub("\\.", "dot", sigma_value_for_brush) , sep="")     )

analysis_list_of_filenames_initial_original_nonblurred_images <- c(   analysis_list_of_filenames_initial_original_nonblurred_images , filepath_of_image_for_blurringinput_initial_withoutending      )

         } else {  

                          analysis_list_of_filenames_initial <- c( paste( filepath_of_image_for_blurringinput_initial_withoutending , "_sm",  gsub("\\.", "dot", sigma_value_for_brush) , sep="")     )

analysis_list_of_filenames_initial_original_nonblurred_images <- c(   filepath_of_image_for_blurringinput_initial_withoutending      )

         }




} else { 


         if (   not(  is.null( analysis_list_of_filenames_initial )  )  )  { 

                          analysis_list_of_filenames_initial <- c(   analysis_list_of_filenames_initial , filepath_of_image_for_blurringinput_initial_withoutending      )

analysis_list_of_filenames_initial_original_nonblurred_images <- c(   analysis_list_of_filenames_initial_original_nonblurred_images , filepath_of_image_for_blurringinput_initial_withoutending      )


         } else {  

                          analysis_list_of_filenames_initial <- c(  filepath_of_image_for_blurringinput_initial_withoutending   )

analysis_list_of_filenames_initial_original_nonblurred_images <- c(   filepath_of_image_for_blurringinput_initial_withoutending      )



         }




} 




}  


}  












	
for( counter_index_for_analysis in 1:length(analysis_list_of_filenames_initial) ) {

                   	
   for( counter_index_for_max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed in 1:length( analysis_list_of_max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed ) ) {

	
      for( counter_index_for_brightness_thresholdvalue in 1:length(analysis_list_of_brightness_thresholdvalue) ) {


filepath_of_image_for_input_folder_initial <- paste( current_working_directory ,  filepath_segment_for_folder_inputimages , sep="") 

filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_folder_initial <- paste( current_working_directory ,  filepath_segment_for_folder_maskimages , sep="")

filepath_of_image_for_input_filename_initial <- analysis_list_of_filenames_initial[ counter_index_for_analysis ]

filepath_of_image_for_input_filename_initial_original_nonblurred_images <- analysis_list_of_filenames_initial_original_nonblurred_images[ counter_index_for_analysis ]

filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_filename_initial <- paste( analysis_list_of_filenames_initial_original_nonblurred_images[ counter_index_for_analysis ] , file_name_supplement_for_maskimages, sep="" )



filepath_of_image_for_output_folder_initial <- paste( current_working_directory , filepath_segment_for_folder_experiments, "set", sprintf("%03d", counter_index_for_analysis ) , "/" , sep="")

dir.create( filepath_of_image_for_output_folder_initial )


         if (   not(  is.null( analysis_list_of_folders_initial )  )  )  { 

                          analysis_list_of_folders_initial <- c(   analysis_list_of_folders_initial , filepath_of_image_for_output_folder_initial     )


         } else {  

                          analysis_list_of_folders_initial <- c( filepath_of_image_for_output_folder_initial     )


         }




filepath_of_image_for_output_filename_initial <- analysis_list_of_filenames_initial[ counter_index_for_analysis ]

brightness_thresholdvalue <- analysis_list_of_brightness_thresholdvalue[ counter_index_for_brightness_thresholdvalue ]

filepath_of_image_for_input_combined <- paste( filepath_of_image_for_input_folder_initial, filepath_of_image_for_input_filename_initial, ".tif", sep="" ) 

filepath_of_image_for_input_original_nonblurred_images_combined <- paste( filepath_of_image_for_input_folder_initial, filepath_of_image_for_input_filename_initial_original_nonblurred_images, ".tif", sep="" ) 

filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_combined <- paste( filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_folder_initial, filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_filename_initial, ".png", sep="" ) 





c2 <- readImage(filepath_of_image_for_input_combined)



plot(c2)

if (colorMode(c2) != Grayscale) {

   c2_gray = channel(c2, 'gray')

} else {

    c2_gray = c2

}

plot(c2_gray)


image_test_in_ebimageformat_exp_original_nonblurred_temp <- readImage(filepath_of_image_for_input_original_nonblurred_images_combined)

writeImage(image_test_in_ebimageformat_exp_original_nonblurred_temp, "./temporary-image-file-1.tif", quality=100);

image_test_in_ebimageformat_exp_original_nonblurred <-  readImage( "./temporary-image-file-1.tif" )

plot(image_test_in_ebimageformat_exp_original_nonblurred)


	      
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




maskimage_in_ebimageformat_initial = readImage( filepath_of_image_for_input_maskdefinedbywhiteregiononblackbackground_combined )

maskimage_in_ebimageformat = getFrame( maskimage_in_ebimageformat_initial, i=1 )

if (colorMode(maskimage_in_ebimageformat) != Grayscale) {

   maskimage_in_ebimageformat_gray = channel(maskimage_in_ebimageformat, 'gray')

} else {

    maskimage_in_ebimageformat_gray = maskimage_in_ebimageformat

}

maskimage_thresholded = thresh(maskimage_in_ebimageformat_gray, 10, 10, 0.05)





c2_gray_original_nonblurred_image <- readImage("./temporary-image-file-1.tif" )


plot(c2_gray_original_nonblurred_image)


if (colorMode(c2_gray_original_nonblurred_image) != Grayscale) {

   c2_gray_original_nonblurred_image_gray = channel(c2_gray_original_nonblurred_image, 'gray')

} else {

    c2_gray_original_nonblurred_image_gray = c2_gray_original_nonblurred_image

}

plot(c2_gray_original_nonblurred_image_gray)



c2_gray_original_nonblurred_image = c2_gray_original_nonblurred_image_gray

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








c2_gray_original_nonblurred_image <- readImage( "./temporary-image-file-1.tif"  )


plot(c2_gray_original_nonblurred_image)


if (colorMode(c2_gray_original_nonblurred_image) != Grayscale) {

   c2_gray_original_nonblurred_image_gray = channel(c2_gray_original_nonblurred_image, 'gray')

} else {

   c2_gray_original_nonblurred_image_gray = c2_gray_original_nonblurred_image

}

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


list_test_as_numeric_new = list(  x = as.numeric(regions_x_coord), y= as.numeric(  regions_y_coord), area = area_specialcol)


list_test_as_numeric_new_as_ppp = as.ppp(list_test_as_numeric_new)

 w_func <- matrix(0, (dim(c2_gray)[1]) , (dim(c2_gray)[2]) )



looping_endvalue = length(list_test_as_numeric_new_as_ppp$x )   



for (n_looping in 1:looping_endvalue){

w_func[ list_test_as_numeric_new_as_ppp$x[n_looping],      (  (dim(c2_gray)[2])  -   list_test_as_numeric_new_as_ppp$y[n_looping]  )   ] = 1
 


}



image(w_func, axes = FALSE, col = grey(seq(0, 1, length = 256)))



filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix_brig",  gsub("\\.", "dot", formatC( brightness_thresholdvalue ,format='f', digits=brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot )  ), "_areg",  gsub("\\.", "dot", max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed), "_reg_masscenterp",  ".png", sep="" ) 




png(filepath_of_image_for_output_temp, width= (dim(c2_gray)[1]) , height= (dim(c2_gray)[2]) );   

par(mar=c(0, 0, 0, 0));

image(w_func, axes = FALSE, col = grey(seq(0, 1, length = 256)))
		 
dev.off();   





filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix_brig",  gsub("\\.", "dot", formatC( brightness_thresholdvalue ,format='f', digits=brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot )  ), "_areg",  gsub("\\.", "dot", max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed), "_trdc", ".png", sep="" ) 





maskimage_in_ebimageformat_initial = readImage( filepath_output_c2_gray_eval_brightnessabovethresholdvalue_cnt )

maskimage_in_ebimageformat = getFrame( maskimage_in_ebimageformat_initial, i=1 )


if (colorMode(maskimage_in_ebimageformat) != Grayscale) {

   maskimage_in_ebimageformat_gray = channel(maskimage_in_ebimageformat, 'gray')

} else {

    maskimage_in_ebimageformat_gray = maskimage_in_ebimageformat

}

maskimage_thresholded = thresh(maskimage_in_ebimageformat_gray, 10, 10, 0.05)






c2_gray_original_nonblurred_image <- readImage( "./temporary-image-file-1.tif" )



plot(c2_gray_original_nonblurred_image)


if (colorMode(c2_gray_original_nonblurred_image) != Grayscale) {

   c2_gray_original_nonblurred_image_gray = channel(c2_gray_original_nonblurred_image, 'gray')

} else {

   c2_gray_original_nonblurred_image_gray = c2_gray_original_nonblurred_image

}

plot(c2_gray_original_nonblurred_image_gray)


c2_gray_original_nonblurred_image = c2_gray_original_nonblurred_image_gray

c2_gray_original_nonblurred_image_incolormode_keepinggrayshades <- rgbImage(red = c2_gray_original_nonblurred_image, green = c2_gray_original_nonblurred_image, blue = c2_gray_original_nonblurred_image )

plot(c2_gray_original_nonblurred_image_incolormode_keepinggrayshades)



maskimage_transparentlyoverlayed_over_orginalnonblurredimage = paintObjects( maskimage_in_ebimageformat_gray  , c2_gray_original_nonblurred_image_incolormode_keepinggrayshades  , col=c('#ff00ff', '#00ff00'), opac=c(0.1, 0.1) )


plot( maskimage_transparentlyoverlayed_over_orginalnonblurredimage )




writeImage(maskimage_transparentlyoverlayed_over_orginalnonblurredimage, filepath_of_image_for_output_temp, quality=100)




filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix_brig",  gsub("\\.", "dot", formatC( brightness_thresholdvalue ,format='f', digits=brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot )  ), "_areg",  gsub("\\.", "dot", max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed), "_trsc", ".png", sep="" ) 




maskimage_in_ebimageformat_initial = readImage( filepath_output_c2_gray_eval_brightnessabovethresholdvalue_cnt )

maskimage_in_ebimageformat = getFrame( maskimage_in_ebimageformat_initial, i=1 )


if (colorMode(maskimage_in_ebimageformat) != Grayscale) {

   maskimage_in_ebimageformat_gray = channel(maskimage_in_ebimageformat, 'gray')

} else {

    maskimage_in_ebimageformat_gray = maskimage_in_ebimageformat

}

maskimage_thresholded = thresh(maskimage_in_ebimageformat_gray, 10, 10, 0.05)






c2_gray_original_nonblurred_image <- readImage( "./temporary-image-file-1.tif" )


plot(c2_gray_original_nonblurred_image)


if (colorMode(c2_gray_original_nonblurred_image) != Grayscale) {

   c2_gray_original_nonblurred_image_gray = channel(c2_gray_original_nonblurred_image, 'gray')

} else {

   c2_gray_original_nonblurred_image_gray = c2_gray_original_nonblurred_image

}

plot(c2_gray_original_nonblurred_image_gray)


c2_gray_original_nonblurred_image = c2_gray_original_nonblurred_image_gray

c2_gray_original_nonblurred_image_incolormode_keepinggrayshades <- rgbImage(red = c2_gray_original_nonblurred_image, green = c2_gray_original_nonblurred_image, blue = c2_gray_original_nonblurred_image )

plot(c2_gray_original_nonblurred_image_incolormode_keepinggrayshades)



maskimage_transparentlyoverlayed_over_orginalnonblurredimage = paintObjects( maskimage_in_ebimageformat_gray  , c2_gray_original_nonblurred_image_incolormode_keepinggrayshades  , col=c('#00ff00', '#00ff00'), opac=c(0.1, 0.1)  )


plot( maskimage_transparentlyoverlayed_over_orginalnonblurredimage )



writeImage(maskimage_transparentlyoverlayed_over_orginalnonblurredimage, filepath_of_image_for_output_temp, quality=100);




filepath_of_image_for_output_temp <- paste( filepath_of_image_for_output_folder_initial, filepath_of_image_for_output_filename_initial, "_maskedpix_brig",  gsub("\\.", "dot", formatC( brightness_thresholdvalue ,format='f', digits=brightness_thresholdvalue_toensureshowingtrailingzeros_numberofdigitsshownafterdecimaldot )  ), "_areg",  gsub("\\.", "dot", max_number_of_pixels_in_segment_so_that_this_segment_still_needs_to_be_removed), "_truc", ".png", sep="" ) 





maskimage_in_ebimageformat_initial = readImage( filepath_output_c2_gray_eval_brightnessabovethresholdvalue_cnt )

maskimage_in_ebimageformat = getFrame( maskimage_in_ebimageformat_initial, i=1 )


if (colorMode(maskimage_in_ebimageformat) != Grayscale) {

   maskimage_in_ebimageformat_gray = channel(maskimage_in_ebimageformat, 'gray')

} else {

   maskimage_in_ebimageformat_gray = maskimage_in_ebimageformat

}

maskimage_thresholded = thresh(maskimage_in_ebimageformat_gray, 10, 10, 0.05)






c2_gray_original_nonblurred_image <- readImage( "./temporary-image-file-1.tif" )


plot(c2_gray_original_nonblurred_image)


if (colorMode(c2_gray_original_nonblurred_image) != Grayscale) {

   c2_gray_original_nonblurred_image_gray = channel(c2_gray_original_nonblurred_image, 'gray')

} else {

   c2_gray_original_nonblurred_image_gray = c2_gray_original_nonblurred_image

}

plot(c2_gray_original_nonblurred_image_gray)



c2_gray_original_nonblurred_image = c2_gray_original_nonblurred_image_gray


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


print( "The running of the script https://github.com/laurilahti/neural-image-brightness-cluster-analysis-script/blob/main/neural-image-brightness-cluster-analysis-script-developed-by-lauri-lahti.R has ended and aimed to generate analysis results." )






