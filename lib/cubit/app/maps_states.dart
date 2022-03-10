abstract class MapsStates{}

class AppInitialState extends MapsStates{}

class MapsLoadingState extends MapsStates{}
class MapsErrorState extends MapsStates{
  final String error;
  MapsErrorState(this.error);
}
class MapsLogoutState extends MapsStates{}