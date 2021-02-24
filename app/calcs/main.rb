CustomTime.now_months

ct = CustomTime.new
time = Date.new(2020, 1, 1)
i = ct.add_month(time,fa)

sum = ct.sum_month([Time.now, 1])

sum = ct.sum_month([Time.now, Time.now])

sum.split(',')
