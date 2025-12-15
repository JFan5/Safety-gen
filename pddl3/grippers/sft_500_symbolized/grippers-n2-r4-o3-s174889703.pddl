(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_13 - type_3
obj_10 obj_07 obj_03 obj_02 - type_1
obj_08 obj_09 obj_04 obj_06 - type_2
obj_11 obj_01 obj_05 - object)
(:init
(pred_3 obj_12 obj_09)
(pred_4 obj_12 obj_10)
(pred_4 obj_12 obj_07)
(pred_3 obj_13 obj_09)
(pred_4 obj_13 obj_03)
(pred_4 obj_13 obj_02)
(pred_1 obj_11 obj_04)
(pred_1 obj_01 obj_09)
(pred_1 obj_05 obj_06)
)
(:goal
(and
(pred_1 obj_11 obj_09)
(pred_1 obj_01 obj_04)
(pred_1 obj_05 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_04)))
)
)