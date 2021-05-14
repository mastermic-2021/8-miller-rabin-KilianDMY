n = read("input.txt");



\\ On écrit n-1 = 2^r * m avec 'm' impair à l'aide de la fonction de valuation
r = valuation(n-1, 2);
m = (n-1)/(2^r);


\\ D'après Alice, 'n' est composé (test Miller-Rabin) donc il existe un entier a vérifiant 2 <= a <= n-2 tel que :
\\ a^m != +-1 mod n et pour tout i allant de 1 à r-1, a^(m*(2^i)) != -1 mod n

\\ De plus, on sait qu'un premier tour du test a été passé.
\\ il existe donc un entier b vérifiant 2 <= b <= n-2 tel que :
\\ b^m = 1 mod n, ou b^(2*m)= -1 mod n


MRfactor = {
  a = 2;
  b = Mod(a,n)^m;
  bb = b^2;
  f1 = gcd(n, lift(bb -1));
  f2 = gcd(n, lift(bb +1));
  if(isprime(f1),
    if(isprime((n/f1)),
      if(f1<(n/f1),
        print(f1);
      ),
      print(n/f1)
    );
  );

  if(isprime(f2),
    if(isprime((n/f2)),
      if(f1<(n/f2),
        print(f2);
      ),
      print(n/f2)
    );
  );
}
