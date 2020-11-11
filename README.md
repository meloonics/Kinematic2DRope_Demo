# Kinematic2DRope_Demo
A demo for two KinematicBody2D players tied to a RigidBody2D rope.

Unlike RigidBody2D (RB2D), KinematicBody2D (KB2D) is not affected by outside physical forces. It only moves, where it is programmed to move.
If you tie a KB2D to a Rope made of RB2Ds and move it, the Rope will be overstretched and glitches out. 
The solution for this problem is to manipulate the velocity vector of KB2D. Usually you only program the Inputs in and that's it. In our case, we will add a pull-vector, which points to the direction, in which the rope would pull, to our velocity vector.

The Rope is a Node2D, which contains one PinJoint2D for Player1, and another Node2D (which can be looped over easily), containing the chain segments. Each chain segment is a RigidBody2D with a CollisionBox2D, one PinJoint2D and two Position2Ds, which mark the North- and Southpole of the Object (think of it as a magnet). The force of the pull vector is calculated by adding together the distances of each segment's south pole to its neighbor's north pole (Note that it is important, that north and southpole have identical positions inside the Rope scene!). In the end, we have a Vector, that pulls back the KB2D, when it overstretches the chain. 
However, this method might cause strange behavior, when the chain collides and wraps around rigid objects. To fix this, only the segments closer to the current player than the first colliding segment are considered when calculating the direction of the pull vector. The overall force of the pull is still determined by all segments together, which prevents the rope from becoming stretchier, when colliding.
