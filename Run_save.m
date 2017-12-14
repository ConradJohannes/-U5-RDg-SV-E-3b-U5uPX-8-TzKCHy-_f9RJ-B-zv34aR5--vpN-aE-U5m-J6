function Run_save(A,Path)
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
[Spalten,Zeilen]=size(A);
Row=Index.getFirstChild;
for ii=1 : Spalten
    Line=Row.getFirstChild;
     for zz=1 : Zeilen
      Name=Line.getTextContent;
      line_node = DomNode.createElement(Name);
      name_text = DomNode.createTextNode(num2str(A(ii,zz)));
      line_node.appendChild(name_text);
     % line_node.replaceChild(Name);
      Row.removeChild(Name);
      Row.appenChild(line_node);
    end
    try
        Row=Line.getParentNode;
    catch 
    end
    Row=Row.getNextSibling;
end
end