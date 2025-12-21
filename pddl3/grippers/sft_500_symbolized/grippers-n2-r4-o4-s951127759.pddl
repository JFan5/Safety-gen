(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_02 - type_1
obj_01 obj_11 obj_08 obj_07 - type_2
obj_13 obj_05 obj_06 obj_09 - type_3
obj_04 obj_10 obj_03 obj_12 - object)
(:init
(pred_1 obj_14 obj_09)
(pred_3 obj_14 obj_01)
(pred_3 obj_14 obj_11)
(pred_1 obj_02 obj_09)
(pred_3 obj_02 obj_08)
(pred_3 obj_02 obj_07)
(pred_2 obj_04 obj_06)
(pred_2 obj_10 obj_05)
(pred_2 obj_03 obj_05)
(pred_2 obj_12 obj_05)
)
(:goal
(and
(pred_2 obj_04 obj_05)
(pred_2 obj_10 obj_06)
(pred_2 obj_03 obj_05)
(pred_2 obj_12 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_14 obj_06)))
)
)