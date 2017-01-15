function gentoo_package_mask_recipe_refresh() {
  cd $HOME/projects/gentoo_package_masking/recipes || return $?
  echo -n > default.rb || return $?
  local gentoo_package_mask_RECIPE
  for gentoo_package_mask_RECIPE in `find . -type f -name "*.rb" | grep -v "./default.rb" | sort | sed -e 's/^./gentoo_package_masking/' | sed -e 's/\//::/g' | sed -e 's/.rb$//g'`
  do
    echo "include_recipe '$gentoo_package_mask_RECIPE'" >> default.rb || return $?
  done
  cd -
}
