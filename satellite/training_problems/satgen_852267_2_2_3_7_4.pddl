; params: satgen 852267 2 2 3 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	spectrograph0 - mode
	image1 - mode
	thermograph2 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Star5 - direction
	Star4 - direction
	GroundStation6 - direction
	Star3 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 thermograph2)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation6)
	(calibration_target instrument0 Star4)
	(supports instrument1 image1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument2 spectrograph0)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 Star3)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Planet7 spectrograph0)
	(have_image Phenomenon8 image1)
	(have_image Star9 thermograph2)
	(have_image Planet10 thermograph2)
))

)
