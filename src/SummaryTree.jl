module SummaryTree
export print_tree

using AbstractTrees
using InteractiveUtils

"""
    print_tree(m::Module)

Print a tree summarising the module `m`. This will include types and submodules, with appropriate levels of nesting.
"""
print_tree(m::Module) = AbstractTrees.print_tree(m; maxdepth=Inf)

# Use the AbstractTrees interface to implement a SummaryTree
AbstractTrees.children(m::Module) = [getfield(m, s) for s in names(m; all=true) if ismodchild(m, s)]
AbstractTrees.children(t::Type) = getfullname.(subtypes(t))

"""
    ismodchild(m::Module, s::Symbol)

Utility function for filtering out indirect children from `names(m; all=true)`.

This includes the symbol for `m` itself, as well as subtypes (i.e. types which don't have `Any` as their supertype).
"""
function ismodchild(m::Module, s::Symbol)
    f = getfield(m, s)
    if f isa Module
        return f != m
    elseif f isa Type
        try
            return supertype(f) == Any
        catch
        end
    end
    return false
end

"""
    getfullname(t::Type)

Trick for getting the full (parametric) name of a type `t` by taking the supertype of a subtype, if possible.
"""
getfullname(t::Type) = isempty(subtypes(t)) ? t : supertype(subtypes(t)[1])

end # module
