function prod = quat_multiply(p, q)
    p_w = p(1); p_v = p(2:4);
    q_w = q(1); q_v = q(2:4);

    r_w = p_w*q_w + -p_v'*q_v;
    r_v = p_w .* q_v + q_w .* p_v + cross(p_v, q_v);
    prod = [r_w; r_v];
end