(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_06 - type_3
obj_08 obj_07 obj_11 obj_02 - type_1
obj_14 obj_01 obj_09 obj_10 - type_2
obj_05 obj_12 obj_04 obj_03 - object)
(:init
(pred_3 obj_13 obj_10)
(pred_4 obj_13 obj_08)
(pred_4 obj_13 obj_07)
(pred_3 obj_06 obj_09)
(pred_4 obj_06 obj_11)
(pred_4 obj_06 obj_02)
(pred_2 obj_05 obj_01)
(pred_2 obj_12 obj_10)
(pred_2 obj_04 obj_01)
(pred_2 obj_03 obj_01)
)
(:goal
(and
(pred_2 obj_05 obj_14)
(pred_2 obj_12 obj_10)
(pred_2 obj_04 obj_09)
(pred_2 obj_03 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_09)))
)
)