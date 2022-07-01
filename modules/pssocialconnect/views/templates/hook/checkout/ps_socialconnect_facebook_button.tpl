{*
* 2007-2019 PrestaShop
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2018 PrestaShop SA
* @license   http://addons.prestashop.com/en/content/12-terms-and-conditions-of-use
* International Registered Trademark & Property of PrestaShop SA
*}
<script>

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
 FB.api('/me?fields=id,email,name', function(response) {
      var namesplit = response.name.split(" ");
      var firstname = namesplit[0];
      var lastname = namesplit[1];
      $.ajax({
            type: 'POST',
            url: pssocialconnect_frontController,
            data: {
                ajax: true,
                action: "Login",
                lastname: lastname,
                firstname: firstname,
                email: response.email,
                socialnetwork: 1
            },

            success: function(data) {
                location.reload();
            },
            error: function(err) {
                console.log(err);
                console.log(pssocialconnect_frontController);
            },
        });
    });
  }
function login() {
    FB.login(function(response) {
        if (response.authResponse) {
            // connected
        testAPI();
        } else {
            // cancelled
        }
    }, { scope: 'email' });
    }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : pssocialconnect_facebook_api_key,
      cookie     : true,  // enable cookies to allow the server to access
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.11' // use graph api version 2.11
    });
  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/fr_FR/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

</script>
<button class="pssocialconnectButton facebook-button mini
{if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}outline{/if} 
{if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 1}left{/if} 
{if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 3}right{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 1}shadow{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}invert{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}fill{/if}"
 href="#" onclick="login()">
  <i class="fab fa-facebook"></i>
</button>
