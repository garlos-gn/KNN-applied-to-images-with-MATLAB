function [Error_random, Error_dv, npuntos]=MedirError(f, calidad)
    [salida_dv, npuntos]=Vecino_irreg_dv(f, calidad);
    salida_random=Vecino_irreg_random(f, npuntos);

    E=sum(sum(sum(f)));
    Error_random=sum(sum(sum(abs(f-salida_random))))/E*100;
    Error_dv=sum(sum(sum(abs(f-salida_dv))))/E*100;
    figure, image(salida_random)
    figure, image(salida_dv)
    figure, image(f)
end
