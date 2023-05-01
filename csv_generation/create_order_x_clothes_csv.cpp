#include <string>
#include <random>
#include <fstream>
#include <set>

static const int kExtendingTableSize = 50;
static const int kOrderTableSize = 51;


int main() {
  std::string path_to_file =
      "/Users/mikhail/Desktop/Programming/test_cpp/mup/order_x_clothes.csv";

  std::ofstream out;
  out.open(path_to_file);

  /* COLUMNS
   * order_id,    // from [1-51]
   * clothes_id,  // from [1-15]
   * item_count   // from [1-2]
   */

  std::random_device rd;
  std::mt19937 gen(rd());
  std::uniform_int_distribution<int> order_id_gen(1, 51);
  std::uniform_int_distribution<int> clothes_id_gen(1, 15);
  std::uniform_int_distribution<int> item_count_gen(1, 2);

  std::set<std::pair<int, int>> pk;

  for (int i = 1; i <= kOrderTableSize; ++i) {
    std::string result;
    while (true) {
      int clo_id = clothes_id_gen(gen);
      if (pk.find(std::make_pair(i, clo_id)) == pk.end()) {
         result = std::to_string(i) + "," + std::to_string(clo_id) + "," + \
                         std::to_string(item_count_gen(gen)) + "\n";
         pk.insert({i, clo_id});
         break;
      }
    }
    out << result;
  }



  for (int i = 0; i < kExtendingTableSize; ++i) {
    std::string result;
    while (true) {
      int clo_id = clothes_id_gen(gen), ord_id = order_id_gen(gen);
      if (pk.find(std::make_pair(ord_id, clo_id)) == pk.end()) {
        result = std::to_string(ord_id) + "," + std::to_string(clo_id) + "," + \
                         std::to_string(item_count_gen(gen)) + "\n";
        pk.insert({i, clo_id});
        break;
      }
    }
    // writting

    out << result;
  }
  out.close();
  return 0;
}