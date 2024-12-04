{-# OPTIONS_GHC -XNPlusKPatterns #-}

-- (c) MP-I (1998/9-2006/7) and CP (2005/6-2023/24)

module XNat where

import Cp
import BTree

-- (1) Datatype definition -----------------------------------------------------

data XNat a = Zero a | Succ (XNat a) deriving Show

inXNat = either Zero Succ

outXNat (Zero a) =  Left a
outXNat (Succ n) = Right n

baseXNat f g = f -|- g

-- (2) Ana + cata + hylo -------------------------------------------------------

recXNat f = baseXNat id f

cataXNat a = a . (recXNat (cataXNat a)) . outXNat

anaXNat   f = inXNat . (recXNat (anaXNat f)) . f

hyloXNat   a c = cataXNat   a . anaXNat   c

-- (3) Map ---------------------------------------------------------------------

instance Functor XNat
         where fmap f = cataXNat ( inXNat . baseXNat f id )

-- (4) Examples ----------------------------------------------------------------

-- (4.1) Tail recursion --------------------------------------------------------

tailr = hyloXNat codiag

while2 :: (t -> Bool) -> (t -> t) -> (t -> p) -> t -> p
while2 p f g = tailr ((g -|- f) . grd (not . p))

while p f = while2 p f id

repeat2 f p g  = (while2 p f g) . f

-- (4.2) dropping (uncurried) --------------------------------------------------

udrop = tailr aux
   where aux(0,l)      = i1 l
         aux(_,[])     = i1 []
         aux(n+1,x:xs) = i2(n,xs)

-- (4.2) Lookup (findb) --------------------------------------------------------

{--
-- assumes a binary search tree
lookBTree a Empty = Nothing
lookBTree a (Node((a',b'),(l,r)))
    | a == a' = Just b'
    | a < a' =  lookBTree a l
    | a > a' =  lookBTree a r
--}

lookBTree :: Ord a => a -> BTree (a,b) -> Maybe b
-- assumes a binary search tree
lookBTree a = tailr (ldivide a)

ldivide a = (either (i1.nothing) (decide a) . outBTree)
   where decide a ((a',b'),(l,r))
                | a == a' = i1 (Just b')
                | a < a' =  i2 l
                | a > a' =  i2 r

-- (4.3) Tail recursive square root --------------------------------------------

sqrt' e x = tailr (divide e x) 1 where
   divide e x r = let r'= (r + x / r) / 2
             in if abs(r - r') < e
                then i1 r' else i2 r'

-- sqrt' p x = loop p x 1
--             where loop p x r = let r'= (r + x / r) / 2
--                                in if abs(r - r') < p
--                                   then r' else loop p x r'

-- (4.4) Tail recursive factorial ----------------------------------------------

factr = while2 p f p2 . split id (const 1) where
   p(c,f) = c > 1
   f(c,f) = (c-1,c*f)
--------------------------------------------------------------------------------
-- paraXNat g = g . (recXNat (split id ( paraXNat g))) . outXNat
--------------------------------------------------------------------------------

-- (4.5) Tail recursive foldl --------------------------------------------------
foldl f z x = tailr (h f) (z,x) where
      h f (z,[]) = i1 z
      h f (z,(x:t)) = i2(f x z,t)
--------------------------------------------------------------------------------
