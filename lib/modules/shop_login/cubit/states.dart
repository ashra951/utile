abstract class states_shoplogin {}
class intiail_shoplogin extends states_shoplogin{}
class loading_shoplogin extends states_shoplogin{}
class done_shoplogin extends states_shoplogin{}
class error_shoplogin extends states_shoplogin{
  final String error;
  error_shoplogin(this.error);
}