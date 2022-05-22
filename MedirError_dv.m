function [Error_dv, Error_dv3, npuntos_dv, npuntos_dv3]=MedirError_dv(f, calidad) 
    [salida_dv, npuntos_dv]=Vecino_irreg_dv(f, calidad);
    [salida_dv3, npuntos_dv3]=Vecino_irreg_dv3(f, calidad); 

    E=sum(sum(sum(f))); 
    Error_dv3=sum(sum(sum(abs(f-salida_dv3))))/E*100; 
    Error_dv=sum(sum(sum(abs(f-salida_dv))))/E*100; 
    figure, image(salida_dv)
    figure, image(salida_dv3)
    figure, image(f)
end
