-- クリボー

module Actor.Kuribo (
	newKuribo
) where

import Multimedia.SDL hiding (Event)

import Actor (Actor(..))
import Const
import AppUtil
import Images


data Kuribo = Kuribo {
	x :: Int,
	y :: Int,
	vx :: Int,
	vy :: Int,
	cnt :: Int
	}

instance Actor Kuribo where
	update fld self = (self { x = x self + vx self, cnt = cnt self + 1 }, [])

	render self imgres scrx sur = do
		blitSurface (getImageSurface imgres imgtype) Nothing sur (pt ((x self) `div` one - scrx) ((y self) `div` one - 8))
		return ()
		where
			imgtype = [ImgKuri0, ImgKuri1] !! (cnt self `mod` 16 `div` 8)

newKuribo :: Int -> Int -> Kuribo
newKuribo cx cy =
	Kuribo { x = cx * chrSize * one, y = cy * chrSize * one, vx = -one `div` 2, vy = 0, cnt = 0 }
