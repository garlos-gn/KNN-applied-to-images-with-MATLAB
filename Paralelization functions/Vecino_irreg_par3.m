function [salida]=Vecino_irreg_par3(X, Y, f)
    salida=f;
    for k=1:3
        for j=1:length(f(1,:,k))
            for i=1:length(f(:,1,k))
                dx=X;
                parfor l=1:length(X)
                    dx(l)=sqrt((Y(l)-i)^2+(X(l)-j)^2);
                end
                indice=find(dx(:)==min(dx(:)));
                if(length(indice)>1)
                    indice=indice(1);
                end
                salida(i,j,k)=f(Y(indice),X(indice),k);
            end
        end
    end
end