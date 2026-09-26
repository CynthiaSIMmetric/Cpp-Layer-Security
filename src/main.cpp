#include <iostream>

#include "tls.hpp"

namespace tls {

int version() { return 1; }

}  // namespace tls

int main() {
  std::cout << "cpp-layer-security scaffold. tls::version() = "
            << tls::version() << "\n";
  return 0;
}
