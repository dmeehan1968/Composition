Composition
===========

This is an experiment in using Composition rather than Inheritance to construct a unit.

The units to be created as an array collection in both immutable and mutable forms.

It is constructed from the following components.

## Protocols (Interfaces)

### IArray

Defines the immutable interface to Array Objects

### IMutableArray

Defines the mutable interface to Mutable Array Objects

### IArrayDelegate

Defines an interface to allow array implementation to access common storage.

## Classes

### ArrayImpl

An implementation of the immutable array methods.  This is not a standalone class, as storage for the array is provided by a delegate (the composing class).  This is an example of the Adapter pattern, converting Array class methods to NSArray.

### MutableArrayImpl

An implementation of the mutable array methods.  As for ArrayImpl, this is standalone class.  It is also an example of the Adapter pattern.

### LoggingProxy

Captures all messages directed to its target object and logs them to the Xcode console.  An example of the Proxy pattern.

### RecursiveLockingProxy

Wraps all messages directed to its target with lock/unlock messages to a NSRecursiveLock object to ensure thread safety.  An example of the proxy pattern.

### Array

A standalone implementation of an immutable array.  

It acts as delegate to the ArrayImpl in order to provide storage to the implementation.

It composes the complete implementation from ArrayImpl, the LoggingProxy which will write to the Xcode log whenever methods are called, and RecursiveLockingProxy, which makes each method thread safe.  

It adopts the IArray protocol to expose the immutable array methods.

