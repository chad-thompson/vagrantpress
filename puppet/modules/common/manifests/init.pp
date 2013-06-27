class common::install{
  package{"git": ensure=>present,}
  package{"curl": ensure=>present,}
}
