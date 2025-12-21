(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_01 obj_04 obj_05 obj_03 obj_02 )
(:init
(pred_1)
(pred_4 obj_01 obj_04)
(pred_4 obj_04 obj_02)
(pred_4 obj_05 obj_03)
(pred_2 obj_03)
(pred_4 obj_02 obj_05)
(pred_3 obj_01)
)
(:goal
(and
(pred_4 obj_01 obj_03)
(pred_4 obj_04 obj_01)
(pred_2 obj_05)
(pred_2 obj_03)
(pred_4 obj_02 obj_05))
)

(:constraints
  (sometime-before (pred_4 obj_04 obj_01) (pred_4 obj_01 obj_03))
)
)