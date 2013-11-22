class base_app (
  $rubies,
  $deployer        = "deployer",
  $deployers_group = "deployers",
){
  include nodejs

  rbenv::install { $deployer:
    group => $deployers_group,
  }
  
  rbenv::compile { $rubies:
    user => $deployer,
  }
}