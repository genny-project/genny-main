SET FOREIGN_KEY_CHECKS=0;
delete from baseentity_attribute where baseentityCode like 'RUL_%';
delete from baseentity where code like 'RUL_%';

SET FOREIGN_KEY_CHECKS=1;
