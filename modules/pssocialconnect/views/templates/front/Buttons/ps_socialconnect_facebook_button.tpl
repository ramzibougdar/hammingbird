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
                 socialnetwork: 1,
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
{if !$facebookLink eq 1}  
<button class="btn btn-primary" href="#" onclick="login()">
{l s='Link' mod='pssocialconnect'}
</button>
{else}
<button class="btn btn-secondary" href="#" onclick="fbLogoutUser()">
{l s='Log Out' mod='pssocialconnect'}
</button>
<script>
   function fbLogoutUser() {
     FB.getLoginStatus(function(response) {
         if (response && response.status === 'connected') {
             FB.logout(function(response) {
               $.ajax({
                   type: 'POST',
                   url: pssocialconnect_frontController,
                   data: {
                       ajax: true,
                       action: "Unlink",
                       idcustomer: pssocialconnect_idCustomerLinking,
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
     });
   }
</script>
{/if}