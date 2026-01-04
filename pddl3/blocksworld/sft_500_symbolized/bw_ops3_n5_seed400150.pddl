(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_05 obj_01 obj_04 obj_03 obj_02 )
(:init
(pred_2)
(pred_4 obj_05)
(pred_4 obj_01)
(pred_4 obj_04)
(pred_3 obj_03 obj_05)
(pred_3 obj_02 obj_04)
(pred_1 obj_01)
(pred_1 obj_03)
(pred_1 obj_02)
)
(:goal
(and
(pred_3 obj_05 obj_02)
(pred_3 obj_01 obj_03)
(pred_3 obj_04 obj_05)
(pred_4 obj_03)
(pred_4 obj_02))
)

(:constraints
  (sometime-before (pred_3 obj_01 obj_03) (pred_3 obj_05 obj_02))
)
)