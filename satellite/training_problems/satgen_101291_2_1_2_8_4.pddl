; params: satgen 101291 2 1 2 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	Star7 - direction
	Star1 - direction
	Star2 - direction
	GroundStation4 - direction
	Star8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 image1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon10)
)
(:goal (and
	(pointing satellite1 GroundStation4)
	(have_image Star8 image1)
	(have_image Planet9 image1)
	(have_image Phenomenon10 image1)
	(have_image Planet11 image1)
))

)
