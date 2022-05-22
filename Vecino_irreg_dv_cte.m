function [salida, npuntos]=Vecino_irreg_dv_cte(f, calidad,sep_maxima)
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
    
    ordenado=0;
    i=0;
    while (i<length(X) && ordenado==0)
        i=i+1;
        ordenado=1;
        for j=1:length(X)-i
            if(X(j)>X(j+1))
                ordenado=0;
                aux=X(j);
                X(j)=X(j+1);
                X(j+1)=aux;
                aux2=Y(j);
                Y(j)=Y(j+1);
                Y(j+1)=aux2;
            end
        end
    end
    
    auxX=[];
    auxY=[];
    for i=1:length(X)-1
        if (X(i)-X(i+1)>sep_maxima || Y(i)-Y(i+1)>sep_maxima)
            aux1=ceil((X(i)+X(i+1))/2);
            auxX=[auxX aux1];
            aux2=ceil((Y(i)+Y(i+1))/2);
            auxY=[auxY aux2];
        end
        
    end
    
    
    X_final=[X auxX];
    Y_final=[Y auxY];
    
    X_final=X_final(find(X_final));
    Y_final=Y_final(find(Y_final));
    
    npuntos=length(X_final);
    
    salida=Vecino_irreg(X_final, Y_final, f);
end
