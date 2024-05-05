local ok, flake = pcall(require, "vim-flake8")
if not ok then
  print("flake 8 not found")
  return
end

print("flake found")
