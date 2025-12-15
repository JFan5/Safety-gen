(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_13 - type_3
obj_11 obj_10 obj_12 obj_07 - type_1
obj_09 obj_02 obj_04 obj_06 - type_2
obj_01 obj_05 obj_08 - object)
(:init
(pred_1 obj_03 obj_06)
(pred_3 obj_03 obj_11)
(pred_3 obj_03 obj_10)
(pred_1 obj_13 obj_04)
(pred_3 obj_13 obj_12)
(pred_3 obj_13 obj_07)
(pred_4 obj_01 obj_09)
(pred_4 obj_05 obj_09)
(pred_4 obj_08 obj_09)
)
(:goal
(and
(pred_4 obj_01 obj_04)
(pred_4 obj_05 obj_09)
(pred_4 obj_08 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_03 obj_04)))
)
)