% test_kinematics.m
% Compare integrators for the attitude kinematics  q_dot = 0.5 * q (x) [0; omega]
% against the closed form for a constant body rate.
%
% Requires quat_multiply(p, q) on the path: scalar-first, Hamilton, column vectors.
% Methods: forward Euler, forward Euler + renormalization, RK4, ode45.

clear; clc; close all;

%% Setup
omega = [0; 0; 1];     % rad/s, constant, body frame. Try [1;0;0], [0;1;0], [1;2;3].
T     = 100;           % s
dt    = 0.01;          % s, fixed step for Euler and RK4
q0    = [1; 0; 0; 0];  % identity attitude

N = round(T/dt);
t = (0:N) * dt;        % 1 x (N+1)

% Right-hand side. First argument (time) is unused but ode45 needs it.
fq = @(~, q) 0.5 * quat_multiply(q, [0; omega]);

%% Closed form (constant omega, starting at identity)
theta   = norm(omega) * t;                            % 1 x (N+1)
q_exact = [cos(theta/2); (omega/norm(omega)) * sin(theta/2)];   % 4 x (N+1)

%% Forward Euler (no renormalization)
qE = zeros(4, N+1);  qE(:,1) = q0;
for k = 1:N
    qE(:,k+1) = qE(:,k) + dt * fq(0, qE(:,k));
end

%% Forward Euler + renormalization after each step
qEn = zeros(4, N+1); qEn(:,1) = q0;
for k = 1:N
    qn = qEn(:,k) + dt * fq(0, qEn(:,k));
    qEn(:,k+1) = qn / norm(qn);
end

%% RK4 (fixed step, no renormalization)
qR = zeros(4, N+1);  qR(:,1) = q0;
for k = 1:N
    q  = qR(:,k);
    k1 = fq(0,        q);
    k2 = fq(0,        q + dt/2 * k1);
    k3 = fq(0,        q + dt/2 * k2);
    k4 = fq(0,        q + dt   * k3);
    qR(:,k+1) = q + dt/6 * (k1 + 2*k2 + 2*k3 + k4);
end

%% ode45 (variable step; output requested at the same times as above)
opts = odeset('RelTol', 1e-6, 'AbsTol', 1e-9);
[~, qO] = ode45(fq, t, q0, opts);
qO = qO.';             % 4 x (N+1)

%% Errors
colnorm = @(A) sqrt(sum(A.^2, 1));
err.Euler    = colnorm(qE  - q_exact);
err.EulerRn  = colnorm(qEn - q_exact);
err.RK4      = colnorm(qR  - q_exact);
err.ode45    = colnorm(qO  - q_exact);

drift.Euler   = abs(colnorm(qE)  - 1);
drift.EulerRn = abs(colnorm(qEn) - 1);
drift.RK4     = abs(colnorm(qR)  - 1);
drift.ode45   = abs(colnorm(qO)  - 1);

%% Plots (eps added so exact zeros still show on a log axis)
labels = {'Euler', 'Euler + renorm', 'RK4', 'ode45'};

figure('Name', 'Error vs closed form');
semilogy(t, err.Euler + eps, t, err.EulerRn + eps, t, err.RK4 + eps, t, err.ode45 + eps, 'LineWidth', 1.2);
grid on; xlabel('time (s)'); ylabel('|q - q_{exact}|');
title(sprintf('Quaternion error, \\omega = [%g %g %g] rad/s, dt = %g s', omega, dt));
legend(labels, 'Location', 'southeast');

figure('Name', 'Norm drift');
semilogy(t, drift.Euler + eps, t, drift.EulerRn + eps, t, drift.RK4 + eps, t, drift.ode45 + eps, 'LineWidth', 1.2);
grid on; xlabel('time (s)'); ylabel('| |q| - 1 |');
title('Quaternion norm drift');
legend(labels, 'Location', 'southeast');

%% Summary table
fprintf('\n%-16s %-16s %-16s\n', 'Method', 'Final error', 'Final |norm-1|');
names = {'Euler', 'EulerRn', 'RK4', 'ode45'};
for i = 1:4
    fprintf('%-16s %-16.3e %-16.3e\n', labels{i}, err.(names{i})(end), drift.(names{i})(end));
end