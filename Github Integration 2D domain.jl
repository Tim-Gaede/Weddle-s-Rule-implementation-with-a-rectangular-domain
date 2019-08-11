#-------------------------------------------------------------------------------
function ∫∫(fxy, x_min, x_max, hextets_x, y_min, y_max, hextets_y)
# Integrates by Weddle's Rule over a rectangular domain
    width_segment = (x_max - x_min) / 6hextets_x

    cnt_max = 6hextets_x - 1

    weighted_sum = ∫(fxy, x_min, y_min, y_max, hextets_y)
    for cnt = 1 : cnt_max
        x = x_min +  cnt*width_segment

        mod = cnt % 6
        if     (mod == 2 || mod == 4)  coeff = 1
        elseif (mod == 1 || mod == 5)  coeff = 5
        elseif (mod == 3)              coeff = 6
        else                           coeff = 2
        end

        weighted_sum +=  coeff*∫(fxy, x, y_min, y_max, hextets_y)
    end
    weighted_sum += ∫(fxy, x_max, y_min, y_max, hextets_y)


    (3/10)*weighted_sum * width_segment
end
#-------------------------------------------------------------------------------




#-------------------------------------------------------------------------------
function ∫(fxy, x, y_min, y_max, hextets_y)
# Integrates by Weddle's Rule over a rectangular domain
    width_segment = (y_max - y_min) / 6hextets_y

    cnt_max = 6hextets_y - 1

    weighted_sum = fxy(x, y_min)
    for cnt = 1 : cnt_max
        y = y_min +  cnt*width_segment

        mod = cnt % 6
        if     (mod == 2 || mod == 4)  coeff = 1
        elseif (mod == 1 || mod == 5)  coeff = 5
        elseif (mod == 3)              coeff = 6
        else                           coeff = 2
        end

        weighted_sum += coeff*fxy(x,y)
    end
    weighted_sum += fxy(x, y_max)


    (3/10)*weighted_sum * width_segment
end
#-------------------------------------------------------------------------------
