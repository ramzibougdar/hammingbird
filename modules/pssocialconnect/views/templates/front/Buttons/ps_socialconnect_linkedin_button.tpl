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
{if !$linkedinLink eq 1}
<button onclick="call_linkedin()" class="btn btn-primary">
{l s='Link' mod='pssocialconnect'}
</button>
{else}        
<button onclick="logOutLinkedIn()" class="btn btn-secondary">
{l s='Log Out' mod='pssocialconnect'}
</button>
{/if}
{literal}
<script type="text/javascript" src="//platform.linkedin.com/in.js">
   api_key: {/literal}{$socialconnect_params.PSSOCIALCONNECT_LINKEDIN_API_KEY|escape:'htmlall':'UTF-8'}{literal}
   authorize: true
</script>
{/literal}
<script type="text/javascript">
   function call_linkedin() {
   
       if(IN.User.authorize())
       {
           getProfileData();
       }
       else
       {
           IN.Event.on(IN, "auth", getProfileData);
       }
   }
   // Handle the successful return from the API call
   function onSuccess(data) {
       $.ajax({
       type: 'POST',
       url: pssocialconnect_frontController,
       data: {
           ajax: true,
           action: "Login",
           lastname: data.lastName,
           firstname: data.firstName,
           email: data.emailAddress,
           socialnetwork: 5,
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
   // Handle an error response from the API call
   function onError(error) {
       console.log(error);
   }
   // Use the API call wrapper to request the member's basic profile data
   function getProfileData() {
       IN.API.Raw("/people/~:(id,first-name,last-name,email-address)").result(onSuccess).error(onError);
   }
   function logOutLinkedIn() {
   $.ajax({
       type: 'POST',
       url: pssocialconnect_frontController,
       data: {
           ajax: true,
           action: "Unlink",
           idcustomer: pssocialconnect_idCustomerLinking,
           socialnetwork: 5
       },
   
       success: function(data) {
           IN.User.logout();
           location.reload();
       },
       error: function(err) {
           console.log(err);
           console.log(pssocialconnect_frontController);
       },
   });
   }
</script>