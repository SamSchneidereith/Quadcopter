# Conventions
## Units(SI)
- Length:   m
- Angles:   rad
- Mass:     kg
- Time:     s
- Force:    N
- Moment:   N-m

## World Frame (NED)
Right-handed, flat-Earth, non-rotating, fixed to the ground.
Origin: Take off point
- x_N:  points north
- y_E:  points east
- z_D:  points down
Altitude is therefore -z_D

## Body Frame (FRD)
Right-handed, fixed to the vehicle
Origin: Vehicle center of mass
- x_b:  points forward, between two front arms
- y_b:  points right
- z_b:  points down, completign right-handed set

## Rotation signs
Right-hand rule about each body axis.
- Roll (φ):     about x_b. Positive = right side down.
- Pitch (θ):    about y_b. Positive = nose up.
- Yaw (ψ):      about z_b. Positive = nose right (clockwise seen from above).
Euler angles (display only): yaw-pitch-roll (3-2-1) sequence.

## Quaternions (Hamilton)
q = [q_w, q_x, q_y, q_z], scalar first, unit norm.
Multiplication: Hamilton (right-handed, i² = j² = k² = ijk = -1).
q rotates vectors from the body frame to the world frame:
v_world = q ⊗ [0, v_body] ⊗ q*
q and -q represent the same rotation.