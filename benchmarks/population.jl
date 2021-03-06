# Population density benchmark from https://github.com/SWI-Prolog/bench
# Author:  David H. D. Warren
#
# query population and area database to find coun-
# tries of approximately equal population density

clauses = @julog [
    query([C1,D1,C2,D2]) <<=
        density(C1,D1) &
        density(C2,D2) &
        (D1 > D2) &
        is(T1, 20*D1) &
        is(T2, 21*D2) &
        (T1 < T2),

    density(C,D) <<=
        pop(C,P) &
        area(C,A) &
        is(D, (P*100)/A),

    # populations in 100000's
    pop(china,	8250) <<= true,
    pop(india,	5863) <<= true,
    pop(ussr,	2521) <<= true,
    pop(usa,	2119) <<= true,
    pop(indonesia,	1276) <<= true,
    pop(japan,	1097) <<= true,
    pop(brazil,	1042) <<= true,
    pop(bangladesh,	 750) <<= true,
    pop(pakistan,	 682) <<= true,
    pop(w_germany,	 620) <<= true,
    pop(nigeria,	 613) <<= true,
    pop(mexico,	 581) <<= true,
    pop(uk,		 559) <<= true,
    pop(italy,	 554) <<= true,
    pop(france,	 525) <<= true,
    pop(philippines, 415) <<= true,
    pop(thailand,	 410) <<= true,
    pop(turkey,	 383) <<= true,
    pop(egypt,	 364) <<= true,
    pop(spain,	 352) <<= true,
    pop(poland,	 337) <<= true,
    pop(s_korea,	 335) <<= true,
    pop(iran,	 320) <<= true,
    pop(ethiopia,	 272) <<= true,
    pop(argentina,	 251) <<= true,

    # areas in 1000's of square miles
    area(china,     3380) <<= true,
    area(india,     1139) <<= true,
    area(ussr,      8708) <<= true,
    area(usa,       3609) <<= true,
    area(indonesia,  570) <<= true,
    area(japan,      148) <<= true,
    area(brazil,    3288) <<= true,
    area(bangladesh,  55) <<= true,
    area(pakistan,   311) <<= true,
    area(w_germany,   96) <<= true,
    area(nigeria,    373) <<= true,
    area(mexico,     764) <<= true,
    area(uk,          86) <<= true,
    area(italy,      116) <<= true,
    area(france,     213) <<= true,
    area(philippines, 90) <<= true,
    area(thailand,   200) <<= true,
    area(turkey,     296) <<= true,
    area(egypt,      386) <<= true,
    area(spain,      190) <<= true,
    area(poland,     121) <<= true,
    area(s_korea,     37) <<= true,
    area(iran,       628) <<= true,
    area(ethiopia,   350) <<= true,
    area(argentina, 1080) <<= true,
]

goal = @julog(query([C1,D1,C2,D2]))
println("Population (single run):")
@time resolve(goal, clauses)

function benchmark(n)
    for i = 1:n
        resolve(@julog(query([C1,D1,C2,D2])), clauses)
    end
end

println("Population (100 runs):")
@time benchmark(100)
