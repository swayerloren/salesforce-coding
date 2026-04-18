public with sharing class ProjectRollupQueueable implements Queueable {
    private final Set<Id> projectIds;

    public ProjectRollupQueueable(Set<Id> projectIds) {
        this.projectIds = projectIds == null ? new Set<Id>() : new Set<Id>(projectIds);
    }

    public void execute(QueueableContext context) {
        if (projectIds.isEmpty()) {
            return;
        }

        // Requery and recompute parent aggregates here.
    }
}
