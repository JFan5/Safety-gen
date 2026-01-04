(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_02 - type_1
obj_12 obj_05 obj_08 obj_14 - type_2
obj_04 obj_13 obj_09 obj_10 - type_3
obj_03 obj_07 obj_06 obj_01 - object)
(:init
(pred_4 obj_11 obj_04)
(pred_3 obj_11 obj_12)
(pred_3 obj_11 obj_05)
(pred_4 obj_02 obj_10)
(pred_3 obj_02 obj_08)
(pred_3 obj_02 obj_14)
(pred_2 obj_03 obj_10)
(pred_2 obj_07 obj_09)
(pred_2 obj_06 obj_13)
(pred_2 obj_01 obj_13)
)
(:goal
(and
(pred_2 obj_03 obj_13)
(pred_2 obj_07 obj_10)
(pred_2 obj_06 obj_09)
(pred_2 obj_01 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_09)))
)
)