(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_13 - type_1
obj_04 obj_09 obj_02 obj_08 - type_3
obj_12 obj_01 obj_06 obj_11 - type_2
obj_07 obj_03 obj_10 - object)
(:init
(pred_3 obj_05 obj_01)
(pred_4 obj_05 obj_04)
(pred_4 obj_05 obj_09)
(pred_3 obj_13 obj_11)
(pred_4 obj_13 obj_02)
(pred_4 obj_13 obj_08)
(pred_2 obj_07 obj_11)
(pred_2 obj_03 obj_06)
(pred_2 obj_10 obj_11)
)
(:goal
(and
(pred_2 obj_07 obj_06)
(pred_2 obj_03 obj_01)
(pred_2 obj_10 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_06)))
)
)