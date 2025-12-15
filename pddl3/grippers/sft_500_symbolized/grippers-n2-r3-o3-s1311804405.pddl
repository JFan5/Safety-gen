(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_02 - type_3
obj_06 obj_05 obj_09 obj_11 - type_2
obj_08 obj_07 obj_04 - type_1
obj_10 obj_01 obj_03 - object)
(:init
(pred_1 obj_12 obj_08)
(pred_4 obj_12 obj_06)
(pred_4 obj_12 obj_05)
(pred_1 obj_02 obj_07)
(pred_4 obj_02 obj_09)
(pred_4 obj_02 obj_11)
(pred_2 obj_10 obj_08)
(pred_2 obj_01 obj_08)
(pred_2 obj_03 obj_04)
)
(:goal
(and
(pred_2 obj_10 obj_08)
(pred_2 obj_01 obj_04)
(pred_2 obj_03 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_04)))
)
)