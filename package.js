Package.describe({
  name: 'smeevil:reactive-block-grid',
  summary: 'Given a cursor and a template this will create a reactive responsive block grid based on isotope',
  version: '1.0.1',
  git: 'https://github.com/smeevil/responsive-block-grid.git'
});

Package.onUse(function(api) {
  api.versionsFrom("METEOR@0.9.0");
  api.use(
      [
        'templating',
        'underscore@1.0.0',
        'coffeescript@1.0.0',
        'mquandalle:jade@0.4.1',
        'isotope:isotope@2.1.0_1',
        'mrt:jquery-imagesloaded@0.0.2'
      ]
  );
  api.add_files([
      'reactive_block_grid.jade',
      'reactive_block_grid.coffee',
      'reactive_block_grid.sass'
    ], 'client'
  );
});
