(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_04 - type_1
obj_11 obj_06 obj_13 obj_05 - type_3
obj_03 obj_12 obj_09 obj_07 - type_2
obj_02 obj_08 obj_10 - object)
(:init
(pred_4 obj_01 obj_07)
(pred_1 obj_01 obj_11)
(pred_1 obj_01 obj_06)
(pred_4 obj_04 obj_09)
(pred_1 obj_04 obj_13)
(pred_1 obj_04 obj_05)
(pred_3 obj_02 obj_03)
(pred_3 obj_08 obj_12)
(pred_3 obj_10 obj_12)
)
(:goal
(and
(pred_3 obj_02 obj_09)
(pred_3 obj_08 obj_09)
(pred_3 obj_10 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_09)))
)
)