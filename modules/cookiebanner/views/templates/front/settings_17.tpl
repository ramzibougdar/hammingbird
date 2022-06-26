{* Cookie Banner Prestashop module
 * Copyright 2018, Prestaddons
 * Author: Prestaddons
 * Website: http://www.prestaddons.fr
 *}
{assign var="extended_template" value="page.tpl"}
{if $customer.is_logged}
    {$extended_template ="customer/page.tpl"}
{/if}
{extends file = $extended_template}
{block name='page_title'}
    {l s='Managing your preferences about cookies' mod='cookiebanner'}
{/block}

{block name='page_content'}
    {if isset($confirmation) && $confirmation}
      <article
        class="alert alert-success">{l s='Your cookie settings has been successfully saved.' mod='cookiebanner'}</article>
    {/if}

    {if $summary_settings}
      <div class="rte">{$summary_settings|@print_r|rtrim:'1'|escape:'htmlall':'UTF-8'}</div>
      <hr/>
    {/if}
  <form id="cookies_settings_form" action="" method="post">
    <div class="form_content cleafix">
      <div class="module-blocked-categories card text-dark bg-light mb-3 p-3">
        <div class="form-group all-modules">
          <h2 class="h4">{l s='Settings for all services' mod='cookiebanner'}</h2>
          <div class="module-infos">
          </div>
          <div class="btn-switch">
            <div class="form-check form-switch">
              <input class="form-check-input" type="checkbox" name="all_modules" value="1" id="all_yes"
                     {if !$disabled_modules_list}checked{/if}>
            </div>
          </div>
        </div>
      </div>
        {foreach $module_blocked_categories as $category}
          <div class="module-blocked-categories card text-dark bg-light mb-3 p-3">
            <h2 class="h4">{$category.name|escape:'htmlall':'UTF-8'}</h2>
              {if $category.description != ''}
                <p class="category-description">{$category.description|escape:'htmlall':'UTF-8'}</p>
              {/if}
              {foreach $category.modules as $module}
                <div class="form-group">
                    {if $display_module_images}
                      <div class="image-wrapper hidden-xs-down">
                        <img src="{$smarty.const._MODULE_DIR_|escape:'htmlall':'UTF-8'}/{$module.name|escape:'htmlall':'UTF-8'}/logo.png"
                             alt="{$module.display_name|escape:'htmlall':'UTF-8'}" width="32" height="32"/>
                      </div>
                    {/if}
                  <div class="module-infos">
                    <span class="module-name"><strong>{$module.display_name|escape:'htmlall':'UTF-8'}</strong></span>
                      {if $module.more_link != ''}
                        <span class="module-learn-more">
                                            <a href="{$module.more_link|escape:'htmlall':'UTF-8'}"
                                               title="{l s='Learn more about' mod='cookiebanner'} {$module.display_name|escape:'htmlall':'UTF-8'}"
                                               target="_blank">
                                                <span><i class="material-icons">&#xE315;</i>{l s='Learn more' mod='cookiebanner'}</span>
                                            </a>
                                        </span>
                      {/if}
                  </div>
                  <div class="btn-switch">
                    <div class="form-check form-switch">
                      <input type="hidden" name="module_list[{$module.id_module|intval}]" value="0"
                             id="module_{$module.id_module|intval}_no"
                             {if isset($disabled_modules_list[{$module.id_module|intval}])}checked{/if}>
                      <input class="form-check-input" type="checkbox"
                             name="module_list[{$module.id_module|intval}]" value="1"
                             id="module_{$module.id_module|intval}_yes"
                             {if !isset($disabled_modules_list[{$module.id_module|intval}])}checked{/if}>
                    </div>
                  </div>

                </div>
              {/foreach}
          </div>
        {/foreach}
        {block name='customer_form_footer'}
          <footer class="form-footer clearfix">
            <input type="hidden" name="submitSettings" value="1">
            <button type="submit" id="SubmitSettings" name="submitSettings" data-link-action="submitSettings"
                    class="btn btn-primary form-control-submit float-xs-right">
                {l s='Save' mod='cookiebanner'}
            </button>
          </footer>
        {/block}
    </div>
  </form>
{/block}
