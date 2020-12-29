explain select * from protein where accesion = "Q9NQS3";
explain select * from proteins where pid= "PABP3_HUMAN";

create index idx1 on proteins(accession);
create index idx2 on proteins(pid);

alter table protein drop index idx1;