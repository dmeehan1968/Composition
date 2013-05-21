Composition
===========

This is an experiment in using [Composition][] rather than [Inheritance][] to construct a unit.

The units to be created are [one-dimensional arrays](http://en.wikipedia.org/wiki/Array_data_structure) in both [immutable](http://en.wikipedia.org/wiki/Immutable) and mutable forms.

It is constructed from the following components.

## Protocols ([Interfaces](http://en.wikipedia.org/wiki/Interface_(object-oriented_programming)))

### IArray

Defines the immutable interface to Array Objects

### IMutableArray

Defines the mutable interface to Mutable Array Objects

### IArrayDelegate

Defines an interface to allow array implementation to access common storage.

## Classes

### ArrayImpl

An implementation of the immutable array methods.  This is not a standalone class, as storage for the array is provided by a delegate (the composing class).  This is an example of the Adapter pattern, converting immutable Array interface to NSArray.

### MutableArrayImpl

An implementation of the mutable array methods.  As for ArrayImpl, this is not a standalone class.  It is also an example of the [Adapter pattern](http://en.wikipedia.org/wiki/Adapter_pattern).

### LoggingProxy

Captures all messages directed to its target object and logs them to the Xcode console.  An example of the [Proxy pattern](http://en.wikipedia.org/wiki/Proxy_pattern).

### RecursiveLockingProxy

Wraps all messages directed to its target with lock/unlock messages to a NSRecursiveLock object to ensure thread safety.  An example of the proxy pattern.

### Array

A standalone implementation of an immutable array. It implements its abilities through composition rather than inheritance and is itself a proxy.  Each proxy is constructed in a heirarchy, using [Chain of Responsibility](http://en.wikipedia.org/wiki/Chain-of-responsibility_pattern) to dispatch forward message invocations to the appropriate implementation.

It acts as [delegate](http://en.wikipedia.org/wiki/Delegation_(programming)) to the ArrayImpl in order to provide storage to the implementation.

It composes the complete implementation from ArrayImpl, the LoggingProxy which will write to the Xcode log whenever methods are called, and RecursiveLockingProxy, which makes each method thread safe.  

It adopts the IArray protocol to expose the immutable array methods.





[composition]: http://en.wikipedia.org/wiki/Object_composition
[inheritance]: http://en.wikipedia.org/wiki/Inheritance_(computer_science)