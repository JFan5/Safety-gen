(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_08 - type_1
obj_06 obj_12 obj_04 obj_13 - type_2
obj_09 obj_11 obj_07 obj_03 - type_3
obj_02 obj_10 obj_01 - object)
(:init
(pred_1 obj_05 obj_03)
(pred_3 obj_05 obj_06)
(pred_3 obj_05 obj_12)
(pred_1 obj_08 obj_09)
(pred_3 obj_08 obj_04)
(pred_3 obj_08 obj_13)
(pred_2 obj_02 obj_09)
(pred_2 obj_10 obj_07)
(pred_2 obj_01 obj_11)
)
(:goal
(and
(pred_2 obj_02 obj_09)
(pred_2 obj_10 obj_09)
(pred_2 obj_01 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_07)))
)
)