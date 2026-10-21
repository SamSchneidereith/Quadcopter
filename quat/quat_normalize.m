function q_hat = quat_normalize(q)
    q_norm = sqrt(q'*q);
    q_hat = 1/q_norm.*q;
end