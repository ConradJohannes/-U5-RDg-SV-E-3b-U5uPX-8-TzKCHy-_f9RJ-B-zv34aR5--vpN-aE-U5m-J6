function Pattern_fill(num)
%% Diese Funktion erzeugt zufällige Einträge in Pattern.xml und Pattern_data.xml.
%% Die Funktion sollte nur auf leere Dateien angewendet werden, da es sonst zu Komplikationen führen kann.
Index=0;
for ii=1 : num
    A=rand(3);
    Index=Index+1;
    Name=['Name_' num2str(Index)];
        while Pattern_check(Name)==1
            Index=Index+1;
            Name=['Name_' num2str(Index)];
        end
            for zz=1 :3
                for xx=1 :3
                    if A(zz,xx)<(1/3)
                        A(zz,xx)=1;
                    elseif A(zz,xx)>=(1/3) && A(zz,xx)<(2/3)
                        A(zz,xx)=2;
                    else
                        A(zz,xx)=3;
                    end
                end
            end
        Pattern_save_all(A,Name);
    end
end

                    
                