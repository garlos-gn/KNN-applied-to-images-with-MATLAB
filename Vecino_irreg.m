function [salida]=Vecino_irreg(X, Y, f)
%#codegen
    salida=f;
    dx=X;
    indice=1;
    for k=1:3
        for j=1:length(f(1,:,k))
            for i=1:length(f(:,1,k))
                for l=1:length(X)
                    dx(l)=sqrt((Y(l)-i)^2+(X(l)-j)^2);
                end
                indices=find(dx(1,:)==min(dx(1,:)));
                if(length(indices)>1)
                    indice=indices(1);
                end
                salida(i,j,k)=f(Y(indice),X(indice),k);
            end
        end
    end
end
