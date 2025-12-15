(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_05 - type_1
obj_07 obj_09 obj_10 obj_03 - type_3
obj_08 obj_01 obj_06 - type_2
obj_02 obj_11 obj_04 - object)
(:init
(pred_3 obj_12 obj_01)
(pred_4 obj_12 obj_07)
(pred_4 obj_12 obj_09)
(pred_3 obj_05 obj_01)
(pred_4 obj_05 obj_10)
(pred_4 obj_05 obj_03)
(pred_2 obj_02 obj_06)
(pred_2 obj_11 obj_01)
(pred_2 obj_04 obj_08)
)
(:goal
(and
(pred_2 obj_02 obj_01)
(pred_2 obj_11 obj_08)
(pred_2 obj_04 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_06)))
)
)