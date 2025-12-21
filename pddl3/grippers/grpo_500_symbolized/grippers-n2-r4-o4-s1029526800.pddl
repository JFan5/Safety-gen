(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_08 - type_1
obj_14 obj_07 obj_04 obj_13 - type_3
obj_05 obj_01 obj_10 obj_09 - type_2
obj_12 obj_03 obj_06 obj_02 - object)
(:init
(pred_4 obj_11 obj_10)
(pred_2 obj_11 obj_14)
(pred_2 obj_11 obj_07)
(pred_4 obj_08 obj_09)
(pred_2 obj_08 obj_04)
(pred_2 obj_08 obj_13)
(pred_3 obj_12 obj_09)
(pred_3 obj_03 obj_10)
(pred_3 obj_06 obj_09)
(pred_3 obj_02 obj_09)
)
(:goal
(and
(pred_3 obj_12 obj_01)
(pred_3 obj_03 obj_10)
(pred_3 obj_06 obj_10)
(pred_3 obj_02 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_09)))
)
)