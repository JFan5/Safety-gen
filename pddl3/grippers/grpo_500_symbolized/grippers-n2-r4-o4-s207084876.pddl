(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_12 - type_1
obj_05 obj_13 obj_08 obj_10 - type_3
obj_09 obj_14 obj_03 obj_01 - type_2
obj_07 obj_04 obj_02 obj_06 - object)
(:init
(pred_3 obj_11 obj_03)
(pred_4 obj_11 obj_05)
(pred_4 obj_11 obj_13)
(pred_3 obj_12 obj_03)
(pred_4 obj_12 obj_08)
(pred_4 obj_12 obj_10)
(pred_2 obj_07 obj_09)
(pred_2 obj_04 obj_01)
(pred_2 obj_02 obj_09)
(pred_2 obj_06 obj_01)
)
(:goal
(and
(pred_2 obj_07 obj_09)
(pred_2 obj_04 obj_09)
(pred_2 obj_02 obj_09)
(pred_2 obj_06 obj_14)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_01)))
)
)