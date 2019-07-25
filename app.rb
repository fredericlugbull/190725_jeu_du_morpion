require 'bundler'
Bundler.require
#require 'bundler' et Bundler.require permettent de dire à Ruby 'hey, fais un require sur toutes les gems de mon Gemfile STP, 
# comme ça, ça m'évitera de les appeler tous les deux fichiers'. Une commande très pratique#  pour éviter des longues listes 
# de require en haut de chaque classe. Seul un bon vieux $ bundle install suffira dans le terminal.
# => Grâce à ces deux lignes en en-tête du fichier à exécuter (ruby app.rb), les require de gems deviennent inutiles. 
# Il suffit que ton Gemfile soit bien complété.
$:.unshift File.expand_path('./../lib', __FILE__)
#grâce à cette ligne ci-dessus, pour appeler mes fichiers du dossier lib, je n ai plus qu'à mettre sur une nouvelle 
  #ligne require 'NomDuFichier', puis à appeler la classe qui m'intéresse avec sur une nouvelle ligne avec MyClass.new.perform.
