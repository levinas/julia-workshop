
import Base.shift!
import Base.unshift!
import Base.append!

type Node
    data
    next
end

type LinkedList
    head::Union(Node, Nothing)
end

ll = LinkedList(Node(1, Node(2, Node(3, nothing))))

println(ll)

function shift!(ll::LinkedList)
    current_head = ll.head
    if ll.head != nothing
        ll.head = ll.head.next
    else
        error("linked list must be non-empty")
    end
    return current_head.data
end

function unshift!(ll::LinkedList, data)
    ll.head = Node(data, ll.head)
    return ll
end

function append!(ll::LinkedList, data)
    node = ll.head
    while node.next != nothing
        node = node.next
    end
    node.next = Node(data, nothing)
    return ll
end

# we can also import
function Base.start(ll::LinkedList)
    ll.head
end

function Base.done(ll::LinkedList, n::Node)
    return false
end

function Base.done(ll::LinkedList, n::Nothing)
    return true
end

function Base.next(ll::LinkedList, n::Node)
    n.data, n.next
end

unshift!(ll, nothing)
unshift!(ll, 3)
println(ll)

append!(ll, "last")
println(ll)

println("\nIterating over $ll:")
for it in ll
    println(it)
end
