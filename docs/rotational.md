# Rotational Equations of Motion
Assumptions:
- An X-frame with four equal rotor and motor masses
- The body, battery, and electronics centered on the CoM


## Moment of Inertia Tensor
J = ∫ [  y²+z²   -xy     -xz  ]
      [  -xy    x²+z²    -yz  ] dm
      [  -xz     -yz    x²+y² ]
taken about the center of mass, in the body frame, fixed to the vehicle.

- The mass distribution is mirror-symmetric about the xz and yz planes,
    thus all three products of inertia vanish so J = diag(J_xx, J_yy, J_zz),
    and the body axes are principal axes.
- J⁻¹ is just the reciprocal of each diagonal entry, so no matrix inversion is needed.

- For α < 45°, J_yy > J_xx (mass spread farther along x_b)
- If entire mass distribution looks the same after swapping x_b and y_b, 
    then J_xx = J_yy. This requires body, battery, and electronics mass 
    distribution about x_b and y_b to be identical as well as α = 45°.

Limit: this holds only while the symmetry does. An off-center battery or a 
    CAD-derived airframe can produce nonzero products of inertia, and then 
    J is full. That’s why the parameter file should store J as a full 3×3 
    matrix, even though it’s diagonal for now. A CAD swap then needs no model change.

## Equation of Motion:

Recall M = J · ω_dot fails if the body frame is rotating and thus we must 
    use the more general form of Newton's second law as it applies to 
    rotational motion:

M = (dH/dt).inertial, where
H = J · ω, and ω is the angular rate of the body frame relative to the inertial frame

Recall the transport theorem: (dA/dt).inertial = (dA/dt).body + ω × A, so
(dH/dt).inertial = (dH/dt).body + ω × H, where
(dH/dt).body = J_body_dot · ω + J_body · ω_dot

but recall J_body is constant and thus the expression can be simplified to:
(dH/dt).inertial = J_body · ω_dot + ω × H

Thus:
M = J · ω_dot + ω × (J · ω)

where J is expressed in the body frame

Finally, solve for ω_dot:
ω_dot = J⁻¹ · (M - ω × (J · ω))

## Limitations of this model

This model does not include:
- rotor gyroscopic effects
- aerodynamic moments

