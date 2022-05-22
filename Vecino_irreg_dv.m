function [salida, npuntos]=Vecino_irreg_dv(f, calidad)
    B=size(f);
    C=diff(f);
    C=abs(C);
   
    X=[];
    Y=[];
    if (B(2)>B(1))
        for k=1:3
            for j=1:length(C(:,1,k))
                indice=find(C(j,:,k)>calidad);
                
                for l=1:length(X)
                    for m=1:length(indice)
                        if(X(l)==indice(m) && Y(l)==j)
                            indice(m)=0;
                        end
                    end
                end
                indice=indice(find(indice));
                
                X=[X indice];
                for i=1:length(indice)
                    Y=[Y j];
                end
            end
        end
    else
        for k=1:3
            for j=1:length(C(1,:,k))
                indice=find(C(:,j,k)>calidad);
                indice=indice';
                
                for l=1:length(Y)
                    for m=1:length(indice)
                        if(Y(l)==indice(m) && X(l)==j)
                            indice(m)=0;
                        end
                    end
                end
                indice=indice(find(indice));
                
                Y=[Y indice];
                for i=1:length(indice)
                    X=[X j];
                end
            end
        end
    end

    npuntos=length(X);
    
    salida=Vecino_irreg(X, Y, f);
end
