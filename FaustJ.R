nwomen = 10000
nmen = 20000
# Let's use a normal distribution with mean = 100 and Sd = 10 but it doesn't matter. This is (trivially) true for every distribution ever.
women_skills = rnorm(n = nwomen, mean = 100, sd = 10)
men_skills = rnorm(n = nmen, mean = 100, sd = 10)
# Let's use the number "0" to signify female gender, 1 to signify male gender.

women = data.frame(gender = 0, skill = women_skills)
men =   data.frame(gender = 1, skill = men_skills)
women_and_men = merge(women, men, all=TRUE)
# Select the top 100 players based on skill.
top_players = women_and_men[order(women_and_men$skill,decreasing=TRUE)[1:100],]
#Now count the number of men and the number of women among them. We would expect about twice as many man if I'm right.
#The following works because a man contributes 1 to the sum.
number_of_top_men = sum(top_players$gender)
print(number_of_top_men)
paste("Number of men among the top 100:",number_of_top_men)
paste("Number of women among the top 100:", 100-number_of_top_men)
