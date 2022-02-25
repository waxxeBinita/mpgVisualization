install.packages("tidyverse")
library(tidyverse)

require(ggplot2)
#finding structure, columes, rows and name of columns available in mpg datasets
str(mpg)
nrow(mpg)
ncol(mpg)
colnames(mpg)

head(mpg)

#finding manufacturer lists and plotting it in bar graph
table(mpg$manufacturer)
qplot(manufacturer, data=mpg, geom="bar", fill=manufacturer)

#finding the manufacture years of provided car companies
table(mpg$year)
qplot(factor(year), data=mpg, geom="bar", fill=factor(year))

#plotting displacement colunmn displ from mpg datasets and finding mean, median and quartile
summary(mpg$displ)
qplot(displ, data=mpg, geom="histogram", bins=40)

#to find milage in the city 
summary(mpg$cty)
qplot(cty, data=mpg, geom="histogram", bins=40)

#to find milage in the highway 
summary(mpg$hwy)
qplot(hwy, data=mpg, geom="histogram", bins=40)

#A vehicle with a low fuel burn has high efficiency for similar distance. 
#So finding vehicle manufacturer with best mpg in city and highway
#finding displacement, city and highway efficiency

#In the accompanying plot, the right points appears to fall outside of the straight pattern. 
#These vehicles have a higher mileage in city and highways.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cty), color='blue')

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color='blue')

#ggplot() is the dataset to use in the chart. 
#So ggplot(data = mpg) makes an unfilled diagram, yet it's not exceptionally fascinating.
#The planning contention is constantly combined with aes(), and the x and y contentions of aes() indicate which factors to guide to the x-and y-axis ggplot2 searches for the planned variable in the information contention, for this situation, mpg.

ggplot(data = mpg) +
geom_point(mapping = aes(x = displ, y = hwy, color = class))
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = cty, color = class))

#Clearly, two seater cars and suv(Sports cars) are uncommon milege. 
#Sports vehicles have huge motors yet little bodies like fair size and minimized vehicles 
#which further develops their gas mileage.


#For finding type of car, regarding their displ range (size of engine) has the lowest mpg in the city 
#categorised by the vehicle type (e.g., compact, suv or 2seaters defined in the variable class)
#Displaying the resulting plot categorised by the vehicle type. 

#mapping class with the color aesthetic like earlier
#the specific size of each point would uncover its class association
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = cty, size = class))

# highest mpg for city
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = cty, alpha = class))

# lowest mpg for city
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = cty, shape = class))

##creating same graph using facet wrapping for this mapping
#adding extra factors,another way is facet wrap.
#to part the plot into aspects, subplots that each show one subset of the information
#to do separate your dataset by one or more factors and plot the subsets of information together.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = cty, color=class)) +
  facet_wrap(~ class, nrow = 2)


##Plotting their displ range (size of engine) for both city and highway using facet grid
#categorized by the number of cylinders and the drive type (the type of drive train
#where f = front-wheel drive, r = rear wheel drive, 4 = 4wd). 
#As a  buyer who wants a high litre engine vehicle and drives mostly in the highway, choose vehicle.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color=drv)) +
  facet_grid(drv ~ cyl)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = cty, color=drv)) +
  facet_grid(drv ~ cyl)

#Creating facets horizontally on cylinders
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color=cyl)) +
  facet_grid(. ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cty, color=cyl)) +
  facet_grid(. ~ cyl)


#Estimating a smooth curve for the relationship between displacement and highway mileage

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv, linetype = drv)
  )

  #As a  buyer, choosing 4 wheelers vehicle for highway.

