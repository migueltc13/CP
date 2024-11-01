import Cp (p1, p2, (><))

import Data.List (sortBy, groupBy)
import Data.Ord (comparing)
import Data.Function (on)

-- (1: deconsAux and deconsBib)

deconsAux :: [(pag, [key])] -> [(key, pag)]
deconsAux = concatMap aux  -- same as: concat . map aux
  where
    aux :: (a, [b]) -> [(b, a)]
    aux (p, []) = []
    aux (p, k:ks) = (k, p) : aux (p, ks)

deconsBib :: [(key, [aut])] -> [(key, aut)]
deconsBib = concatMap aux
  where
    aux :: (a, [b]) -> [(a, b)]
    aux (_, []) = []
    aux (k, a:as) = (k, a) : aux (k, as)

-- (2: sortByKey)

sortByKey :: Ord key => [(key, b)] -> [(key, b)]
sortByKey = sortBy (comparing p1)

-- (3: joinAutPag)

-- joinAutPag requires both lists to be sorted by the key
joinAutPag :: Ord key => ([(key, aut)], [(key, pag)]) -> [(aut, pag)]
joinAutPag (_, []) = []
joinAutPag ([], _) = []
joinAutPag ((ka, a):as, (kp, p):ps)
  | ka == kp  = (a, p) : joinAutPag (as, ps)
  | ka <  kp  = joinAutPag (as, (kp, p):ps)
  | otherwise = joinAutPag ((ka, a):as, ps)

-- (4: groupPagByAut)

groupPagByAut :: Eq pag => [(aut, pag)] -> [(aut, [pag])]
groupPagByAut = map aux . groupBy ((==) `on` p2)
  where
    aux :: [(a, b)] -> (a, [b])
    aux l@((a, _):_) = (a, map p2 l)  -- can sort the pages here

-- (mkInd)

mkInd :: (Ord key, Eq pag) => ([(key, [aut])], [(pag, [key])]) -> [(aut, [pag])]
mkInd = groupPagByAut              -- group pages by author
        . joinAutPag               -- join authors and pages
        . (sortByKey >< sortByKey) -- alternatively sort lists by key
        . (deconsBib >< deconsAux) -- alternatively deconstruct authors and pages

