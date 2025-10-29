; params: satgen 212162 2 3 2 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	spectrograph0 - mode
	image1 - mode
	Star0 - direction
	GroundStation3 - direction
	Star2 - direction
	Star1 - direction
	GroundStation4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument2 spectrograph0)
	(supports instrument2 image1)
	(calibration_target instrument2 Star2)
	(supports instrument3 spectrograph0)
	(supports instrument3 image1)
	(calibration_target instrument3 Star1)
	(supports instrument4 spectrograph0)
	(calibration_target instrument4 GroundStation4)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(pointing satellite0 Phenomenon5)
	(have_image Phenomenon5 spectrograph0)
	(have_image Star6 spectrograph0)
	(have_image Phenomenon7 spectrograph0)
))

)
