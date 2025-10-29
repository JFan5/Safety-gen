; params: satgen 440680 2 1 4 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image2 - mode
	spectrograph1 - mode
	infrared3 - mode
	image0 - mode
	Star1 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation0)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument1 infrared3)
	(supports instrument1 image0)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet7)
)
(:goal (and
	(pointing satellite1 Star6)
	(have_image Planet7 infrared3)
	(have_image Phenomenon8 spectrograph1)
	(have_image Phenomenon9 image2)
))

)
