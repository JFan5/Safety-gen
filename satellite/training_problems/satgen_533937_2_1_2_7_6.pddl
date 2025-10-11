; params: satgen 533937 2 1 2 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	image1 - mode
	Star2 - direction
	GroundStation4 - direction
	GroundStation6 - direction
	Star5 - direction
	GroundStation3 - direction
	Star0 - direction
	Star1 - direction
	Planet7 - direction
	Planet8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Planet11 - direction
	Star12 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation3)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation6)
	(supports instrument1 image1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star1)
	(calibration_target instrument1 Star0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(have_image Planet7 image1)
	(have_image Planet8 spectrograph0)
	(have_image Planet9 image1)
	(have_image Phenomenon10 spectrograph0)
	(have_image Planet11 image1)
	(have_image Star12 spectrograph0)
))

)
