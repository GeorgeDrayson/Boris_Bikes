# Boris Bikes

```
As a user,
So I can find customers,
I want to search for my customers by their surnames.
```

|  Objects | Messages |
| -------- | -------- |
|   User   |             |
| Customer |   find_by_surname    |

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```

|    Objects   | Messages |
| ------------ | ----------- |
|   Person   |             |
|   Bike     |  working?  |
|   DockingStation   |     release_bike        |

**Diagram:**
```
Bike --> working? --> true/false
DockingStation --> release_bike --> a Bike
```

```
As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked
```

In the Bike class, we create the attribute @docked, which is set to "undocked" in `def initialize` and to "docked" in a new class method `def dock`. The `Bike` `dock` method is called by the `DockingStation` method `dock(bike)` - the argument allows for different bikes to be docked individually.

```
As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).
```
