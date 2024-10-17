split :: (a -> b) -> (a -> c) -> a -> (b,c)
split f g x = (f x, g x)

i1 = Left
i2 = Right

(-|-) :: (a -> b) -> (c -> d) -> Either a c -> Either b d
f -|- g = either (i1 . f) (i2 . g)

---

mul :: Num a => (a, a) -> a
mul (x, y) = x * y

out :: (Eq b, Num b) => b -> Either () b
out x = case x of
    0 -> i1 ()
    n -> i2 (n - 1)

fac :: Int -> Int
fac = either (const 1) mul . (id -|- split succ fac) . out
