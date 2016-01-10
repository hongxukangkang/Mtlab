function Tri_grid = trigrid(Nu,Nv)
    i = (1:(Nu-1)*Nv-1).';
    i(Nv:Nv:end) = [];
    Tri_grid = [i,i+1,i+Nv;
        i+1,i+Nv+1,i+Nv];
end
