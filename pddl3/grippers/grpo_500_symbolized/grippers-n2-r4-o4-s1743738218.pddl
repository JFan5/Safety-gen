(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_04 - type_1
obj_07 obj_06 obj_09 obj_10 - type_3
obj_02 obj_13 obj_11 obj_12 - type_2
obj_14 obj_08 obj_01 obj_05 - object)
(:init
(pred_3 obj_03 obj_02)
(pred_4 obj_03 obj_07)
(pred_4 obj_03 obj_06)
(pred_3 obj_04 obj_13)
(pred_4 obj_04 obj_09)
(pred_4 obj_04 obj_10)
(pred_2 obj_14 obj_11)
(pred_2 obj_08 obj_11)
(pred_2 obj_01 obj_11)
(pred_2 obj_05 obj_02)
)
(:goal
(and
(pred_2 obj_14 obj_13)
(pred_2 obj_08 obj_02)
(pred_2 obj_01 obj_12)
(pred_2 obj_05 obj_13)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_11)))
)
)