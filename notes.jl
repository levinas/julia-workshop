
# println(typeof(ans))
# typeof(ans) == "Nothing"

# use ; to switch to shell

println(6//9)

for x = 1:100
    if x % 15 == 0
        println("FizzBuzz")
    elseif x % 3 == 0
        println("Fizz")
    elseif x % 5 == 0
        println("Buzz")
    else
        println(x)
    end
end

[1,2,3] .+ 3
[1 2 3; 4 5 6] * [1,2,3]

[1 2 3]                         # this is a matrix (2D) with one row

for x in [1,2,3]
    println(x)
end

x = +
x(4,5,6)

# multiple dispatch

function foo(x)
    x + 2
end
# foo (generic function with 1 method)

function foo(x,y)
    x + y + 2
end
# foo (generic function with 2 methods)

function foo(x; bar=3)
    x + bar + 10
end

methods(foo)

x=8
x^2+3x-1

names(1:2:10)
# 3-element Array{Symbol,1}:
#  :start
#  :step
#  :stop

methodswith(typeof(1:5))

# Julia types are memory compatible with C

subtypes(super(Int64))

pi + float32(2)
# 5.141593f0

methods(subtypes(Any)[13])
# 2 methods for generic function "CPUinfo":
# CPUinfo(info::UV_cpu_info_t) at sysinfo.jl:53
# CPUinfo(model,speed,u,n,s,id,ir) at sysinfo.jl:51

type Node
    data
    next
end

Node(1,Node(2,Node(3,nothing)))

isa(nothing, Nothing)
isa(nothing, Union(Node, Nothing))

type LinkedList
    head::Union(Node, Nothing)
end

methods(unshift!)               # ! means the method mutates things in place

# function Base.unshift           # namespace, or: import Base.unshift!

import Base.unshift

immutable ModInt1
    k
    n
    ModInt1(k,n) = new(mod(k,n),n)
end

ModInt1(5,5)

ModInt1(k) = ModInt1(k,5)

immutable ModInt2{N}
    k
    ModInt2(k) = new(mod(k,N))
end

ModInt2{5}(3)

immutable ModInt3{T}
    k::T
    n::T
    ModInt3(k::T,n::T) = new(mod(k,n),n)
end

ModInt3{Int8}(int8(3), int8(5))

[ x + y + z for x=1:3,y=4:6,z=7:9 ]
[ (x, y, z) for x=1:3,y=4:6,z=7:9 ]

arr = Number[x for x=1:3]
arr = Any[x for x=1:3]          # slower because elements need to be pointers

abstract Color

type BBBColor <: Color
    b1
    b2
    b3
end

BBBColor <: Color               # outside type definition this is a test
# false

super(BBBColor)
# Color

module PackageName
export my_fav_function, MyType, blue

const blue = 15

function my_fav_function()
    return 42
end

type MyType
    x
end

function my_own()
end

type Secret
    sss
end

end


names(PackageName)
PackageName.blue

PackageName.Secret

names(Main)

using PackageName
blue
Secret                          # not defined
PackageName.Secret              # defined; this is just like Perl

Pkg.status()

using ASCIIPlots

module A
  module B
  end

  module C
    module D
    end
  end
end

Pkg.rm("ASCIIPlots")            # a good test because it doesn't have dependencies

Pkg.available()

Pkg.add("ASCIIPlots")           # install the stable release
Pkg.checkout("ASCIIPlots")      # check out the git latest of an already installed one to the

# ~/.julia/v0.3/METADATA has the information of all packages

# Pkg.init()

# ~/.julia/v0.3/ASCIIPlots/src/ASCIIPlots.jl

"blah" * "blaaaah"              # string concatenation
"blah"^3

# if we have funciton A calling B, and if B changes, A may not have changed because of inlining

[ "key" => "value" ]
# Dict{ASCIIString, ASCIIString}

# we can force it to be Any to Any:
d = (Any => Any)["key" => "value"]

[ "key" => "value", 1 => 2 ]
# Dict{Any,Any}

# list comprehension for dictionary
[ x => x * 3 for x = 1:3 ]
[ x => x^3 for [ "red", "blue" ] ]

# list comprehension doesn't currently support grep/conditions
# because a limitation with anonymous function needs multiple dispatch and no inlining

# symbols
:orange
