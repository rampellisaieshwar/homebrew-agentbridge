class Agentbridge < Formula
  include Language::Python::Virtualenv

  desc "Reach Claude Code, Codex and agy sessions on your Mac from Telegram"
  homepage "https://github.com/rampellisaieshwar/agentbridge"
  url "file:///Users/saieshwarrampelli/Downloads/Cap/agentbridge-0.1.0.tar.gz"
  sha256 "e497e33bb4f882c66f2ab74388bba6d62a18414268db5101f1732f78bcc94ff3"
  version "0.1.0"

  depends_on "python@3.14"
  depends_on "tmux"
  depends_on :macos

  # Python resources: fastapi>=0.110, uvicorn>=0.29, httpx>=0.27 (populate with update-python-resources).

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Run `agentbridge setup` to get started. `agb` is the short name.

      For optional voice notes, run `agb voice-setup`. This installs
      whisper-cpp and ffmpeg and requires about 500 MB.

      Before uninstalling, run `agb service uninstall`, then run
      `brew uninstall agentbridge`.
    EOS
  end

  test do
    assert_match "setup", shell_output("#{bin}/agentbridge --help")
    system bin/"agb", "--help"
  end
end
