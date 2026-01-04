(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_08 - type_1
obj_11 obj_10 obj_13 obj_02 - type_2
obj_06 obj_12 obj_09 obj_04 - type_3
obj_01 obj_05 obj_07 - object)
(:init
(pred_4 obj_03 obj_09)
(pred_2 obj_03 obj_11)
(pred_2 obj_03 obj_10)
(pred_4 obj_08 obj_09)
(pred_2 obj_08 obj_13)
(pred_2 obj_08 obj_02)
(pred_1 obj_01 obj_06)
(pred_1 obj_05 obj_04)
(pred_1 obj_07 obj_06)
)
(:goal
(and
(pred_1 obj_01 obj_04)
(pred_1 obj_05 obj_06)
(pred_1 obj_07 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_04)))
)
)