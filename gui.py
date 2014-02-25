# -*- coding: utf-8 -*-
# sudo apt-get install python3-gi ???
from gi.repository import Gtk # gtk importieren
def skype_installieren(button):
    print("Skype wird installiert")
    
builder = Gtk.Builder() #buider starten ...
builder.add_from_file("ui.ui") # ... und Design-Datei laden
window = builder.get_object("window1") # Fenster 1 auswählen ...
window.show_all() #... und anzeigen
handlers = {
    "onDeleteWindow": Gtk.main_quit,
    "skype_installieren": skype_installieren
}
builder.connect_signals(handlers)
Gtk.main()
