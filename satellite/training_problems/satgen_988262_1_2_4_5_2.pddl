; params: satgen 988262 1 2 4 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph3 - mode
	spectrograph1 - mode
	spectrograph0 - mode
	image2 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	Star4 - direction
	GroundStation2 - direction
	Phenomenon5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph3)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
)
(:goal (and
	(have_image Phenomenon5 image2)
	(have_image Star6 spectrograph3)
))

)
