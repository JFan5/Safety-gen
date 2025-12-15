(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_12 - type_1
obj_09 obj_06 obj_01 obj_10 - type_2
obj_08 obj_05 obj_04 obj_13 - type_3
obj_03 obj_11 obj_02 - object)
(:init
(pred_2 obj_07 obj_13)
(pred_4 obj_07 obj_09)
(pred_4 obj_07 obj_06)
(pred_2 obj_12 obj_08)
(pred_4 obj_12 obj_01)
(pred_4 obj_12 obj_10)
(pred_1 obj_03 obj_08)
(pred_1 obj_11 obj_04)
(pred_1 obj_02 obj_05)
)
(:goal
(and
(pred_1 obj_03 obj_08)
(pred_1 obj_11 obj_08)
(pred_1 obj_02 obj_13)
)
)

(:constraints
  (always (not (pred_2 obj_07 obj_04)))
)
)