STIG
stigFromDiskPreview

	| layout |
	layout := DirectoryLayout root: self stigRoot.
	self stigFromDisk: ((layout packageFromDisk: self name) read: layout) preview: true