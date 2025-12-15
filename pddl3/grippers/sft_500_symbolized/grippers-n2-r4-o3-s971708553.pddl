(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_07 - type_3
obj_03 obj_12 obj_13 obj_01 - type_2
obj_11 obj_10 obj_06 obj_02 - type_1
obj_04 obj_09 obj_08 - object)
(:init
(pred_4 obj_05 obj_10)
(pred_1 obj_05 obj_03)
(pred_1 obj_05 obj_12)
(pred_4 obj_07 obj_10)
(pred_1 obj_07 obj_13)
(pred_1 obj_07 obj_01)
(pred_2 obj_04 obj_02)
(pred_2 obj_09 obj_11)
(pred_2 obj_08 obj_10)
)
(:goal
(and
(pred_2 obj_04 obj_06)
(pred_2 obj_09 obj_11)
(pred_2 obj_08 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_06)))
)
)