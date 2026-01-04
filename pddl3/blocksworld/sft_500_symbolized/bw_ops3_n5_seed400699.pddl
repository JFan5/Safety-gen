(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_03 obj_05 obj_02 obj_01 obj_04 )
(:init
(pred_4)
(pred_3 obj_03 obj_05)
(pred_3 obj_05 obj_04)
(pred_3 obj_02 obj_01)
(pred_2 obj_01)
(pred_3 obj_04 obj_02)
(pred_1 obj_03)
)
(:goal
(and
(pred_3 obj_03 obj_01)
(pred_3 obj_05 obj_03)
(pred_2 obj_02)
(pred_2 obj_01)
(pred_3 obj_04 obj_02))
)

(:constraints
  (sometime-before (pred_3 obj_05 obj_03) (pred_3 obj_03 obj_01))
)
)