abstract class EditProfileRepository {
  Future updateUser(String bio, String name, String website, String email);
  Future updateCountry(String country, String email);
}
