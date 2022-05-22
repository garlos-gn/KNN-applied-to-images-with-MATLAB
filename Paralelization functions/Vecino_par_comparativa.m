function [t]=Vecino_par_comparativa(f, longi)
    B=size(f);
    X=randi(B(2),1,longi);
    Y=randi(B(1),1,longi);
    tic
    salida=Vecino_irreg(X,Y,f);
    t0=toc
    parfor i=1:3
    end
%     tic
%     salida=Vecino_irreg_par1(X, Y, f);
%     t1=toc
%     tic
%     salida=Vecino_irreg_par2(X, Y, f);
%     t2=toc
%     tic
%     salida=Vecino_irreg_par3(X, Y, f);
%     t3=toc
    tic
    salida=Vecino_irreg_par4(X, Y, f);
    t4=toc
    t=[t4];
end
