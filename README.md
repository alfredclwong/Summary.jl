# SummaryTree.jl

Defines and prints out a tree summarising the type/sub-module hierarchy in a module.

For example, for the library [OpticSim](https://github.com/microsoft/OpticSim.jl), we get

```julia-repl
julia> print_tree(OpticSim)
OpticSim
├─ AbstractOpticalSystem
│  ├─ AxisymmetricOpticalSystem{T, C} where {T<:Real, C<:(CSGOpticalSystem{T, D, S, L} where {D<:Number, S<:Surface{T}, L<:LensAssembly{T}})}
│  └─ CSGOpticalSystem{T, D, S, L} where {T<:Real, D<:Number, S<:Surface{T}, L<:LensAssembly{T}}
├─ AbstractRay
│  ├─ OpticalRay{T, N} where {T<:Real, N}
│  └─ Ray{T, N} where {T<:Real, N}
├─ AbstractRayGenerator
│  ├─ GeometricRayGenerator{T} where T<:Real
│  └─ OpticalRayGenerator{T} where T<:Real
│     └─ AbstractSource{T} where T<:Real
│        ├─ CompositeSource{T} where T<:Real
│        └─ Source
├─ AbstractRayInterval
│  ├─ EmptyInterval{T} where T<:Real
│  └─ Interval{R} where R<:Real
├─ BoundingBox
├─ CSGGenerator
├─ OpticSim.Chebyshev
├─ OpticSim.Cloud
├─ CurveType
│  ├─ Euclidean
│  └─ Rational
├─ DisjointUnion
├─ OpticSim.Emitters
│  ├─ OpticSim.Emitters.AngularPower
│  │  └─ AbstractAngularPowerDistribution
│  │     ├─ Cosine{T} where T<:Real
│  │     ├─ Gaussian{T} where T<:Real
│  │     └─ Lambertian{T} where T<:Real
│  ├─ OpticSim.Emitters.Directions
│  │  └─ AbstractDirectionDistribution
│  │     ├─ Constant{T} where T<:Real
│  │     ├─ HexapolarCone{T} where T<:Real
│  │     ├─ RectGrid{T} where T<:Real
│  │     └─ UniformCone{T} where T<:Real
│  ├─ OpticSim.Emitters.Origins
│  │  └─ AbstractOriginDistribution
│  │     ├─ Hexapolar{T} where T<:Real
│  │     ├─ Point{T} where T<:Real
│  │     ├─ RectGrid{T} where T<:Real
│  │     └─ RectUniform{T} where T<:Real
│  ├─ OpticSim.Emitters.Sources
│  │  └─ SourceGenerationState
│  └─ OpticSim.Emitters.Spectrum
│     └─ AbstractSpectrum
│        ├─ DeltaFunction{T} where T<:Real
│        ├─ Measured{T} where T<:Real
│        └─ Uniform{T} where T<:Real
├─ OpticSim.Examples
├─ OpticSim.Geometry
├─ OpticSim.GlassCat
│  ├─ AbstractGlass
│  │  ├─ AirType
│  │  └─ Glass
│  ├─ OpticSim.GlassCat.CARGILLE
│  ├─ GlassID
│  ├─ OpticSim.GlassCat.HOYA
│  ├─ OpticSim.GlassCat.NIKON
│  ├─ OpticSim.GlassCat.OHARA
│  ├─ OpticSim.GlassCat.SCHOTT
│  └─ OpticSim.GlassCat.Sumita
├─ IntervalPoint
│  ├─ Infinity{T} where T<:Real
│  └─ FinitePoint{T} where T<:Real
│     ├─ Intersection{T, N} where {T<:Real, N}
│     └─ RayOrigin{T} where T<:Real
├─ IntervalPool
├─ KnotVector
├─ LensAssembly
│  ├─ LensAssembly
│  ├─ LensAssembly
│  ├─ LensAssembly
│  ├─ LensAssembly
│  ├─ LensAssembly
│  ├─ LensAssembly
│  ├─ LensAssembly
│  ├─ LensAssembly
│  ├─ LensAssembly
│  └─ LensAssembly
├─ LensTrace
├─ NoPower
├─ OpticSim.NotebooksUtils
│  ├─ Defs
│  ├─ UISlider
│  └─ VariableInfo
├─ OpticalInterface
│  ├─ FresnelInterface{T} where T<:Real
│  ├─ HologramInterface{T} where T<:Real
│  ├─ MultiHologramInterface{T} where T<:Real
│  ├─ NullInterface{T} where T<:Real
│  ├─ ParaxialInterface{T} where T<:Real
│  └─ ThinGratingInterface{T} where T<:Real
├─ OpticSim.Optimization
├─ Primitive
│  ├─ CSGTree{T} where T<:Real
│  │  ├─ ComplementNode{T, C} where {T<:Real, C<:CSGTree{T}}
│  │  ├─ IntersectionNode{T, L, R} where {T<:Real, L<:CSGTree{T}, R<:CSGTree{T}}
│  │  ├─ LeafNode{T, S} where {T<:Real, S<:ParametricSurface{T, 3}}
│  │  ├─ SimpleLens{T} where T<:Real
│  │  └─ UnionNode{T, L, R} where {T<:Real, L<:CSGTree{T}, R<:CSGTree{T}}
│  └─ Surface
│     ├─ Ellipse{T} where T<:Real    
│     ├─ Hexagon{T} where T<:Real    
│     ├─ StopSurface{T} where T<:Real
│     │  ├─ FiniteStop{T, P, Q} where {T<:Real, P<:StopShape, Q<:StopShape}
│     │  └─ InfiniteStop{T, P} where {T<:Real, P<:StopShape}
│     ├─ ParametricSurface{T, N} where {T<:Real, N}
│     │  ├─ AcceleratedParametricSurface{T, N, S} where {T<:Real, N, S<:ParametricSurface{T, N}}
│     │  ├─ ChebyshevSurface{T, N, P} where {T<:Real, N, P}
│     │  ├─ Cylinder{T, N} where {T<:Real, N}
│     │  ├─ GridSagSurface{T, N, S, Nu, Nv} where {T<:Real, N, S<:Union{ChebyshevSurface{T, N, P} where P, ZernikeSurface{T, N, P, Q} where {P, Q}}, 
Nu, Nv}
│     │  ├─ Plane{T, N} where {T<:Real, N}
│     │  ├─ QTypeSurface{T, D, M, N} where {T<:Real, D, M, N}
│     │  ├─ Sphere{T, N} where {T<:Real, N}
│     │  ├─ SphericalCap{T} where T<:Real
│     │  ├─ SplineSurface{P, S, N, M} where {P<:CurveType, S<:Real, N, M}
│     │  │  ├─ BSplineSurface{P, S, N, M} where {P<:CurveType, S<:Real, N, M}
│     │  │  └─ BezierSurface{P, S, N, M} where {P<:CurveType, S<:Real, N, M}
│     │  └─ ZernikeSurface{T, N, P, Q} where {T<:Real, N, P, Q}
│     ├─ ParaxialLens{T} where T<:Real
│     ├─ Rectangle{T} where T<:Real
│     ├─ TriangleMesh{T} where T<:Real
│     ├─ Triangle{T} where T<:Real
│     └─ WrapperSurface{T, S} where {T<:Real, S<:Surface{T}}
│        ├─ HologramSurface{T, S} where {T<:Real, S<:Surface{T}}
│        ├─ MultiHologramSurface{T, S} where {T<:Real, S<:Surface{T}}
│        └─ ThinGratingSurface{T, S} where {T<:Real, S<:Surface{T}}
├─ OpticSim.QType
├─ Spline
│  ├─ BSplineCurve{P, S, N, M} where {P<:CurveType, S<:Number, N, M}
│  ├─ BezierCurve{P, S, N, M} where {P<:CurveType, S<:Number, N, M}
│  └─ PowerBasisCurve{P, S, N, M} where {P<:CurveType, S<:Number, N, M}
├─ StopShape
│  ├─ CircularStopShape
│  └─ RectangularStopShape
├─ TrianglePool
├─ OpticSim.Vis
└─ OpticSim.Zernike
```
