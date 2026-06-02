#include<array>
#include<cmath>
#include<iostream>
#include <string>

/** 
 * Calculates the final grade (out of 100) based on the component grades.
 *
 * @param midTermScore the midterm score (out of 100)
 * @param finalScore the final score (out of 100)
 * @param projectScores the scores of the 5 lab projects, each out of 100.
 * */
double calculateGrade(double midTermScore, double finalScore, std::array<double, 5> projectScors) 
{
    if (midTermScore < finalScore) midTermScore = finalScore;
    const double weightedExamScore = 3.0/4.0 * finalScore + 1.0/4.0 * midTermScore;

    double projectAverage = 0;
    for (double projectScore: projectScors)
    {
        if (projectScore < finalScore) projectScore = finalScore;
        projectAverage += projectScore;
    }
    projectAverage /= projectScors.size();

    if (weightedExamScore >= 60.0) 
        return 2.0/3.0 * weightedExamScore + 1.0/3.0 * projectAverage;
    if (weightedExamScore <= 40.0)
        return weightedExamScore;
    return weightedExamScore * (projectAverage - weightedExamScore) / 60.0 + (5.0 * weightedExamScore - 2.0*projectAverage) / 3.0;
}

/**
 * Calculates the score (out of 100) of a component based on the raw score
 * @param rawScore the raw score of this component
 * @param maxScore the maximum allowed score of this component
 * */
double scoreOutOf100(double rawScore, int maxScore)
{
  return rawScore / maxScore * 100;
}

/** 
* Obtain the maximum score of a component from the User.
* Repeatively prompt the user the enter the maximum score of a component,
* until a valid maximum Score is entered.
* 
*/
int userInputMaxScore(std::string componentName)
{
  double userInput{};
  while (true)
  {
    std::cout<< "Please Enter the maximum grade on " << componentName << ": ";
    std::cin >> userInput;
    if (std::round(userInput) != userInput)
    {
      std::cout << "Error: maximum score of a component must be an integer, please check data and re-Enter" << std::endl;
      continue;
    }

    return userInput;
  }
}

/**
* Obtain the raw score of a component from the user
* Repeatively prompts the user to enter the raw score of a component,
* until a valid input is given
* @param componentName the name of the component, like "the Final Exam"
* @param maxScore the maximum score of this component 
*/
double userInputRawScore(std::string componentName, int maxScore)
{
  double userInput{};
  while (true)
  {
    std::cout << "Please enter your grade on the: " << componentName << ": ";
    std::cin >> userInput;
    if (userInput > maxScore)
    {
      std::cout << "Error: Input score is greater than max score of the component, please enter again" << std::endl;
      continue;
    }

    return userInput;
  }
}

int main()
{
  int finalExamMaxScore{userInputMaxScore("the Final Examination")};
  double finalExamRawScore{userInputRawScore("the Final Examination", finalExamMaxScore)};
  int midtermExamMaxScore{userInputMaxScore("the Midterm Examiniation")};
  double midtermExamRawScore{userInputRawScore("the Midterm Examination", midtermExamMaxScore)};

  double finalScoreOutOf100 {scoreOutOf100(finalExamRawScore, finalExamMaxScore)};
  double midtermScoreOutOf100 {scoreOutOf100(midtermExamRawScore, midtermExamMaxScore)};

  std::array<double, 5> projectScoresOutOf100;
  projectScoresOutOf100.fill(0.0);
  for (int projectID = 0; projectID < 5; projectID++)
  {
    std::string projectIDStr = std::to_string(projectID+1);
    int projectMaxScore {userInputMaxScore("project " + projectIDStr)};
    double projectRawScore {userInputRawScore("project " + projectIDStr, projectMaxScore)};
    projectScoresOutOf100[projectID] = scoreOutOf100(projectRawScore, projectMaxScore); 
  }

  double finalGrade = calculateGrade(midtermScoreOutOf100, finalScoreOutOf100, projectScoresOutOf100);
  int finalGradeRounded = std::round(finalGrade);
  std::cout << "Your final grade: " << finalGradeRounded << std::endl;
  return 0;
}
