function [salida]=Vecino_irreg_par4(X, Y, f)
    salida=f;
    a=length(f(:,1,1));
    
    parfor k=1:3
        dx=X;
        for j=1:length(f(1,:,k))
            for i=1:a
                for l=1:length(X)
                    dx(l)=sqrt((Y(l)-i)^2+(X(l)-j)^2);
                end
                indice=find(dx(1,:)==min(dx(1,:)));
                if(length(indice)>1)
                    indice=indice(1);
                end
                salida=f(Y(indice),X(indice),k);
            end
        end
    end
end
