{*
* 2007-2019 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2018 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<button
id="pssocialconnect_paypalbutton" 
class="pssocialconnectButton paypal-button
{if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}outline{/if} 
{if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 1}left{/if}
{if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 3}right{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 1}shadow{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}invert{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}fill{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_FACEBOOK_SWITCH && $socialconnect_params.PSSOCIALCONNECT_GOOGLE_SWITCH 
 || $socialconnect_params.PSSOCIALCONNECT_FACEBOOK_SWITCH && $socialconnect_params.PSSOCIALCONNECT_AMAZON_SWITCH 
 || $socialconnect_params.PSSOCIALCONNECT_GOOGLE_SWITCH && $socialconnect_params.PSSOCIALCONNECT_AMAZON_SWITCH eq 1}mini{/if}
"
{if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}
      onmouseover="document.getElementById('paypal_logo').src='{$baseUrl}modules/pssocialconnect/views/img/paypal_logo_reverted.svg'" onmouseout="document.getElementById('paypal_logo').src='{$baseUrl}modules/pssocialconnect/views/img/paypal_logo.svg'"
    {else if !$socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}
onmouseover="document.getElementById('paypal_logo').src='{$baseUrl}modules/pssocialconnect/views/img/paypal_logo.svg'" onmouseout="document.getElementById('paypal_logo').src='{$baseUrl}modules/pssocialconnect/views/img/paypal_logo_reverted.svg'"
    {else if !$socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}
onmouseover="document.getElementById('paypal_logo').src='{$baseUrl}modules/pssocialconnect/views/img/paypal_logo.svg'" onmouseout="document.getElementById('paypal_logo').src='{$baseUrl}modules/pssocialconnect/views/img/paypal_logo_reverted.svg'"
      
    {/if}>
  {if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}
    <img id="paypal_logo" class="logo_image" src="{$baseUrl}modules/pssocialconnect/views/img/paypal_logo.svg">
    {else}
    <img id="paypal_logo" class="logo_image" src="{$baseUrl}modules/pssocialconnect/views/img/paypal_logo_reverted.svg">      
  {/if}
  <span class="pssocialconnect-label">{l s='Continue with PayPal' mod='pssocialconnect'}</span>
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