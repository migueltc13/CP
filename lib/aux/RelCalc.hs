{-# OPTIONS_GHC -XNoMonomorphismRestriction #-}

-- (c) CP/MFP (2007/2024)

module RelCalc where

import Data.List
import Cp hiding (tot)

--- composition (left to right to be consistent with Alloy) ----

comp :: (Eq b, Ord a, Ord c) => [(a, b)] -> [(b, c)] -> [(a, c)]
comp m n = set [ (a,c) | (a,b) <- m, (b',c) <- n, b==b' ]

--- converse

conv :: (Ord b, Ord a) => [(a, b)] -> [(b, a)]
conv = smap swap

--- composition with a function

fcomp r f = smap (id><f) r

lcomp f s = conv(conv s `fcomp` f)

--- relational inclusion

sse r s = all ((flip elem) s) r  -- sse: subset or equal

atmost = sse

--- union and intersection

inter s r = set (intersect s r) 

runion s r = set (union s r) 

--- kernel and image

ker r = r `comp` (conv r)

img r = conv r `comp` r

--- coreflexives

crflx :: Ord c => [c] -> [(c, c)]
crflx = smap (split id id)

point :: Ord c => c -> [(c, c)]
point = crflx . singl

-- domain and range

dom :: Ord a => [(a, b)] -> [a]
dom = smap p1

rng :: Ord b => [(a, b)] -> [b]
rng = smap p2

rho = crflx . rng

delta = rho . conv

-- properties of relations 

coreflexive = all (uncurry(==))

injective = simple . conv

simple :: (Ord b, Ord a) => [(a, b)] -> Bool
simple = coreflexive . img

consistent m n = coreflexive (conv m `comp` n)

-- restriction operators

domr :: (Ord a, Ord t) => [a] -> [(a, t)] -> [(a, t)] -- domain restrict
domr s r = (crflx s) `comp` r

doms s r = r \\ (domr s r)  -- domain subtract

r .-. s = doms (dom s) r

-- relation overriding

plus :: (Ord a, Ord t) => [(a, t)] -> [(a, t)] -> [(a, t)]
plus m n = runion (drminus (dom n) m) n

drminus s r = domr (sdiff (dom r) s) r

drplus  s r = domr (inter (dom r) s) r

-- relation coproduct

reither a b =  (set.conv) (runion (conv a `fcomp` i1) (conv b `fcomp` i2))

unreither r = (a,b) where
     a = set [(x,y) | (Left x,y) <- r]
     b = set [(x,y) | (Right x,y) <- r]

-- pairing

rjoin r s = discollect $ smap (id><dstr) $ meet (collect r)(collect s) where dstr(y,x) = nub [(b,a) | b <- y, a <- x]

meet m n = [  k |-> (pap m k, pap n k) | k <- inter (dom m) (dom n)]  -- assumes m and n simple

rzipWith f a b = (rjoin a b `fcomp` f)

-- relation 'currying'

unvec = smap f where f(a,(c,b)) = ((a,b),c)

vec   = smap f where f((a,b),c) = (a,(c,b))

-- constant relation on a set

pconst k s = smap (split id (const k)) s

--- power transpose

pT = flip tot [] . collect  -- power transpose

collect :: (Ord b, Ord a) => [(b, a)] -> [(b, [a])]
collect x = set [ k |-> set [ d' | (k',d') <- x , k'==k ] | (k,d) <- x ]

-- Maybe transpose (assumes simplicity)

mT :: Eq a => [(a, b)] -> a -> Maybe b
mT = flip lookup

pap :: Eq a => [(a, t)] -> a -> t
pap m = unJust . (mT m) where unJust (Just a) = a -- partial inspector of simple relation A->B

-- tot m b a = if a `elem` dom m then pap m a else b -- total inspector of simple relation A->B
tot m b = maybe b id . mT m

-- tap m a = if a `elem` dom m then pap m a else a -- total inspector of simple relation, A->A
tap m a = tot m a a

condid p f = cond p f id

pmap = map . pap -- mapping a simple relation

idx x = pap (zip x [0..])
 
--- sets modelled by sorted, repeat-free lists (naive but useful)

set = sort . nub

card = length . set 

smap :: Ord a => (b -> a) -> [b] -> [a]
smap f = set . (map f)

--- histograms and distributions

hist :: Eq a => [a] -> [(a, Int)]
hist l = nub [ (x, count x l) | x <- l ]
         where count a l = length [ x | x <- l, x == a]

dist :: (Eq a, Fractional b) => [a] -> [(a, b)]
dist l = [ (x, (fromIntegral n) / (fromIntegral t)) | (x,n) <- hist l ] where t = length l

histpair h1 h2 = both `fcomp` (split (tot h1 0)(tot h2 0)) where both = crflx (dom h1 `union` dom h2)

-- miscellaneous

discollect :: [(a, [b])] -> [(a, b)]
discollect = (>>=lstr)

presort f = map snd . sort . (map (split f id)) -- pre-sorting on f-preorder

rpresort f = reverse . (presort f) -- the same in reverse ordering

sdiff x y = set [ a | a <- x, not(elem a y) ]

a |-> b = (a,b)

(f `is` v) x = (f x) == v

(f `belongs` v) x = (f x) `elem` v

(v `can_be_found_in` f) x = v `elem` (f x)

(f `isnot` v) x = (f x) /= v

unpair(a,b)=[a,b]

pair [a,b]=(a,b)

a .><. b = [ (x,y) | x <- a, y <- b ]
x .+. y = map Left x ++ map Right y
-----------------------------------------------------------------------------
proj k a = map (split k a)
{-----------------------------------------------------------------------------
-- Sample data

data A = A1 | A2 | A3 | A4 | A5 deriving (Show,Eq,Ord,Enum)
data B = B1 | B2 | B3 | B4 | B5 deriving (Show,Eq,Ord,Enum)

tA = [A1 .. A5]
tB = [B1 .. B5]

idA = crflx tA
idB = crflx tB
-----------------------------------------------------------------------------}

rcons(x,a) = x++[a]

