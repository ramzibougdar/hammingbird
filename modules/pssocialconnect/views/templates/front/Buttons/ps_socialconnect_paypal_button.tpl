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
<div id='cwppButton'></div>
{if !$paypalLink eq 1}
<button id="pssocialconnect_paypalbutton" class="btn btn-primary">
{l s='Link' mod='pssocialconnect'}
</button>
{else}
<button onclick="logOutPaypal()" class="btn btn-secondary">
{l s='Log Out' mod='pssocialconnect'}
</button>
{/if}
<script src='https://www.paypalobjects.com/js/external/connect/api.js'></script>
<script>
   var pssocialconnect_paypal_good_url = pssocialconnect_paypal_url.replace(/&amp;/g, '&');
   paypal.use(['login'], function (login) {
     login.render({
       "appid":pssocialconnect_paypal_api_key,
       "scopes":"openid profile email",
       "containerid":"cwppButton",
       "locale":"fr-fr",
       "buttonType":"CWP",
       "returnurl":pssocialconnect_paypal_good_url
     });
   });
   function logOutPaypal() {
     $.ajax({
         type: 'POST',
         url: pssocialconnect_frontController,
         data: {
               ajax: true,
               action: "Unlink",
               idcustomer: pssocialconnect_idCustomerLinking,
               socialnetwork: 4
         },
   
         success: function(data) {
             location.reload();
         },
         error: function(err) {
             console.log(err);
             console.log(pssocialconnect_frontController);
         },
     });
     }
     function sendinPaypal() {
     $.ajax({
         type: 'POST',
         url: pssocialconnect_frontController,
         data: {
               ajax: true,
               action: "LoginPaypal",
               socialnetwork: 4
         },
   
         success: function(data) {
         },
         error: function(err) {
             console.log(err);
             console.log(pssocialconnect_frontController);
         },
     });
     }
</script>
<script>
   $('#pssocialconnect_paypalbutton').click(function() {
         $('.LIwPP_V2')[0].click()
      });
</script>
<style>
   #cwppButton {
   display: none !important;
   height: 0 !important;
   width: 0 !important;
   }
</style>