# Function to backup Obsidian vault to ProtonDrive
fvault_backup() {
  # Create a timestamp in YYYY-MM-DD_HH-MM-SS format
  local timestamp
  timestamp=$(date +'%Y-%m-%d_%H-%M-%S')
  
  # Define the zip file's name using the timestamp
  local zipfile="FoxVault_${timestamp}.zip"
  local temp_zip="/tmp/${zipfile}"
  
  # Verify Obsidian directory exists
  if [[ ! -d "${HOME}/Documents/Obsidian" ]]; then
    echo "Error: Obsidian directory not found at ${HOME}/Documents/Obsidian"
    return 1
  fi
  
  # Verify rclone is installed
  if ! command -v rclone &> /dev/null; then
    echo "Error: rclone is not installed. Please install it first with 'sudo dnf install rclone'"
    return 1
  fi
  
  # Verify rclone ProtonDrive remote exists
  if ! rclone listremotes | grep -q "^ProtonDrive:$"; then
    echo "Error: ProtonDrive remote not configured in rclone. Please run 'rclone config' to set it up"
    return 1
  fi
  
  # Change directory to the Obsidian folder and create a zip archive of its contents
  echo "Creating backup archive..."
  (cd "${HOME}/Documents/Obsidian" && zip -r "${temp_zip}" .) || { 
    echo "Error: Zip creation failed"; 
    return 1; 
  }
  
  # Check if the zip file was created successfully
  if [[ ! -f "${temp_zip}" ]]; then
    echo "Error: Zip file was not created at ${temp_zip}"
    return 1
  fi
  
  # Create destination directory if it doesn't exist
  echo "Ensuring destination directory exists..."
  rclone mkdir ProtonDrive:Archives/Obsidian 2>/dev/null
  
  # Use rclone to copy the zip archive to your Proton Drive remote folder
  echo "Uploading backup to ProtonDrive..."
  rclone copy --progress "${temp_zip}" ProtonDrive:Archives/Obsidian/ || { 
    echo "Error: rclone copy failed"; 
    echo "Archive remains at ${temp_zip} for manual handling"; 
    return 1; 
  }
  
  # Remove the temporary zip file
  echo "Cleaning up temporary files..."
  rm "${temp_zip}" && echo "Temporary files removed."
  
  echo "✅ Backup ${zipfile} successfully uploaded to ProtonDrive:Archives/Obsidian."
  
  # Optional: list the remote directory to confirm the upload
  echo "Current backups in destination:"
  rclone ls ProtonDrive:Archives/Obsidian/ | sort
}
