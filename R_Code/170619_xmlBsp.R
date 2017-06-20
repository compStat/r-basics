library(XML)

xmlfile <- xmlTreeParse( # Einlesen von XML
  "data/mail.xml", 
  useInternalNodes = TRUE
)

xmlList <- xmlToList(xmlfile) # Umwandlung in list
xmlToDataFrame(xmlfile) # Umwandlung in data.frame

# Ausschreiben:
notes <- newXMLNode("notes") # erzeugt die höchste Hierarchie von Knoten

listToXML <- function(node, sublist) {
  # Funktion zum hinzufügen eines XML Baumes
  # node: Node in die eingefügt werden soll
  # sublist: Liste mit hierarchischer Struktur zum Einfügen
  for(i in 1:length(sublist)) {
    child <- newXMLNode(names(sublist)[i], parent=node)
    if (typeof(sublist[[i]]) == "list") {
      listToXML(child, sublist[[i]])
    }
    else {
      xmlValue(child) <- sublist[[i]]
    }
  }
}

listToXML(notes, xmlList)
saveXML(notes, file = "data/mailOut.xml")

