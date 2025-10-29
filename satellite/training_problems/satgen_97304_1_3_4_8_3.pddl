; params: satgen 97304 1 3 4 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image3 - mode
	image2 - mode
	thermograph0 - mode
	thermograph1 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation7 - direction
	Star4 - direction
	Star8 - direction
	Phenomenon9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 image2)
	(supports instrument0 thermograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Star8 image2)
	(have_image Phenomenon9 image3)
	(have_image Star10 thermograph0)
))

)
