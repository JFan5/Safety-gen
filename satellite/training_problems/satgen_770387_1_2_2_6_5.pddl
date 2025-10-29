; params: satgen 770387 1 2 2 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	spectrograph0 - mode
	Star1 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation5 - direction
	Star0 - direction
	Star2 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Star8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
)
(:goal (and
	(have_image Phenomenon6 spectrograph1)
	(have_image Planet7 spectrograph0)
	(have_image Star8 spectrograph0)
	(have_image Star9 spectrograph0)
	(have_image Star10 spectrograph0)
))

)
