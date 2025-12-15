(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_11 - type_1
obj_09 obj_12 obj_04 obj_13 - type_2
obj_07 obj_05 obj_01 obj_02 - type_3
obj_10 obj_03 obj_08 - object)
(:init
(pred_4 obj_06 obj_02)
(pred_1 obj_06 obj_09)
(pred_1 obj_06 obj_12)
(pred_4 obj_11 obj_05)
(pred_1 obj_11 obj_04)
(pred_1 obj_11 obj_13)
(pred_3 obj_10 obj_05)
(pred_3 obj_03 obj_01)
(pred_3 obj_08 obj_07)
)
(:goal
(and
(pred_3 obj_10 obj_02)
(pred_3 obj_03 obj_07)
(pred_3 obj_08 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_01)))
)
)