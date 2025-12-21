(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_10 - type_1
obj_13 obj_12 obj_01 obj_06 - type_2
obj_02 obj_07 obj_08 obj_11 - type_3
obj_03 obj_04 obj_09 - object)
(:init
(pred_1 obj_05 obj_02)
(pred_3 obj_05 obj_13)
(pred_3 obj_05 obj_12)
(pred_1 obj_10 obj_02)
(pred_3 obj_10 obj_01)
(pred_3 obj_10 obj_06)
(pred_2 obj_03 obj_02)
(pred_2 obj_04 obj_08)
(pred_2 obj_09 obj_08)
)
(:goal
(and
(pred_2 obj_03 obj_02)
(pred_2 obj_04 obj_08)
(pred_2 obj_09 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_08)))
)
)