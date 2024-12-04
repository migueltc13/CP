
-- (c) CP (2005/6-2024/25)

-- NB: this is not a proper library, it is just an "ad hoc" illustration of
-- the map-reduce programming strategy. A more accurate account is given
-- in: R. Lammel's "Google's MapReduce programming model --- Revisited",
-- Ref: http://dx.doi.org/10.1016/j.scico.2007.07.001

module MapReduce where

import Cp
import Exp
import List hiding (chunksOf)
import Data.List
import Data.List.Split
import BTree
import LTree

--- Given a tiny internet with 6 URLs only:

www = zip [1..] [doc1, doc2, doc3, doc4, doc5, doc6]
   where
     doc1 = "This is just an example of document"
     doc2 = "Here is another document"
     doc3 = "Any other piece of text could be given as example"
     doc4 = "Yet another example"
     doc5 = "This is the fifth text document"
     doc6 = "Last piece of text as another good example"

-- we want to build a searchable index from it:

idx = (finalize . reduce . mapstep . prepare) www

-- NB: use "pict it" to visualize each step in the pipeline

--- analysis of the process pipeline:

--- document inversion is a costly operation

invert :: Eq a => [(a, String)] -> [(String, [a])]
invert = cataList (h . (id -|- (conv  . (id >< words)) >< id))
          where h = either nil (uncurry col)

-- prepare data for 2 docs per machine

prepare :: [e] -> LTree [e]
prepare = anaLTree lsplit . (chunksOf 2)

-- map step (inversions run in parallel)

mapstep :: (Eq a) => LTree [(a, String)] -> LTree [(String, [a])]
mapstep = fmap invert

-- reduce step (join everything together)

reduce :: Eq b => LTree [(b, [a])] -> [(b, [a])]
reduce = cataLTree (either id (uncurry col))

-- build a searchable index

finalize :: Ord b => [b] -> BTree b
finalize = anaBTree qsep            -- reusing divide strategy of qSort

-- aux functions

conv   :: (Eq a, Eq b) => (a, [b]) -> [(b, [a])]
conv   = map (id><nub) . freq . map swap .lstr

freq l = nub [ (a, collect a l) | (a,b) <- l ]
         where collect a l = [ b | (x,b) <- l, x == a]

col :: Eq b => [(b, [a])] -> [(b, [a])] -> [(b, [a])]
col m n = m .\ n ++ n .\ m ++ [(a,x++concat[l' | (a',l') <- n, a'==a]) | (a,x) <- m .= n]
            
m .\ n = [(a,b) | (a,b) <- m, not(a `elem` (map fst n))]

m .= n = [(a,b) | (a,b) <- m, a `elem` (map fst n)]

-------------------------------------------------------

main = pict idx

-------------------------------------------------------
