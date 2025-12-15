(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_02 - type_1
obj_13 obj_06 obj_09 obj_04 - type_3
obj_10 obj_05 obj_12 obj_11 - type_2
obj_07 obj_03 obj_01 obj_08 - object)
(:init
(pred_3 obj_14 obj_10)
(pred_4 obj_14 obj_13)
(pred_4 obj_14 obj_06)
(pred_3 obj_02 obj_05)
(pred_4 obj_02 obj_09)
(pred_4 obj_02 obj_04)
(pred_2 obj_07 obj_12)
(pred_2 obj_03 obj_10)
(pred_2 obj_01 obj_10)
(pred_2 obj_08 obj_10)
)
(:goal
(and
(pred_2 obj_07 obj_12)
(pred_2 obj_03 obj_11)
(pred_2 obj_01 obj_12)
(pred_2 obj_08 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_14 obj_12)))
)
)