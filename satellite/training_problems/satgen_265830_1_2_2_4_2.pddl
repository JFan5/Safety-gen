; params: satgen 265830 1 2 2 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	spectrograph0 - mode
	Star0 - direction
	Star1 - direction
	GroundStation3 - direction
	Star2 - direction
	Star4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Star4 image1)
	(have_image Phenomenon5 spectrograph0)
))

)
