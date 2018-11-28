select amount_h, count(id) as amount
from log_bs
where nonce > 108536
GROUP BY amount_h
order by amount_h;

select amount_l, count(id) as amount
from log_bs
where nonce > 108536
GROUP BY amount_l
order by amount_l;

select amount_hl, count(id) as amount
from log_bs
where nonce > 108536
GROUP BY amount_hl
order by amount_hl;

select amount_lh, count(id) as amount
from log_bs
where nonce > 108536
GROUP BY amount_lh
order by amount_lh;