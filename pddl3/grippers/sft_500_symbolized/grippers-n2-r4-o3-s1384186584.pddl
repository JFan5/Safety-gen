(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_11 - type_1
obj_12 obj_09 obj_08 obj_07 - type_3
obj_01 obj_13 obj_04 obj_10 - type_2
obj_06 obj_02 obj_03 - object)
(:init
(pred_1 obj_05 obj_01)
(pred_4 obj_05 obj_12)
(pred_4 obj_05 obj_09)
(pred_1 obj_11 obj_13)
(pred_4 obj_11 obj_08)
(pred_4 obj_11 obj_07)
(pred_2 obj_06 obj_04)
(pred_2 obj_02 obj_13)
(pred_2 obj_03 obj_04)
)
(:goal
(and
(pred_2 obj_06 obj_13)
(pred_2 obj_02 obj_01)
(pred_2 obj_03 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_04)))
)
)