; params: satgen 447658 1 1 3 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	spectrograph2 - mode
	spectrograph0 - mode
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	Star4 - direction
	Star5 - direction
	Star0 - direction
	Phenomenon6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(have_image Phenomenon6 spectrograph0)
	(have_image Planet7 spectrograph0)
))

)
