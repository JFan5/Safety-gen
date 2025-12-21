(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_11 - type_1
obj_08 obj_04 obj_03 obj_09 - type_2
obj_13 obj_05 obj_02 obj_14 - type_3
obj_01 obj_12 obj_07 obj_06 - object)
(:init
(pred_1 obj_10 obj_02)
(pred_3 obj_10 obj_08)
(pred_3 obj_10 obj_04)
(pred_1 obj_11 obj_13)
(pred_3 obj_11 obj_03)
(pred_3 obj_11 obj_09)
(pred_2 obj_01 obj_14)
(pred_2 obj_12 obj_14)
(pred_2 obj_07 obj_13)
(pred_2 obj_06 obj_05)
)
(:goal
(and
(pred_2 obj_01 obj_13)
(pred_2 obj_12 obj_05)
(pred_2 obj_07 obj_14)
(pred_2 obj_06 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_10 obj_14)))
)
)