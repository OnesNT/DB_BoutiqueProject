#include <string>
#include <vector>
#include <random>
#include <fstream>

static const int kTableSize = 200;

static const int kTransactionScale = 5000;

// customer_nm,customer_surname,customer_patronymic,birth_dt,email,overall_transactions_amt,advertising_subscribe_flg
int main() {
  std::string path_to_file =
      "/Users/mikhail/Desktop/Programming/test_cpp/mup/customer.csv";

  std::ofstream out;
  out.open(path_to_file);

  /* COLUMNS
   * customer_nm,
   * customer_surname,
   * customer_patronymic,
   * birth_dt,                  // rand(1980-2001) + rand(1-12) + rand(1-28)
   * email,                     // surname + to_string(id)
   * overall_transactions_amt,  // rand 0-20 * 5000
   * advertising_subscribe_flg
   */

  //////////////////////////////////////////////////////////////////////
  std::vector<std::string> male_names = {
      "Sergey", "Alexey", "Georgiy",
      "David", "Ivan", "Pavel",
      "Lev", "Nikita", "Nikolay",
      "Petr", "Philipp", "Oleg",
      };


  std::vector<std::string> male_surnames = {
      "Lebedev", "Popov", "Sokolov",
      "Lazarev", "Ershov", "Zuev",
      "Semenov", "Bogdanov", "Osipov",
      "Sidorov", "Fedotov", "Belov"
  };
  std::vector<std::string> male_patronymics = {
      "Vasilievich", "Aleksandrovich", "Nikolaevich",
      "Petrovich", "Davidovich", "Nikolaevich",
      "Sergeevich", "Alexeyevich", "Zaharovich",
      "Gennadievich", "Maksimovich", "Ivanovich"
  };

  //////////////////////////////////////////////////////////////////////
  std::vector<std::string> female_names = {
      "Dasha", "Violetta", "Valeria",
      "Varvara", "Eva", "Ekaterina",
      "Elena", "Tatyana", "Yulia",
      "Larisa", "Oksana", "Rita",
  };

  std::vector<std::string> female_surnames = {
      "Lebedeva", "Popova", "Sokolova",
      "Lazareva", "Ershova", "Zueva",
      "Semenova", "Bogdanova", "Osipova",
      "Sidorova", "Fedotova", "Belova"
  };
  std::vector<std::string> female_patronymics = {
      "Vasilievna", "Aleksandrovna", "Nikolaevna",
      "Petrovna", "Davidovna", "Nikolaevna",
      "Sergeevna", "Alexeyevna", "Zaharovna",
      "Gennadievna", "Maksimovna", "Ivanovna"
  };
  //////////////////////////////////////////////////////////////////////

  std::vector<std::string> domens = {
      "google.com", "yandex.ru", "mail.ru",
      };


  std::random_device rd;
  std::mt19937 gen(rd());
  std::uniform_int_distribution<int> year_gen(1980, 2001);
  std::uniform_int_distribution<int> month_gen(1, 12);
  std::uniform_int_distribution<int> day_gen(1, 28);

  std::uniform_int_distribution<int> trans_gen(1, 40);


  for (int i = 0; i < kTableSize; ++i) {
    std::string name, surname, patronymic, email;
    int year = year_gen(gen), month = month_gen(gen), day = day_gen(gen);
    if (gen() % 2 == 0) {
      name = female_names[gen() % female_names.size()];
      surname = female_surnames[gen() % female_surnames.size()];
      patronymic = female_patronymics[gen() % female_patronymics.size()];
      email = surname + name + std::to_string(year) + "@" + domens[gen() % domens.size()];
    } else {
      name = male_names[gen() % male_names.size()];
      surname = male_surnames[gen() % male_surnames.size()];
      patronymic = male_patronymics[gen() % male_patronymics.size()];
      email = surname + name + std::to_string(year) + "@" + domens[gen() % domens.size()];
    }

    std::string birth_dt = std::to_string(year) + "." + \
                           std::to_string(month) + "." + \
                           std::to_string(day);

    int trans = trans_gen(gen) * kTransactionScale;
    std::string flg = (gen() % 2 ? "TRUE" : "FALSE");

    // writting

    std::string result = name + "," + surname + "," + patronymic + "," + \
                          birth_dt + "," + email + "," + std::to_string(trans) + "," + flg + "\n";

    out << result;
  }
  out.close();
  return 0;
}