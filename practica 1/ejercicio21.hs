data AHD tInterno tHoja = 
 Hoja tHoja 
 | Rama tInterno (AHD tInterno tHoja) 
 | Bin (AHD tInterno tHoja) tInterno (AHD tInterno tHoja)
 
foldAHD :: (tHoja->b)->(tInterno->b->b)->(b->tInterno->b->b)->(AHD tInterno tHoja)->b
foldAHD fHoja fRama fBin a = case a of
 Hoja h -> fHoja h
 Rama i a -> fRama i (rec a)
 Bin a1 i a2 -> fBin (rec a1) i (rec a2)
 where rec = foldAHD fHoja fRama fBin
 
mapAHD :: (a -> b) -> (c -> d) -> AHD a c -> AHD b d
mapAHD f g = foldAHD (\h-> Hoja (g h)) (\i rec_a -> Rama (f i) rec_a) (\rec_a1 i rec_a2 -> Bin rec_a1 (f i) rec_a2)
