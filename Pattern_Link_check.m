function New_bool=Pattern_Link_check(A,Name_1)
%% Diese Funktion üerprüft ob ein Muster, welches identisch mit 'A' ist, schon in Pattern.xml vorhanden ist.
global Fehler
x=[];
Y=[];
New_bool=0;
if Pattern_check(Name_1)==1
    Fehler=1;
    return
end
DomNode=xmlread('C:/Users/Johan/Documents/MATLAB/Pattern.xml');
doc=DomNode.getDocumentElement;
Index=doc.getFirstChild;
while ~isempty(Index)
   Y=Pattern_Matrix_get(Index);
    try
        if Y==A
            New_Name=Index.getNodeName;
            Pattern_Link_create(Name_1,New_Name)
            New_bool=1;
            return;
        end
    catch
    end
    Y=[];
    Index=Index.getNextSibling;
end

end

