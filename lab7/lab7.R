planets = read.csv("https://www.dropbox.com/s/r4e0b6llx1mlibe/oec.csv?dl=0")

# Remove missing data from the desired columns
planetsfilt = planets[!is.na(planets$SurfaceTempK), ]
planetsfilt = planetsfilt[!is.na(planetsfilt$SemiMajorAxisAU), ]

# There are two planets in the dataset which have surface temperatures
# above 6000 K; it is theorized these planets survived deep immersion in
# the expanded envelope of the local red giant star. The existence of these
# planets is still under debate, and are clear edge cases in the data set;
# this laboratory excludes them from both the basic data set and the
# truncated data set.
planetsfilt = planetsfilt[planetsfilt$SurfaceTempK<6000, ]

# Second data set with distance outliers removed
planetstrunc = planetsfilt[planetsfilt$SemiMajorAxisAU<2.55, ]

# Easy access to desired columns
dist = planetsfilt$SemiMajorAxisAU
temp = planetsfilt$SurfaceTempK

disttrunc = planetstrunc$SemiMajorAxisAU
temptrunc = planetstrunc$SurfaceTempK

# Create data summaries for box plotting
distSum = boxplot(dist, plot = F)
tempSum = boxplot(temp, plot = F)

# Create logarithmic boxplots
par(mfrow = c(1, 2))
bxp(distSum, log = "y", main = "Data Coverage for Semi-Major\nAxis", ylab = "Semi-Major Axis (AU)")
bxp(tempSum, log = "y", main = "Data Coverage for Surface\nTemperature", ylab = "Surface Temperature (K)")

# Mode function
getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Get exploratory data
print("Semi-Major Axis (AU)")
print("min - max - median - mode - mean - sd")
min(dist)
max(dist)
median(dist)
getmode(dist)
mean(dist)
sd(dist)

print("Surface Temperature (Kelvin)")
print("min - max - median - mode - mean - sd")
min(temp)
max(temp)
median(temp)
getmode(temp)
mean(temp)
sd(temp)

print("TRUNCATED DATA")
print("Semi-Major Axis (AU)")
print("min - max - median - mode - mean - sd")
min(disttrunc)
max(disttrunc)
median(disttrunc)
getmode(disttrunc)
mean(disttrunc)
sd(disttrunc)

print("Surface Temperature (Kelvin)")
print("min - max - median - mode - mean - sd")
min(temptrunc)
max(temptrunc)
median(temptrunc)
getmode(temptrunc)
mean(temptrunc)
sd(temptrunc)