(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_01 - type_1
obj_09 obj_02 obj_06 obj_07 - type_3
obj_05 obj_12 obj_11 obj_04 - type_2
obj_10 obj_13 obj_03 - object)
(:init
(pred_4 obj_08 obj_05)
(pred_1 obj_08 obj_09)
(pred_1 obj_08 obj_02)
(pred_4 obj_01 obj_05)
(pred_1 obj_01 obj_06)
(pred_1 obj_01 obj_07)
(pred_3 obj_10 obj_05)
(pred_3 obj_13 obj_11)
(pred_3 obj_03 obj_05)
)
(:goal
(and
(pred_3 obj_10 obj_11)
(pred_3 obj_13 obj_04)
(pred_3 obj_03 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_11)))
)
)