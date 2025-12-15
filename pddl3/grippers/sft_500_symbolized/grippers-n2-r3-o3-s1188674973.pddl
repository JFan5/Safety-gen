(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_08 - type_1
obj_02 obj_03 obj_11 obj_01 - type_2
obj_09 obj_07 obj_06 - type_3
obj_12 obj_04 obj_05 - object)
(:init
(pred_2 obj_10 obj_07)
(pred_1 obj_10 obj_02)
(pred_1 obj_10 obj_03)
(pred_2 obj_08 obj_06)
(pred_1 obj_08 obj_11)
(pred_1 obj_08 obj_01)
(pred_3 obj_12 obj_09)
(pred_3 obj_04 obj_06)
(pred_3 obj_05 obj_07)
)
(:goal
(and
(pred_3 obj_12 obj_06)
(pred_3 obj_04 obj_06)
(pred_3 obj_05 obj_06)
)
)

(:constraints
  (always (not (pred_2 obj_10 obj_06)))
)
)