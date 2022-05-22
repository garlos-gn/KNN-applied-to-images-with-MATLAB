function [Error_dv, Error_dv_cte, npuntos_dv, npuntos_dv_cte]=MedirError_dv_cte(f, calidad, sep_maxima) 
    [salida_dv, npuntos_dv]=Vecino_irreg_dv(f, calidad);
    [salida_dv_cte, npuntos_dv_cte]=Vecino_irreg_dv_cte(f, calidad,sep_maxima); 

    E=sum(sum(sum(f))); 
    Error_dv_cte=sum(sum(sum(abs(f-salida_dv_cte))))/E*100; 
    Error_dv=sum(sum(sum(abs(f-salida_dv))))/E*100; 
    figure, image(salida_dv) 
    figure, image(salida_dv_cte)
    figure, image(f)
end
