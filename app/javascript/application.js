// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.addEventListener('DOMContentLoaded', function() {
    const deleteLinks = document.querySelectorAll('[data-confirm]');
  
    deleteLinks.forEach(link => {
      link.addEventListener('click', function(e) {
        const confirmMessage = this.getAttribute('data-confirm');
        if (!confirm(confirmMessage)) {
          e.preventDefault();
        }
      });
    });
  });
  