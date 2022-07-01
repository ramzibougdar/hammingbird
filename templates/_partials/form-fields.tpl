{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{if $field.type == 'hidden'}

  {block name='form_field_item_hidden'}
    <input type="hidden" name="{$field.name}" value="{$field.value}">
  {/block}
{else}
  <div class="mb-3 {if ($field.type !== 'checkbox' && $field.type !== 'radio-buttons')}form-floating{/if} {if !empty($field.errors)}has-error{/if}">
      {if $field.type == 'radio-buttons'}
          <label class="form-label{if $field.required} required{/if}">
              {if $field.type !== 'checkbox'}
                  {$field.label}
              {/if}
          </label>
      {/if}
    {if $field.type === 'select'}
      {block name='form_field_item_select'}
        <select class="form-select" name="{$field.name}" {if $field.required}required{/if}>
          <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
          {foreach from=$field.availableValues item="label" key="value"}
            <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
          {/foreach}
        </select>
      {/block}

    {elseif $field.type === 'countrySelect'}

      {block name='form_field_item_country'}
        <select
        class="form-select js-country"
        name="{$field.name}"
        {if $field.required}required{/if}
        >
          <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
          {foreach from=$field.availableValues item="label" key="value"}
            <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
          {/foreach}
        </select>
      {/block}

    {elseif $field.type === 'radio-buttons'}

      {block name='form_field_item_radio'}
        <div>
          {foreach from=$field.availableValues item="label" key="value"}
            <div class="form-check form-check-inline">
              <input 
                class="form-check-input"
                type="radio"
                name="{$field.name}"
                id="{$field.name}_{$value}"
                value="{$value}"
                checked
                {if $field.required}required{/if}
                {if $value eq $field.value} checked {/if}
              >
              <label class="form-check-label" for="{$field.name}_{$value}">
                {$label}
              </label>
            </div>
          {/foreach}
        </div>
      {/block}

    {elseif $field.type === 'checkbox'}

      {block name='form_field_item_checkbox'}
        <div class="form-check">
          <input 
            class="form-check-input"
            name="{$field.name}"
            type="checkbox"
            value="1"
            id="{$field.name}"
            value="1" {if $field.value}checked="checked"{/if}
            {if $field.required}required{/if}
          >
          <label class="form-check-label" for="{$field.name}">
            {$field.label nofilter}
          </label>
        </div>
      {/block}

    {elseif $field.type === 'date'}

      {block name='form_field_item_date'}
        <input name="{$field.name}" class="form-control {if !empty($field.errors)}is-invalid{/if}" type="date" value="{$field.value}"{if isset($field.availableValues.placeholder)} placeholder="{$field.availableValues.placeholder}" aria-label="{$field.availableValues.placeholder}"{/if}>
        {if isset($field.availableValues.comment)}
          <span class="form-text">
            {$field.availableValues.comment}
          </span>
        {/if}
      {/block}

    {elseif $field.type === 'birthday'}

      {block name='form_field_item_birthday'}
        <div class="js-parent-focus">
          {html_select_date
          field_order=DMY
          time={$field.value}
          field_array={$field.name}
          prefix=false
          reverse_years=true
          field_separator='<br>'
          day_extra='class="form-select"'
          month_extra='class="form-select"'
          year_extra='class="form-select"'
          day_empty={l s='-- day --' d='Shop.Forms.Labels'}
          month_empty={l s='-- month --' d='Shop.Forms.Labels'}
          year_empty={l s='-- year --' d='Shop.Forms.Labels'}
          start_year={'Y'|date}-100 end_year={'Y'|date}
          }
        </div>
      {/block}

    {elseif $field.type === 'password'}

      {block name='form_field_item_password'}
          <input
                  class="form-control js-child-focus js-visible-password {if !empty($field.errors)}is-invalid{/if}"
                  name="{$field.name}"
                  title="{l s='At least: 8 characters, one uppercase, one lowercase and one number.' d='Shop.Forms.Help'}"
                  type="password"
                  placeholder="{$field.label}"
                  {if $field.autocomplete}autocomplete="{$field.autocomplete}"{/if}
                  value=""
                  pattern="{literal}(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}{/literal}"
                  {if $field.required}required{/if}
          >
      {/block}

    {else}

      {block name='form_field_item_other'}
        <input
          class="form-control {if !empty($field.errors)}is-invalid{/if}"
          name="{$field.name}"
          type="{$field.type}"
          value="{$field.value}"
          {if $field.autocomplete}autocomplete="{$field.autocomplete}"{/if}
          placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{else}{$field.label}{/if}"
          {if $field.maxLength}maxlength="{$field.maxLength}"{/if}
          {if $field.required}required{/if}
          aria-label="{$field.name}"
        >
        {if isset($field.availableValues.comment)}
          <span class="form-text">
            {$field.availableValues.comment}
          </span>
        {/if}
      {/block}

    {/if}

    {if ($field.type !== 'checkbox' && $field.type !== 'radio-buttons')}
      <label class="form-label{if $field.required} required{/if}">
        {if $field.type !== 'checkbox'}
          {$field.label}
        {/if}
      </label>
    {/if}

    {block name='form_field_errors'}
      {include file='_partials/form-errors.tpl' errors=$field.errors}
    {/block}

    <div class="form-text">
      {block name='form_field_comment'}
        {if (!$field.required && !in_array($field.type, ['radio-buttons', 'checkbox']))}
         {l s='Optional' d='Shop.Forms.Labels'}
        {/if}
      {/block}
    </div>
  </div>

{/if}
