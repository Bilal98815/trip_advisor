abstract class UserDataRepository {
  Future updateStatus(String email, String name);
  Future updateCountry(String email, String country);
}
