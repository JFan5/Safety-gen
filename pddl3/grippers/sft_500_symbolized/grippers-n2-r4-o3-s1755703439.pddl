(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_01 - type_3
obj_02 obj_08 obj_12 obj_07 - type_1
obj_09 obj_11 obj_04 obj_05 - type_2
obj_10 obj_03 obj_13 - object)
(:init
(pred_4 obj_06 obj_09)
(pred_3 obj_06 obj_02)
(pred_3 obj_06 obj_08)
(pred_4 obj_01 obj_09)
(pred_3 obj_01 obj_12)
(pred_3 obj_01 obj_07)
(pred_1 obj_10 obj_11)
(pred_1 obj_03 obj_11)
(pred_1 obj_13 obj_04)
)
(:goal
(and
(pred_1 obj_10 obj_05)
(pred_1 obj_03 obj_11)
(pred_1 obj_13 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_04)))
)
)