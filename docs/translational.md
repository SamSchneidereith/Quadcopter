# Translational Equations of Motion

## Forces:
- T: total thrust T1 + T2 + T3 + T4, body frame, pointing up (-z_b)
- T1: Thrust from prop 1
- T2: Thrust from prop 2
- T3: Thrust from prop 3
- T4: Thrust from prop 4
- mg: force of gravity, world frame, pointing down
- D: Drag (not yet modeled)

## Equation of Motion a = F/m
v_dot = 1/m * ( R(q)[0; 0; -T] + [0; 0; mg])

where 
- m, T, and g are scalars
- g is the acceleration due to gravity in m/s² (defined in config)
- R(q) is a 3x3 rotation matrix computed from quaternion q

Note: Hover condition (v_dot == 0) -> T = mg; assuming no disturbance
