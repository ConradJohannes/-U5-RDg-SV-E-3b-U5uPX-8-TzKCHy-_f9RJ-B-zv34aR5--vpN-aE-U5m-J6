function Pattern_data_save(Name)
%% Diese Funktion speicher Daten zu einem Muster 'Name' in die XML-Datei 'Pattern_data.xml'
%% Daten werden durch Matlab vom System abgegriffen (Systemzeit und Windows-Nutername).
global Fehler
time=fix(clock);
docNode = xmlread('C:/Users/Johan/Documents/MATLAB/Pattern_data.xml');
Pattern=docNode.getDocumentElement;
%%Ein neuer Knoten 'Name' wird erstellt.
New_Pattern = docNode.createElement(Name);     
name_node = docNode.createElement('Name');
name_text = docNode.createTextNode(getenv('UserName'));
name_node.appendChild(name_text);
New_Pattern.appendChild(name_node);
time_node=docNode.createElement('system-time');
time_text=docNode.createTextNode(num2str(time));
time_node.appendChild(time_text);
New_Pattern.appendChild(time_node);
%%Der Knoten 'Name' mit seinen Unterknoten wird an das Dokument angefügt 
%%Falls dies schon zu beginn geschieht wird ein self-closing Node erstellt!
docNode.getDocumentElement.appendChild(New_Pattern);  
%%Die ergänzte XML wird abgespeichert
xmlFileName = ['Pattern_data.xml'];
xmlwrite(xmlFileName,docNode);
end
