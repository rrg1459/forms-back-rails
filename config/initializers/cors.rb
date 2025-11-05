# Be sure to restart your server when you modify this file.

# Handle Cross-Origin Resource Sharing (CORS) so the frontend can make
# cross-origin AJAX requests (including OPTIONS preflight) to this API.
# See: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
	allow do
		# Adjust origins to your frontend host(s). Vite default is http://localhost:5173
		origins 'http://localhost:5173', 'http://127.0.0.1:5173', 'http://localhost:3000'

		resource '*',
			headers: :any,
			methods: [:get, :post, :put, :patch, :delete, :options, :head],
			credentials: true
	end
end
