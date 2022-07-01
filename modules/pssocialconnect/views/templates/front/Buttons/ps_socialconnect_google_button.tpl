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
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<script>
   var googleUser = {};
   var startApp = function() {
     gapi.load('auth2', function(){
       // Retrieve the singleton for the GoogleAuth library and set up the client.
       auth2 = gapi.auth2.init({
         client_id: pssocialconnect_google_api_key+'.apps.googleusercontent.com',
         cookiepolicy: 'single_host_origin',
         // Request scopes in addition to 'profile' and 'email'
         //scope: 'additional_scope'
       });
       attachSignin(document.getElementById('pssocialconnect_google_button'));
     });
   };
   
   function attachSignin(element) {
     auth2.attachClickHandler(element, {},
         function(googleUser) {
           var profile = googleUser.getBasicProfile();
           $.ajax({
             type: 'POST',
             url: pssocialconnect_frontController,
             data: {
                 ajax: true,
                 action: "Login",
                 lastname: profile.getFamilyName(),
                 firstname: profile.getGivenName(),
                 email: profile.getEmail(),
                 socialnetwork: 2,
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
</script>
<script>startApp();</script>
{if !$googleLink eq 1}
<button id="pssocialconnect_google_button" class="btn btn-primary">
{l s='Link' mod='pssocialconnect'}
</button>
{else}      
<button class="btn btn-secondary" href="#" onclick="signOut();">
{l s='Log Out' mod='pssocialconnect'}
</button>
{/if}
<script>
   function signOut() {
     var auth2 = gapi.auth2.getAuthInstance();
     auth2.signOut().then(function () {
     $.ajax({
           type: 'POST',
           url: pssocialconnect_frontController,
           data: {
               ajax: true,
               action: "Unlink",
               idcustomer: pssocialconnect_idCustomerLinking,
               socialnetwork: 2,
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
</script>