function Y=Pattern_load(Pattern)
%% Gibt das Muster 'Pattern' als Matrix aus.
global Fehler
x=[];
Y=[];
%%Falls es Muster: 'Pattern' nicht gibt wird die Funktion beendet. 
if Pattern_check(Pattern)==0
    Fehler=1
    return
end
DomNode=xmlread('C:/Users/Johan/Documents/MATLAB/Pattern.xml');
doc=DomNode.getDocumentElement;
Index=doc.getFirstChild;
%%Sucht das Muster 'Pattern' in der XML Datei.
while ~isempty(Index)
    if strcmpi(Index.getNodeName, Pattern)
        Index_saved=Index;
        break;
    else
        Index = Index.getNextSibling;
    end
end
    Y=Pattern_Matrix_get(Index);
% Falls das Muster 'Pattern' verlinkt ist, gibt 'Pattern_Matrix_get' [] aus.
if isempty(Y)==1
    Link=Index.getFirstChild;
% Der Link wird ausgelesen
    Pattern=Link.getTextContent;
% Die hiesige  Funktion 'Pattern_load' wir erneut auf das verlinkte Muster
% aufgerufen.
    Y=Pattern_load(Pattern);
end
end

