#include <string>
#include <random>
#include <fstream>

static const int kTableSize = 50;


int main() {
  std::string path_to_file =
      "/Users/mikhail/Desktop/Programming/test_cpp/mup/order.csv";

  std::ofstream out;
  out.open(path_to_file);

  /* COLUMNS
   * store_id,          // from [1-5]
   * customer_id,       // from [1-200]
   * delivery_dttm,
   * purchase_dttm,
   * delivery_point_id, // from [1-15]
   * buyout_flg
   */

  std::random_device rd;
  std::mt19937 gen(rd());
  std::uniform_int_distribution<int> year_gen(2018, 2020);
  std::uniform_int_distribution<int> month_gen(1, 12);
  std::uniform_int_distribution<int> day_gen(1, 20);

  std::uniform_int_distribution<int> delivery_gen(1, 8); // days offset

  std::uniform_int_distribution<int> store_gen(1, 5);
  std::uniform_int_distribution<int> point_gen(1, 15);
  std::uniform_int_distribution<int> customer_gen(1, 200);


  for (int i = 0; i < kTableSize; ++i) {
    std::string name, surname, patronymic, email;
    int year = year_gen(gen), month = month_gen(gen), day = day_gen(gen);
    int store = store_gen(gen);

    std::string store_str = std::to_string(store);
    std::string customer = std::to_string(customer_gen(gen));

    std::string purchase_dt = std::to_string(year) + "-" + \
                           std::to_string(month) + "-" + \
                           std::to_string(day) + " 00:00:00";

    int day_of_del = day + delivery_gen(gen);

    std::string delivery_dt = std::to_string(year) + "-" + \
                           std::to_string(month) + "-" + \
                           std::to_string(day_of_del) + " 00:00:00";

    std::string point_id = std::to_string(((store - 1) * 3 + 1) + gen() % 3);
    std::string flg = (gen() % 2 ? "TRUE" : "FALSE");

    // writting

    std::string result = store_str + "," + customer + "," + \
                         delivery_dt + "," + purchase_dt + "," + point_id + "," + flg + "\n";

    out << result;
  }
  out.close();
  return 0;
}