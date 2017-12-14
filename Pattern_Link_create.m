function Pattern_Link_create(Name_1,New_Name)
%% Falls die Funktion 'Pattern_Link_check' ein identisches Muster in Pattern.xml gefunden hat,
%% speichert diese Funktion den Namen der identischen Funktion 'New_Name' in den neuen Eintrag der Funktion Name.
docNode = xmlread('C:/Users/Johan/Documents/MATLAB/Pattern.xml');
Pattern=docNode.getDocumentElement;
%%Ein neuer Knoten 'Name_1' wird erstellt.
New_Pattern = docNode.createElement(Name_1);     
Link_Pattern= docNode.createTextNode(New_Name);
New_Pattern.appendChild(Link_Pattern);
docNode.getDocumentElement.appendChild(New_Pattern);  
%%Die ergänzte XML wird abgespeichert
xmlFileName = ['Pattern.xml'];
xmlwrite(xmlFileName,docNode);
end