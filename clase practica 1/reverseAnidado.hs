module ReverseAnidado (reverseAnidado) where 
import LosIesimos


reverseAnidado xxs = reverse (map reverse xxs) 
