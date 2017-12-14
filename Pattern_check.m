function m=Pattern_check(Name) 
%% Diese Funktion überprüft ob der Name 'Name' in der XML-Datei Pattern.xml schon vergeben ist.
docNode = xmlread('C:/Users/Johan/Documents/MATLAB/Pattern.xml');
Pattern=docNode.getDocumentElement;
Index=Pattern.getFirstChild;
 %%Solange die Knoten nicht leer sind, wird überprüft ob der Name mit 'Name' übereinstimmt.
while ~isempty(Index)          
    if strcmpi(Index.getNodeName, Name)
        m=1;
        break
    else
        Index=Index.getNextSibling;
        m=0;
    end
end
end
        