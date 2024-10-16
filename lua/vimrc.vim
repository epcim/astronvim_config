"Plug 'will133/vim-dirdiff'
let g:DirDiffEnableMappings = 1
let g:DirDiffExcludes = ".git,system,CVS,*.class,*.exe,.*.swp,pbgo*,pbdoc*,pbswagger*,pbccp*,.matrix,.age,policy-document.yml,policy.yaml,.*,objects,objects-bootstrap,blindfold,customer,pbac,rbac"
let g:DirDiffIgnore = "sb-mec-trial,prod,verizon,fed-prod,ves,volterra,f5fed,f5xc,f5gov,com,io,us,crt,demo1,staging,prod"
" Diff collors, fixture
hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightMagenta
if &diff
  set diffopt+=iwhite
endif


