#include <string>
#include <vector>
#include <random>
#include <fstream>

static const int kTableSize = 15;


int main() {
  std::string path_to_file =
      "/Users/mikhail/Desktop/Programming/test_cpp/mup/employee.csv";

  std::ofstream out;
  out.open(path_to_file);

  /* COLUMNS
   * birth_dt
  */

  std::random_device rd;
  std::mt19937 gen(rd());
  std::uniform_int_distribution<int> year_gen(1980, 2001);
  std::uniform_int_distribution<int> month_gen(1, 12);
  std::uniform_int_distribution<int> day_gen(1, 28);

  for (int i = 0; i < kTableSize; ++i) {
    std::string name, surname, patronymic, email;
    int year = year_gen(gen), month = month_gen(gen), day = day_gen(gen);
    std::string birth_dt = std::to_string(year) + "." + \
                           std::to_string(month) + "." + \
                           std::to_string(day);

    // writting

    std::string result = birth_dt + "\n";

    out << result;
  }
  out.close();
  return 0;
}