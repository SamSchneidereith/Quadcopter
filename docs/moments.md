# Moment

## Force Vectors in body frame
F_i = [0; 0; -T_i]

## Moment about the CoM in the body frame due to Thrust
Recall τ = r × F

M_i = r_i × F_i

## Reaction Torque
Reaction torque and thrust are both proportional to rotor speed squared,
thus Qi = c * Ti, where c is a constant and has units m

## Total Moment
Constant c for all motors assumed (alternating sign); 
calculations can be expanded for varying c

M = Σ (r_i × F_i) + Σ Q_i
M = Σ T_i * [-y_i; x_i; 0] + (-T1 + T2 - T3 + T4) * [0; 0; c]
M = [[Lcosβsinα; Lcosβcosα; 0], [-Lcosβsinα; Lcosβcosα; 0], [-Lcosβsinα; -Lcosβcosα; 0], [Lcosβsinα; -Lcosβcosα; 0]] * [T1; T2; T3; T4]
    + (-T1 + T2 - T3 + T4) * [0; 0; c]
M = Lcosβ * [[sinα; cosα; 0], [-sinα; cosα; 0], [-sinα; -cosα; 0], [sinα; -cosα; 0]] * [T1; T2; T3; T4]
    + (-T1 + T2 - T3 + T4) * [0; 0; c]

- When thrust is uniform (T1 = T2 = T3 = T4), moment about all axes is 0
- Force of thrust is parallel to z_b and thus thrust alone cannot cause yaw,
    only reaction torque