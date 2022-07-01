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
<button
id="pssocialconnect_paypalbutton" 
class="pssocialconnectButton paypal-button mini
{if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}outline{/if} 
{if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 1}left{/if}
{if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 3}right{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 1}shadow{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}invert{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}fill{/if}
">
<i class="fab fa-paypal"></i>
</button>

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