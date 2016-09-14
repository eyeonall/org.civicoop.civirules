<?php

abstract class CRM_Civirules_Delay_Delay {

  /**
   * Returns the DateTime to which an action is delayed to
   *
   * @param DateTime $date
   * @param CRM_Civirules_TriggerData_TriggerData
   * @return DateTime
   */
  abstract public function delayTo(DateTime $date, CRM_Civirules_TriggerData_TriggerData $triggerData);

  /**
   * Add elements to the form
   *
   * @param \CRM_Core_Form $form
   * @param prefix - The prefix for the form field name
   * @return mixed
   */
  abstract public function addElements(CRM_Core_Form &$form, $prefix);

  /**
   * Validate the values and set error message in $errors
   *
   * @param array $values
   * @param array $errors
   * @param prefix - The prefix for the form field name
   * @return void
   */
  abstract public function validate($values, &$errors, $prefix);

  /**
   * Set the values
   *
   * @param array $values
   * @param prefix - The prefix for the form field name
   * @return void
   */
  abstract public function setValues($values, $prefix);

  /**
   * Get the values
   *
   * @param prefix - The prefix for the form field name
   * @return array
   */
  abstract public function getValues($prefix);

  /**
   * Returns an description of the delay
   *
   * @return string
   */
  abstract public function getDescription();

  /**
   * Returns an explanation of the delay
   *
   * @return string
   */
  public function getDelayExplanation() {
    return $this->getDescription();
  }

  /**
   * Set default values
   *
   * @param $values
   * @param prefix - The prefix for the form field name
   */
  public function setDefaultValues(&$values, $prefix) {

  }

  /**
   * Returns the name of the template
   *
   * @return string
   */
  public function getTemplateFilename() {
    return str_replace('_',
        DIRECTORY_SEPARATOR,
        CRM_Utils_System::getClassName($this)
      ) . '.tpl';
  }

  /**
   * Returns the name
   *
   * @return string
   */
  public function getName() {
    return get_class($this);
  }

}