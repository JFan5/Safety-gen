(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_01 - type_3
obj_11 obj_10 obj_12 obj_07 - type_2
obj_09 obj_02 obj_04 obj_05 - type_1
obj_14 obj_06 obj_03 obj_08 - object)
(:init
(pred_1 obj_13 obj_05)
(pred_4 obj_13 obj_11)
(pred_4 obj_13 obj_10)
(pred_1 obj_01 obj_04)
(pred_4 obj_01 obj_12)
(pred_4 obj_01 obj_07)
(pred_3 obj_14 obj_04)
(pred_3 obj_06 obj_09)
(pred_3 obj_03 obj_02)
(pred_3 obj_08 obj_04)
)
(:goal
(and
(pred_3 obj_14 obj_05)
(pred_3 obj_06 obj_04)
(pred_3 obj_03 obj_04)
(pred_3 obj_08 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_13 obj_04)))
)
)