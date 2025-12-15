(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_05 - type_2
obj_09 obj_06 obj_07 obj_08 - type_3
obj_02 obj_13 obj_10 obj_01 - type_1
obj_03 obj_11 obj_04 - object)
(:init
(pred_2 obj_12 obj_10)
(pred_1 obj_12 obj_09)
(pred_1 obj_12 obj_06)
(pred_2 obj_05 obj_10)
(pred_1 obj_05 obj_07)
(pred_1 obj_05 obj_08)
(pred_3 obj_03 obj_02)
(pred_3 obj_11 obj_01)
(pred_3 obj_04 obj_13)
)
(:goal
(and
(pred_3 obj_03 obj_02)
(pred_3 obj_11 obj_13)
(pred_3 obj_04 obj_01)
)
)

(:constraints
  (always (not (pred_2 obj_12 obj_01)))
)
)