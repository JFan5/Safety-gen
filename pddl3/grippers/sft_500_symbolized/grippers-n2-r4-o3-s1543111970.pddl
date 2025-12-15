(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_10 - type_1
obj_04 obj_06 obj_02 obj_01 - type_2
obj_11 obj_03 obj_07 obj_09 - type_3
obj_05 obj_12 obj_08 - object)
(:init
(pred_3 obj_13 obj_11)
(pred_2 obj_13 obj_04)
(pred_2 obj_13 obj_06)
(pred_3 obj_10 obj_03)
(pred_2 obj_10 obj_02)
(pred_2 obj_10 obj_01)
(pred_1 obj_05 obj_09)
(pred_1 obj_12 obj_11)
(pred_1 obj_08 obj_03)
)
(:goal
(and
(pred_1 obj_05 obj_09)
(pred_1 obj_12 obj_07)
(pred_1 obj_08 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_07)))
)
)