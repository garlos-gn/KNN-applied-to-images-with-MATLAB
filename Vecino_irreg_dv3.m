function [salida, npuntos]=Vecino_irreg_dv3(f, calidad)
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
    
    X_upd=X;
    X_upi=X;
    X_dwn=X;
    Y_upd=Y;
    Y_upi=Y;
    Y_dwn=Y;
    
    for i=length(X)
        X_upd(i)=X(i)+1;
        Y_upd(i)=Y(i)-1;
        X_upi(i)=X(i)-1;
        Y_upi(i)=Y(i)-1;
        X_dwn(i)=X(i);
        Y_dwn(i)=Y(i)+1;
        
        if(X_upd(i)>B(2))
            X_upd(i)=X_upd(i)-1;
        end
        
        if(Y_upd(i)<1)
            Y_upd(i)=Y_upd(i)+1;
        end
        
        if(X_upi(i)<1)
            X_upi(i)=X_upi(i)+1;
        end
        
        if(Y_upi(i)<1)
            Y_upi(i)=Y_upi(i)+1;
        end
        
        if(Y_dwn(i)<1)
            Y_dwn(i)=Y_dwn(i)+1;
        end
    end

    for l=2:length(X_upd)
        for m=1:l-1
            if(Y_upd(l)==Y_upi(m) && X_upd(l)==X_upi(m))
                X_upd(m)=0;
                Y_upd(m)=0;
            end
            if(Y_upd(l)==Y_dwn(m) && X_upd(l)==X_upi(m))
                X_dwn(m)=0;
                Y_dwn(m)=0;
            end
        end
    end
    
    for l=2:length(X_upi)
        for m=1:l-1
            if(Y_upi(l)==Y_dwn(m) && X_upi(l)==X_upi(m))
                X_dwn(m)=0;
                Y_dwn(m)=0;
            end
        end
    end
    X_final=[X_upd X_upi X_dwn];
    Y_final=[Y_upd Y_upi Y_dwn];
    
    X_final=X_final(find(X_final));
    Y_final=Y_final(find(Y_final));
    
    npuntos=length(X_final);
    
    salida=Vecino_irreg(X_final, Y_final, f);
end
