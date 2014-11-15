
# http://slendermeans.org/julia-loops.html

function loop(N)
    for i = 1:N
        for j = 1:N
            total += i / j
        end
    end
    println(total)
end

loop(9999)

