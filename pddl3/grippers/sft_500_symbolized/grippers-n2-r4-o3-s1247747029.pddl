(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_02 - type_2
obj_09 obj_13 obj_12 obj_08 - type_3
obj_03 obj_05 obj_04 obj_01 - type_1
obj_11 obj_07 obj_10 - object)
(:init
(pred_2 obj_06 obj_05)
(pred_1 obj_06 obj_09)
(pred_1 obj_06 obj_13)
(pred_2 obj_02 obj_04)
(pred_1 obj_02 obj_12)
(pred_1 obj_02 obj_08)
(pred_4 obj_11 obj_04)
(pred_4 obj_07 obj_01)
(pred_4 obj_10 obj_01)
)
(:goal
(and
(pred_4 obj_11 obj_05)
(pred_4 obj_07 obj_04)
(pred_4 obj_10 obj_01)
)
)

(:constraints
  (always (not (pred_2 obj_06 obj_04)))
)
)