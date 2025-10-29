; params: satgen 856812 2 2 2 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph1 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	GroundStation1 - direction
	Star3 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 Star3)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite0 Planet7)
	(have_image Phenomenon5 spectrograph1)
	(have_image Planet6 spectrograph0)
	(have_image Planet7 spectrograph0)
))

)
