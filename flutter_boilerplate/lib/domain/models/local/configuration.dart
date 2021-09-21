//Set the configuration properties default values to be appropriate for non logged in users
class Configuration {
  bool isLocationAllowed;
  bool isHost;

  Configuration({
    this.isLocationAllowed = false,
    this.isHost = false,
  });
}
