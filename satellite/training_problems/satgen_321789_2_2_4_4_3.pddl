; params: satgen 321789 2 2 4 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared0 - mode
	spectrograph1 - mode
	thermograph2 - mode
	image3 - mode
	GroundStation2 - direction
	Star3 - direction
	Star0 - direction
	GroundStation1 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Planet6 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 image3)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(pointing satellite0 Star3)
	(have_image Phenomenon4 image3)
	(have_image Phenomenon5 thermograph2)
	(have_image Planet6 infrared0)
))

)
