(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_01 - type_1
obj_12 obj_05 obj_10 obj_09 - type_3
obj_02 obj_06 obj_14 obj_04 - type_2
obj_11 obj_13 obj_07 obj_03 - object)
(:init
(pred_4 obj_08 obj_06)
(pred_2 obj_08 obj_12)
(pred_2 obj_08 obj_05)
(pred_4 obj_01 obj_06)
(pred_2 obj_01 obj_10)
(pred_2 obj_01 obj_09)
(pred_3 obj_11 obj_06)
(pred_3 obj_13 obj_04)
(pred_3 obj_07 obj_14)
(pred_3 obj_03 obj_14)
)
(:goal
(and
(pred_3 obj_11 obj_04)
(pred_3 obj_13 obj_14)
(pred_3 obj_07 obj_04)
(pred_3 obj_03 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_14)))
)
)