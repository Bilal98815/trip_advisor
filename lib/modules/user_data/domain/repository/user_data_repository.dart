abstract class UserDataRepository {
  Future<void> updateStatus(String email, String name);
  Future<void> updateCountry(String email, String country);
}
