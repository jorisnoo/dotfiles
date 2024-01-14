alias gs='git status -s'
alias go='git checkout'
alias gom='git switch main'
alias god='git switch develop'
#alias grh1='git reset HEAD~1 --soft'
#alias grhh1='git reset HEAD~1 --hard'
alias publish='git push origin --all'
alias rnpublish='release && publish'

function release
    git switch develop
    git pull
    git switch main
    git pull
    git merge --no-ff --no-edit develop
    git switch develop
    git merge --no-edit main
end

function nah
    git reset --hard
    git clean -df
    if [ -d ".git/rebase-apply" ] || [ -d ".git/rebase-merge" ]
        git rebase --abort
    end
end
