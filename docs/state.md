# State vector

## States
Total states: 13

| Symbol | Meaning                   | Dim | Frame                                   | Units | Index |
|--------|---------------------------|-----|-----------------------------------------|-------|-------|
| p      | position of CoM           | 3   | World (NED), relative to take-off point | m     | 1-3   |
| v      | velocity of CoM           | 3   | World (NED)                             | m/s   | 4-6   |
| q      | attitude quaternion       | 4   | Rotates body to world (see conventions) | -     | 7-10  |
| ω      | angular rate of the body  | 3   | Body (FRD), relative to world           | rad/s | 11-13 |

Order: x = [p; v; q; ω]

## Notes
- v is in the world frame because the position kinematics reduce to
  p_dot = v, gravity needs no rotation, and GPS reports velocity in
  NED. Body-frame velocity would add an ω × v cross-term to the
  translational equation and require R(q) to propagate position.
- q has 4 components but represents a 3-DOF rotation. It must satisfy
  ||q|| = 1, which numerical integration will violate slowly, so
  the model needs to renormalize.
- ω is in the body frame because a gyro measures body rates, and
  Euler's rotational equation is written in the body frame.

## Kinematics
p_dot = v