function [salida]=Vecino_irreg_par1(X, Y, f)
    salida=f;
    for k=1:3
        a=length(f(:,1,k));
        parfor j=1:length(f(1,:,k))
            for i=1:a
                for l=1:length(X)
                    dx=X;
                    dx(l)=sqrt((Y(l)-i)^2+(X(l)-j)^2);
                end
                indice=find(dx(1,:)==min(dx(1,:)));
                if(length(indice)>1)
                    indice=indice(1);
                end
                salida(i,j,k)=f(Y(indice),X(indice),k);
            end
        end
    end
end
