(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_10 - type_1
obj_05 obj_04 obj_07 obj_12 - type_2
obj_01 obj_09 obj_06 - type_3
obj_03 obj_11 obj_02 - object)
(:init
(pred_1 obj_08 obj_01)
(pred_3 obj_08 obj_05)
(pred_3 obj_08 obj_04)
(pred_1 obj_10 obj_09)
(pred_3 obj_10 obj_07)
(pred_3 obj_10 obj_12)
(pred_2 obj_03 obj_01)
(pred_2 obj_11 obj_09)
(pred_2 obj_02 obj_01)
)
(:goal
(and
(pred_2 obj_03 obj_06)
(pred_2 obj_11 obj_06)
(pred_2 obj_02 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_06)))
)
)