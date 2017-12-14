function [time,Username]=Pattern_data_load(Pattern)
%%Diese Punktionen gibt daten zu einem in Pattern.xml gespeiertes Muster
%%aus.
DomNode=xmlread('C:/Users/Johan/Documents/MATLAB/Pattern_data.xml');
doc=DomNode.getDocumentElement;
Index=doc.getFirstChild;
%%Sucht das Muster 'Pattern' in der XML Datei.
while ~isempty(Index)
    if strcmpi(Index.getNodeName, Pattern)
        break;
    else
        Index = Index.getNextSibling;
    end
end
%%Der gespeicherte Nutzername wird abgerufen
name_node=Index.getFirstChild;
Username=name_node.getTextContent;
%%Die gespeicherte Systemzeit wird abgerufen
time_node=name_node.getNextSibling;
time=time_node.getTextContent;
end