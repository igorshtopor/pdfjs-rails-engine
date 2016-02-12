module PdfjsRailsEngine
  class Engine < ::Rails::Engine
    isolate_namespace PdfjsRailsEngine

    initializer 'pdfjs-rails-engine.assets.precompile', group: :all do |app|
      app.config.assets.precompile += %w(
        pdf/viewer.css
        pdf/web/compatibility.js
        pdf/web/l10n.js
        pdf/pdf.js
        pdf/pdf.worker.js
        pdf/web/debugger.js
        pdf/web/viewer.js
      )
    end

    initializer 'pdfjs-rails-engine.load_static_assets' do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/vendor"
    end
  end
end
