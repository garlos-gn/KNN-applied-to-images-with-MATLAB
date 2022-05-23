# KNN applied to images with MATLAB and paralellization:

This is the mix of two different projects: applying the KNN algorithm to images and trying to make this process faster by parallelizing the different "for" loops.

1. Building KNN:

The idea is building a mesh (the Voronoi Regions by using the generator points, taking this values from the original image (in each of the different channels of the RGB image), measuring the distance from each point to the different generator points and finally aproximating the closest ones to these values. The code can be found in the "Vecino_irreg.m" script.

The key to the problem lies in the proper selection of the generating points. The first idea (after choosing them randomly) is to get the points where the most abrupt changes occur, or where more definition is needed, such as textures. That is why the derivative is used in function "Vecino_irreg_dv.m". An aditional parameter is introduced in order to get rid of the points where there is not a big value of the derivative by umbralizing.

In the "Vecino_irreg_dv3.m" script, we can find a tool that tries to improve the results by setting three generator points instead of just one. The problem of this approach is that the computation of the images is increased, making it less eficient and improving the image just a little bit.

The last implementation of the code, "Vecino_irreg_dv_cte.m" tries to set generator values in the constant zones of the images by using the bubble algorithm.

A comparation between the different models is done in the "MedirError.m", "MedirError_dv.m" and "MedirError_dv_cte.m" scripts.

2. Paralellizating the code:

In the "Paralellization functions" folder, there are 4 different functions that tries to paralellizate the different "for" loops by using the "parfor" loops. This function just uses the different workers from the CPU. It is not explored the use of GPU to boost these functions, that can be made by using the "gpuDevice" function.

As can be found, it is recommended to paralellizate the loop that iterates through the different channels of the image. Finally, a comparation between the temporal performance is shown in "Vecino_par_comparativa.m" function
