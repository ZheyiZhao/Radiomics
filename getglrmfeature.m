function glrmfeatureVector = getglrmfeature( img2D )

maxGleyLevel=max(max(img2D));
[GLRLMS,SI] = grayrlmatrix(img2D,'NumLevels',maxGleyLevel,'G',[],'Offset',[1; 4]);
glrmfeatureVector=grayrlprops(GLRLMS,1);
end

