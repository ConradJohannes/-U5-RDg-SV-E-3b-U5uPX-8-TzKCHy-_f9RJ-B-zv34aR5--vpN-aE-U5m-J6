function Y=Run_load(Path)
x=[];
Y=[];
DomNode=xmlread('C:/Users/Johan/Documents/MATLAB/Run.xml');
doc=DomNode.getDocumentElement;
Index=doc.getFirstChild;
%%Sucht die Daten 'Path' in der XML Datei.
while ~isempty(Index)
    if strcmpi(Index.getNodeName, Path)
        break;
    else
        Index = Index.getNextSibling;
    end
end
    Y=Pattern_Matrix_get(Index);
end