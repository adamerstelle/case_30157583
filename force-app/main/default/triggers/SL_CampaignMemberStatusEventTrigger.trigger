trigger SL_CampaignMemberStatusEventTrigger on CampaignMemberStatusChangeEvent (after insert) {
    System.debug('We are processing ' + Trigger.new.size()+' Change events');

    for(CampaignMemberStatusChangeEvent event : Trigger.new) {
        System.debug('Event details: ');
        System.debug(event);

        EventBus.ChangeEventHeader header = event.ChangeEventHeader;
        System.debug('changeType = ' + header.changetype);
        
        if(header.changetype == 'UPDATE'){
            List<String> changedFields = header.changedfields; // list of fields updated
            System.debug(changedFields);
        }
    }
}