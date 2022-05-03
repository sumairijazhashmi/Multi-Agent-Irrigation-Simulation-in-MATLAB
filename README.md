



# Multi-Agent-Irrigation-Simulation-in-MATLAB

**By Sumair Ijaz Hashmi, Muawiz Khan Feroze, Muhammad Haris Saad**


**LAB 1 -- TASK 1**

To extend our code to include four farmers, we stored each one's yield
decay and moisture decay rates in an array and carried out the
computation of the yield in a loop. The computation was like the one
done in Lab 9. Moisture level and yield decay level was calculated for
each farmer separately. Irrigation was not included in this task as we
had not yet decided on a particular division system regarding the
irrigation water. Hence, the farmers were completely at the mercy of the
rain.

https://user-images.githubusercontent.com/85024854/166477327-ec489d14-2ef2-4229-a916-2bf0dde72fa0.mp4


**LAB 1 -- TASK 2**

We implemented 'warabandi' system by distributing the water to each
farmer after a set time interval. To carry out this implementation, we
checked for each farmer's turn every day; if it was a particular
farmer's turn, then he got his share of water. This share was removed
from the total irrigation available.

The system was quite effective for a short period of time until
irrigation water ran out on day 43. This resulted farmers 3 and 4 to not
get their share of water. Furthermore, if a farmer had very low moisture
decay rate and if his soil's moisture would go above the maximum due to
an irrigation, it would take very long for his moisture level to return
to normal. Within this time, if his farm were to experience rain or were
to be irrigated again, this would result in an even worse yield.



https://user-images.githubusercontent.com/85024854/166477912-592e9cbd-cb9d-42d0-bb67-3e4e31198e06.mp4



**LAB 2 -- TASK 1**

On every 7<sup>th</sup> day, each farmer's moisture level is compared. The farmer
with the lowest moisture level, which is also below a certain acceptable
moisture level *m_acceptable* was given water. It is not necessary to
irrigate every 7<sup>th</sup day if none of the farmers meet these requirements.
This system works fine until the irrigation runs out.



https://user-images.githubusercontent.com/85024854/166477941-7c273b7d-0121-45c4-aa10-9b07c1e5572c.mp4



**LAB 2 -- TASK 2**

If a farmer's moisture level falls below what is acceptable to him, he
only needs enough water so that he can survive for the next 7 days
without relying on rainfall. This is calculated by the water delay times
the moisture decay rate of each farmer. This proves to give him almost
perfect yields and maximizes his profit (even when the price per unit of
water is high). The same implementation is carried out for each farmer.


https://user-images.githubusercontent.com/85024854/166477967-754fb0b3-5c16-401e-95db-cd54d45a7348.mp4




**FURTHER IMPROVEMENTS**

As we have progressed through the project, the farmers' yields have
improved significantly. However, in Lab 2 we have currently ignored
rain. If only the farmers had the rain forecast, they would be able to
improve their results even more as they would only irrigate their farms
if their moisture levels dropped below AND if there was no chance of
rain over the next couple of days.
