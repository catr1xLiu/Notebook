#include<cmath>
#include<iostream>

/** 
 * Calculates the final grade (out of 100) based on the component grades.
 *
 * @param midTermScore the midterm score (out of 100)
 * @param finalScore the final score (out of 100)
 * @param projectScores the scores of the 5 lab projects, each out of 100.
 * */
double calculateGrade(
  double midTermScore, double finalScore, 
  double project1Score, double project2Score, 
  double project3Score, double project4Score,
  double project5Score
) 
{
  if (midTermScore < finalScore) midTermScore = finalScore;
  const double weightedExamScore = 3.0/4.0 * finalScore + 1.0/4.0 * midTermScore;

  double projectAverage { std::max(project1Score, finalScore) 
    +std::max(project2Score, finalScore) +std::max(project3Score, finalScore) 
    +std::max(project4Score, finalScore) +std::max(project5Score, finalScore)};
  projectAverage /= 5;

  if (weightedExamScore >= 60.0) 
    return 2.0/3.0 * weightedExamScore + 1.0/3.0 * projectAverage;
  if (weightedExamScore <= 40.0)
    return weightedExamScore;
  return weightedExamScore * (projectAverage - weightedExamScore) / 60.0 + (5.0 * weightedExamScore - 2.0*projectAverage) / 3.0;
}

/**
 * Calculates the score (out of 100) of a component based on the raw score
 * @param maxScore the maximum allowed score for this component
 * @param rawScore the raw score of this component
 * */
double scoreOutOf100(int maxScore, double rawScore)
{
  return rawScore / maxScore * 100;
}

/** 
* Obtain the maximum score of a component from the User.
* Repeatively prompt the user the enter the maximum score of a component,
* until a valid maximum Score is entered.
* 
*/
double userInputMaxScore(std::string componentName)
{
  double userInput{};
  while (true)
  {
    std::cout<< "Enter the maximum grade on " << componentName << ": ";
    std::cin >> userInput;
    if (userInput <= 0.0 || std::round(userInput) != userInput)
    {
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
double userInputRawScore(std::string componentName, double maxScore)
{
  double userInput{};
  while (true)
  {
    std::cout << "Enter your grade on " << componentName << ": ";
    std::cin >> userInput;
    if (userInput < 0.0 || userInput > maxScore)
    {
      continue;
    }

    return userInput;
  }
}

int main()
{
  double finalExamMaxScore{userInputMaxScore("the Final Examination")};
  double finalExamRawScore{userInputRawScore("the Final Examination", finalExamMaxScore)};
  double midtermExamMaxScore{userInputMaxScore("the Midterm Examiniation")};
  double midtermExamRawScore{userInputRawScore("the Midterm Examination", midtermExamMaxScore)};

  double finalScoreOutOf100 {scoreOutOf100(finalExamMaxScore, finalExamRawScore)};
  double midtermScoreOutOf100 {scoreOutOf100(midtermExamMaxScore, midtermExamRawScore)};

  double project1MaxScore {userInputMaxScore("project 1")};
  double project1RawScore {userInputRawScore("project 1", project1MaxScore)};
  double project1Score {scoreOutOf100(project1MaxScore, project1RawScore)};
  
  double project2MaxScore {userInputMaxScore("project 2")};
  double project2RawScore {userInputRawScore("project 2", project2MaxScore)};
  double project2Score {scoreOutOf100(project2MaxScore, project2RawScore)};
  
  double project3MaxScore {userInputMaxScore("project 3")};
  double project3RawScore {userInputRawScore("project 3", project3MaxScore)};
  double project3Score {scoreOutOf100(project3MaxScore, project3RawScore)};
  
  double project4MaxScore {userInputMaxScore("project 4")};
  double project4RawScore {userInputRawScore("project 4", project4MaxScore)};
  double project4Score {scoreOutOf100(project4MaxScore, project4RawScore)};

  double project5MaxScore {userInputMaxScore("project 5")};
  double project5RawScore {userInputRawScore("project 5", project5MaxScore)};
  double project5Score {scoreOutOf100(project5MaxScore, project5RawScore)};
  
  double finalGrade {calculateGrade(
    midtermScoreOutOf100, finalScoreOutOf100,
    project1Score, project2Score, project3Score,
    project4Score, project5Score)};
  int finalGradeRounded = std::round(finalGrade);
  std::cout << "Final Grade: " << finalGradeRounded << std::endl;
  return 0;
}
