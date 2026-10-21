# Kinematics

## q_dot derived from ω

q(t + dt) = q ⊗ dq

where dq is derived from ω as follows
dq = [cos (||ω|| dt / 2);  ω/||ω|| * sin(||ω|| dt / 2)]

this can be expanded to the first order in dt as
dq = [1; ω_x * dt/2; ω_y * dt / 2; ω_z * dt/2]

Find q_dot by evaluating the limit
q_dot = (q(t+dt) − q(t)) / dt, as dt → 0

dq = [1; 0; 0; 0] + dt/2 * [0; ω]

substitute above into eq. 1
q(t + dt) = q ⊗ ([1; 0; 0; 0] + dt/2 * [0; ω])
          = q ⊗ [1; 0; 0; 0] + dt/2 * q ⊗ [0; ω]
          = q + dt/2 * q ⊗ [0; ω]

subtract q(t) from both sides and divide by dt:
(q(t + dt) - q(t))/dt  = 1/2 q ⊗ [0; ω], and as dt → 0
q_dot = 1/2 q ⊗ [0; ω]

## Matrix Form
q_dot = 1/2 * Ω(ω) * q

where
Ω(ω) = [0  ,-ω_x,-ω_y,-ω_z;
        ω_x, 0  , ω_z,-ω_y;
        ω_y,-ω_z, 0  , ω_x;
        ω_z, ω_y,-ω_x, 0  ]

## Note: 
The continuous equations preserve |q| exactly, but a simulation doesn’t 
    solve the continuous equations. It takes finite steps, and each step is 
    an approximation of the true rotation, so each step picks up a small 
    error in length. Those errors accumulate.
Improved integrators like RK4 or Matlab's ODE4 can be implemented to shrink 
    this per-step error