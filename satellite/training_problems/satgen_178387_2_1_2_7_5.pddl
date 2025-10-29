; params: satgen 178387 2 1 2 7 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	thermograph0 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Star6 - direction
	Star5 - direction
	Star4 - direction
	Planet7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument1 image1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon11)
)
(:goal (and
	(pointing satellite1 Planet7)
	(have_image Planet7 thermograph0)
	(have_image Planet8 image1)
	(have_image Phenomenon9 image1)
	(have_image Planet10 image1)
	(have_image Phenomenon11 image1)
))

)
