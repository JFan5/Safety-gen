; params: satgen 172773 2 3 3 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	image0 - mode
	image1 - mode
	thermograph2 - mode
	GroundStation1 - direction
	Star4 - direction
	Star0 - direction
	Star3 - direction
	Star2 - direction
	Planet5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 image1)
	(calibration_target instrument0 Star2)
	(supports instrument1 thermograph2)
	(supports instrument1 image1)
	(calibration_target instrument1 Star0)
	(supports instrument2 image1)
	(calibration_target instrument2 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet5)
	(supports instrument3 image1)
	(supports instrument3 image0)
	(supports instrument3 thermograph2)
	(calibration_target instrument3 Star2)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Planet5 thermograph2)
	(have_image Star6 image0)
	(have_image Phenomenon7 image0)
	(have_image Phenomenon8 thermograph2)
	(have_image Phenomenon9 image1)
	(have_image Star10 thermograph2)
))

)
