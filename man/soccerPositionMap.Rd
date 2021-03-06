% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/soccerPositionMap.R
\name{soccerPositionMap}
\alias{soccerPositionMap}
\title{Plot average player position}
\usage{
soccerPositionMap(df, lengthPitch = 105, widthPitch = 68, fill1 = "red",
  col1 = "white", fill2 = "blue", col2 = "white", node_size = 6,
  label = TRUE, label_size = 3, label_col = "black", repel = FALSE,
  fillPitch = "white", colPitch = "grey60", lwd = 0.5, grass = FALSE,
  arrow = c("none", "r", "l"), title = NULL, subtitle = NULL, x = "x",
  y = "y", id = "id", team = NULL, teamToFlip = 1)
}
\arguments{
\item{df}{dataframe containing x,y-coordinates of player position}

\item{lengthPitch, widthPitch}{numeric, length and width of pitch in metres}

\item{fill1, fill2}{character, fill colour of position points (team 1, team 2 (if present))}

\item{col1, col2}{character, border colour of position points and labels (team 1, team 2 (if present))}

\item{node_size}{numeric, size of position points}

\item{label}{boolean, draw labels}

\item{label_size}{numeric, size of labels}

\item{label_col}{colour of labels}

\item{fillPitch}{pitch fill colour}

\item{colPitch}{pitch line colour}

\item{lwd}{pitch line width}

\item{grass}{if \code{TRUE}, uses a more realistic pitch}

\item{arrow}{optional, adds arrow showing team attack direction as right (\code{'r'}) or left (\code{'l'})}

\item{title, subtitle}{optional, adds title and subtitle to plot}

\item{x, y}{= name of variables containing x,y-coordinates}

\item{id}{character, the name of the column containing player identity. Defaults to \code{'id'}}

\item{team}{character, the name of the column containing team identity. Optional, defaults to \code{'NULL'}}
}
\description{
Draws the average x,y-positions of each player from one or both teams on a soccer pitch.
}
\examples{
# average player position; one team w/ labels as player numbers
data(tromso)
soccerPositionMap(tromso, grass = TRUE)

# average pass position; one team w/ labels as shortened, non-overlapping player names
data(statsbomb)
statsbomb$name <- soccerShortenName(statsbomb$player.name)
statsbomb \%>\%
  filter(type.name == "Pass" & team.name == "France" & minute < 43) \%>\%
  soccerPositionMap(id = "name", x = "location.x", y = "location.y",
                  fill1 = "blue", label_col = "black",
                  arrow = "r", repel = T,
                  title = "France (vs Argentina, 30th June 2018)",
                  subtitle = "Average pass position (1' - 42')")
                 
# average pass position; two teams w/ original names, non-overlapping player names (requires flipping one team in vertical plane for StatsBomb data)
statsbomb \%>\%
  filter(type.name == "Pass" & minute < 43) \%>\%
  soccerPositionMap(team = "team.name", id = "player.name", x = "location.x", y = "location.y",
                   fill1 = "lightblue", fill2 = "blue", label_col = "black",
                   repel = T, teamToFlip = 2,
                   title = "France vs Argentina, 30th June 2018",
                   subtitle = "Average pass position (1' - 42')")

}
\seealso{
\code{\link{soccerPitch}}  for plotting a soccer pitch for the purpose of drawing over event data, average position, player trajectories, etc..
}
