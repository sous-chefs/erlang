# frozen_string_literal: true

name 'erlang'

run_list 'recipe[test::default]'

cookbook 'erlang', path: '.'
cookbook 'apt', git: 'https://github.com/sous-chefs/apt.git', branch: 'main'
cookbook 'test', path: './test/cookbooks/test'

Dir.children('./test/cookbooks/test/recipes').grep(/\.rb\z/).sort.each do |recipe|
  recipe_name = File.basename(recipe, '.rb')

  named_run_list recipe_name.to_sym, 'recipe[test::' + recipe_name + ']'
end
