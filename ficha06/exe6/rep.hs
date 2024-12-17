import Cp
import Nat

rep f = cataNat (either (const id) (f .))

times a = for (a+) 0
