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
<button class="pssocialconnectButton amazon-button 
{if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}outline{/if} 
{if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 1}left{/if} 
{if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 1}shadow{/if}
{if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}invert{/if}
{if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}fill{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_FACEBOOK_SWITCH && $socialconnect_params.PSSOCIALCONNECT_GOOGLE_SWITCH eq 1}mini{/if}
" 
href="#" id="LoginWithAmazon"
{if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}
      onmouseover="document.getElementById('amazon_logo').src='{$baseUrl}modules/pssocialconnect/views/img/amazon_logo_reverted.svg'" onmouseout="document.getElementById('amazon_logo').src='{$baseUrl}modules/pssocialconnect/views/img/amazon_logo.svg'"
    {else if !$socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}
onmouseover="document.getElementById('amazon_logo').src='{$baseUrl}modules/pssocialconnect/views/img/amazon_logo.svg'" onmouseout="document.getElementById('amazon_logo').src='{$baseUrl}modules/pssocialconnect/views/img/amazon_logo_reverted.svg'"
    {else if !$socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}
onmouseover="document.getElementById('amazon_logo').src='{$baseUrl}modules/pssocialconnect/views/img/amazon_logo.svg'" onmouseout="document.getElementById('amazon_logo').src='{$baseUrl}modules/pssocialconnect/views/img/amazon_logo_reverted.svg'"
      
    {/if}>
  {if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}
    <img id="amazon_logo" class="logo_image" src="{$baseUrl}modules/pssocialconnect/views/img/amazon_logo.svg">
    {else}
    <img id="amazon_logo" class="logo_image" src="{$baseUrl}modules/pssocialconnect/views/img/amazon_logo_reverted.svg">      
  {/if}
  <span class="pssocialconnect-label">{l s='Continue with Amazon' mod='pssocialconnect'}</span>
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