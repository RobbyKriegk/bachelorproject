
Testumgebung für die Erforschung der multimodalen Nutzerunterunterstützung in der visuellen Datenexploration.

**Grundlage:**
Die Grundlage für die Testumgebung bildet ein festgelegtes Node-Link-Diagramm. Das zugehörige Interface verfügt über die üblichen Interaktionsmöglichkeiten, wie Zoomen, Verschieben und Klicken. Die Software ist als Prototype zu sehen und hat keinen Anspruch auf Vollständigkeit oder fehlerfreie Funktionalität.

**Methoden:**
Das UI bietet eine strukturierte Oberfläche zur Implementierung von multimodalen Interaktionen. Zum Zeitpunkt der Abgabe ist eine kleine Auswahl von Methoden implementiert. Diese bieten bereits einige Funktionalitäten, welche zeigen sollen wie diese Software genutzt werden kann. 
Die visuellen Hinweise zeigen hierbei typische  Interaktionen von Nutzer und System. Die Farbauswahl gibt dem Nutzer die Möglichkeit, im Diagramm direkt die ausgewählten Informationen erkennen zu können. 
Die Proxies geben dem Nutzer in Verbindung mit der Farbauswahl die Möglichkeit zu erkennen, in welcher Richtung die meisten Knoten mit den gewünschten Informationen zu finden sind. 
Um diese visuelle Nutzerunterstützung nun multimodal zu Erweitern, wurden jeweils ein auditiver und vibrotaktiler Hinweis implementiert.
Der auditive Hinweis gibt dem Nutzer die Möglichkeit, einen spezifischen Ton mit der ausgewählten Farbe zu verknüpfen. Dies soll den Nutzer bei der weiteren Navigation unterstützen. Eine Möglichkeit hierfür ist, den Ton beim aktiven Navigieren im Diagramm abzuspielen und ihm je nach Anzahl der Knoten in der entsprechenden Richtung die Lautstärke zu verändern. Dies ist allerdings nicht zum Zeitpunkt der Abgabe implementiert.
Der vibrotaktile Hinweis verfolgt einen anderen Ansatz und gibt dem Nutzer einen intitialen Hinweis über die generelle Anzahl der ausgewählten Informationen/Knoten. Hierfür vibrieren die ausgewählten Knoten mit unterschiedlichen Schwellenwerten in bestimmten Intensitäten. Eine geringe Vibration bedeutet wenige Knoten und mit zunehmender Knotenanzahl wird die Vibration stärker. Da dieser Prototyp über einen lokalen Browser gestartet und auf nicht vibrationsfähigen Geräten getestet wird, ist die Funktionalität der Vibration durch optisches "Zittern" dargestellt.

