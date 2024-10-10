#pour les tests. S'assurer que la methode crypto_scrapper ne prend rien en entré et retourne un array de hash

#vérifier la taille de l'array et la comparer au nombre de crypto du site (pas tres robuste, si une crypto est rajouté tout plante)
#vérifier si dans notre array, il existe un hash qui a BTC en key et un float non nul et non Nil en value.

#Au final, une bonne solution pourrait être un mix des deux : vérifier que ton scrappeur récupère au moins x cryptomonnaies (comme ça, t'es pas à une près) 
# et vérifier la présence de 2-3 cryptomonnaies phares (avec un cours non Nil et non nul).
require 'rspec'
require_relative '../lib/crypto_scrapper'

describe "the login_openai method" do
    it "should return response, and response is not nil" do
      expect(scrap_crypto(page,names)).to eq('BTC')
    end
  end