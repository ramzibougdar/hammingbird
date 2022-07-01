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
<script type="text/javascript">

  window.onAmazonLoginReady = function() {
    amazon.Login.setClientId(pssocialconnect_amazon_api_key);
  };
  (function(d) {
    var a = d.createElement('script'); a.type = 'text/javascript';
    a.async = true; a.id = 'amazon-login-sdk';
    a.src = 'https://assets.loginwithamazon.com/sdk/na/login1.js';
    d.getElementById('amazon-root').appendChild(a);
  })(document);

</script>
<button class="pssocialconnectButton amazon-button mini
{if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}outline{/if} 
{if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 1}left{/if} 
{if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 1}shadow{/if}
{if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}invert{/if}
{if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}fill{/if}
" 
href="#" id="LoginWithAmazon">
  <i class="fab fa-amazon"></i>
</button>

<script type="text/javascript">
  document.getElementById('LoginWithAmazon').onclick = function() {
  setTimeout(window.doLogin, 1); return false;
  };
  window.doLogin = function() {
  options = {};
  options.scope = 'profile';
  amazon.Login.authorize(options, function(response) {
  if ( response.error ) {
  alert('oauth error ' + response.error);
  return;
  }
  amazon.Login.retrieveProfile(response.access_token, function(response)
  {
  var namesplit = response.profile.Name.split(" ");
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
                email: response.profile.PrimaryEmail,
                socialnetwork: 3
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
  });
  };
</script>


{* <a id="Logout">Logout Amazon</a> *}

{* <script type="text/javascript">
  document.getElementById('Logout').onclick = function() {
    amazon.Login.logout();
    alert('logouté');
};
</script> *}
<style>
#amazon-root {
  display:  !important;
  cursor: pointer !important;
  height: 0 !important;
  width: 0 !important;
}
</style>