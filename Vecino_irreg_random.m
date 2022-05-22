function [salida]=Vecino_irreg_random(f, longi)
    B=size(f);
    X=randi(B(2),1,longi);
    Y=randi(B(1),1,longi);
    
    salida=Vecino_irreg(X, Y, f);
end
