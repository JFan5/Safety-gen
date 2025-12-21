(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_01 - type_1
obj_09 obj_08 obj_02 obj_03 - type_2
obj_10 obj_04 obj_06 - type_3
obj_11 obj_12 obj_05 - object)
(:init
(pred_1 obj_07 obj_10)
(pred_3 obj_07 obj_09)
(pred_3 obj_07 obj_08)
(pred_1 obj_01 obj_10)
(pred_3 obj_01 obj_02)
(pred_3 obj_01 obj_03)
(pred_2 obj_11 obj_04)
(pred_2 obj_12 obj_06)
(pred_2 obj_05 obj_10)
)
(:goal
(and
(pred_2 obj_11 obj_10)
(pred_2 obj_12 obj_04)
(pred_2 obj_05 obj_06)
)
)

(:constraints
  (always (not (pred_1 obj_07 obj_06)))
)
)