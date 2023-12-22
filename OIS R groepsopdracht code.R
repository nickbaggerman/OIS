#0.Voorbereiding voor het analyseren van de vragenlijst over Chatbob (Antropomorfe chatbot) & Non (Niet-antropomorfe chatbot):

#0.1 Sla de vragenlijst op als "Lijst"
Lijst <- read.csv("Vragenlijst OIS Groep C5.csv")

#0.2 Verdeel de vragenlijst tussen 'Bob' en 'Non'
Bob <- Lijst[, c("B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10", "B11", "B12", "B13")]
Non <- Lijst[, c("C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12", "C13")]

#0.3 Maak van de data numerieke data
Bob <- apply(Bob, 2, as.numeric)
Non <- apply(Non, 2, as.numeric)

#0.4 ltm package installeren voor latere cronbach's alpha berekening
install.packages('ltm')
library(ltm)

#0.5 Effect size package voor Cohen's D
install.packages('effectsize')
library(effectsize)

#1.Beschrijvende data

#1.1 Geslacht
summary(Lijst$Gender)

#1.2 (On)Prettig
summary(Lijst$B4 / Lijst$C4)

#1.3 Robot/Menselijk
summary(Lijst$B13 / Lijst$C13)

#1.4 (On)Duidelijk
summary(Lijst$B8 / Lijst$C8)

#1.5 (On)Praktisch
summary(Lijst$B9 / Lijst$C9)

#1.6 (On)Vriendelijk
summary(Lijst$B12 / Lijst$C12)

#1.7 Irritant/Vermakelijk
summary(Lijst$B1 / Lijst$C1)

#1.8 Saai/Opwindend
summary(Lijst$B2 / Lijst$C2)

#1.9 Slecht/Goed
summary(Lijst$B3 / Lijst$C3)

#1.10 (De)Motiverend
summary(Lijst$B5 / Lijst$C5)

#1.11 Obstructief/Ondersteunend
summary(Lijst$B6 / Lijst$C6)

#1.12 (On)Bevattelijk
summary(Lijst$B7 / Lijst$C7)

#1.13 (On)Interessant
summary(Lijst$B10 / Lijst$C10)

#1.14 (On)Aantrekkelijk
summary(Lijst$B11 / Lijst$C11)

#1.15 Totaal menselijkheid
summary(Lijst$B13)

#1.16.1 Totaal vorkeur bots
summary(Lijst$Prefer / Lijst$Human)

#1.16.2 berekening percentages voorkeur/prefer
43/61 * 100
12/61 * 100
6/ 61 * 100

#1.16.3 berekening percentages menselijkheid/Human
56/61
3/61
2/61

#1.17 standaard deviaties voor geantropomorfiseerde chatbot
sd(Lijst$B1)
sd(Lijst$B2)
sd(Lijst$B3)
sd(Lijst$B4)
sd(Lijst$B5)
sd(Lijst$B6)
sd(Lijst$B7)
sd(Lijst$B8)
sd(Lijst$B9)
sd(Lijst$B10)
sd(Lijst$B11)
sd(Lijst$B12)
sd(Lijst$B13)

#1.18 standaard deviaties voor gestandaardiseerde chatbot
sd(Lijst$C1)
sd(Lijst$C2)
sd(Lijst$C3)
sd(Lijst$C4)
sd(Lijst$C5)
sd(Lijst$C6)
sd(Lijst$C7)
sd(Lijst$C8)
sd(Lijst$C9)
sd(Lijst$C10)
sd(Lijst$C11)
sd(Lijst$C12)
sd(Lijst$C13)

#1.19 totale gemiddeldes

#1.20 Pie plot, gebasseerd op de percentages berekend bij 1.16.2
library(RColorBrewer)
myPalette <- brewer.pal(5, "Set2") 
pie(x= c(70.4918, 19.67213, 9.836066), labels = c("Geantropomorfiseerde Chatbot", "Gestandaardiseerde Chatbot", "Geen mening"), border="white", col = myPalette, main="voorkeur voor chatbot uitgedrukt in percentages")

#1.21 totale gemiddeldes voor de gebruiksvriendelijkheid. Hierbij gaat het om B1 t/m B12 en C1 t/m C12
mean(Bob[,1:12])
mean(Non[,1:12])
#verschil
mean(Bob[,1:12]) - mean(Non[,1:12])

#2.Shapiro-Wilk normality test

#2.1 Normaliteit test voor 'Bob'
shapiro.test(Bob)

#2.2 Normailteit test voor 'Non'
shapiro.test(Non)

#3. Two sample t-test
t.test(x = Bob[, 1:12], y = Non [, 1:12], paired = TRUE)

#4 Cronbach's alpha berekenen met 'ltm' package

#4.1 Cronbach's alpha voor 'Bob' berekenen
cronbach.alpha(Bob)

#4.2 Cronbach's alpha voor 'Non' Berekenen
cronbach.alpha(Non)

#4.3 Cronbach;s alpha totaal
cronbach.alpha(Lijst[,3:28])

#5 Q-Q Plots

#5.1 Q-Q Plot voor 'Bob'
library(car)
qqnorm(Bob, pch = 1, frame = FALSE)
qqline(Bob, col = "steelblue", lwd = 2)
qqPlot(Bob)

#5.2 Q-Q Plot voor 'Non'
qqnorm(Non, pch = 1, frame = FALSE)
qqline(Non, col = "steelblue", lwd = 2)
qqPlot(Non)

#6 Effect size Cohen's D berekenen
options(es.use_symbols = TRUE)
cohens_d(x=Bob[,1:12], y=Non[,1:12], paired = TRUE)
