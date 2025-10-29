; params: satgen 769340 2 1 4 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image3 - mode
	spectrograph2 - mode
	thermograph0 - mode
	infrared1 - mode
	Star0 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	Star6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument1 spectrograph2)
	(supports instrument1 thermograph0)
	(supports instrument1 image3)
	(calibration_target instrument1 Star7)
	(calibration_target instrument1 Star6)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite0 Star5)
	(have_image Phenomenon8 infrared1)
	(have_image Star9 spectrograph2)
	(have_image Planet10 image3)
))

)
