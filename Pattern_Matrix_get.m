function Y=Pattern_Matrix_get(Index)
%% Diese Funktion lädt die Matrix Index. welche durch die variable Index aus Pattern.xml übergeben wird.
A=[];
x=[];
Y=[];
Row=Index.getFirstChild;
while ~isempty(Row)
    Line=Row.getFirstChild;
     while ~isempty(Line) 
        num=Line.getTextContent;
        x=horzcat(x,str2num(num));
        Line=Line.getNextSibling;
    end
    Y=vertcat(Y,x);
    x=[];
    try
        Row=Line.getParentNode;
    catch 
    end
    Row=Row.getNextSibling;
end
end