(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_05 obj_02 obj_04 obj_03 obj_01 )
(:init
(pred_2)
(pred_1 obj_05)
(pred_1 obj_02)
(pred_1 obj_04)
(pred_4 obj_03 obj_02)
(pred_4 obj_01 obj_05)
(pred_3 obj_04)
(pred_3 obj_03)
(pred_3 obj_01)
)
(:goal
(and
(pred_4 obj_05 obj_03)
(pred_4 obj_04 obj_01)
(pred_4 obj_03 obj_04)
(pred_4 obj_01 obj_02))
)

(:constraints
  (sometime-before (pred_4 obj_04 obj_01) (pred_4 obj_05 obj_03))
)
)