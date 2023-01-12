# Affiche tous les fichiers et dossiers de l'arborescence passee en parametre qui sont plus vieux de 6 mois ou du nombre de mois passe en parametre
#
# Pascal Hurni, novembre 2011

Param ($Folder = ".", $MonthCount = 6)

Get-ChildItem -Recurse $Folder | 
  Where-Object {$_.LastWriteTime -lt (Get-Date).AddMonths(-$MonthCount) }