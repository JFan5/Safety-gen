(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_06 - type_1
obj_13 obj_02 obj_10 obj_01 - type_2
obj_05 obj_08 obj_04 obj_03 - type_3
obj_09 obj_11 obj_07 - object)
(:init
(pred_1 obj_12 obj_05)
(pred_4 obj_12 obj_13)
(pred_4 obj_12 obj_02)
(pred_1 obj_06 obj_08)
(pred_4 obj_06 obj_10)
(pred_4 obj_06 obj_01)
(pred_3 obj_09 obj_04)
(pred_3 obj_11 obj_08)
(pred_3 obj_07 obj_04)
)
(:goal
(and
(pred_3 obj_09 obj_03)
(pred_3 obj_11 obj_05)
(pred_3 obj_07 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_04)))
)
)