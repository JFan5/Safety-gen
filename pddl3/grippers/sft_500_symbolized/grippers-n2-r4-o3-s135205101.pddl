(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_02 - type_2
obj_08 obj_10 obj_12 obj_09 - type_3
obj_07 obj_05 obj_04 obj_06 - type_1
obj_01 obj_13 obj_03 - object)
(:init
(pred_3 obj_11 obj_07)
(pred_2 obj_11 obj_08)
(pred_2 obj_11 obj_10)
(pred_3 obj_02 obj_07)
(pred_2 obj_02 obj_12)
(pred_2 obj_02 obj_09)
(pred_4 obj_01 obj_07)
(pred_4 obj_13 obj_04)
(pred_4 obj_03 obj_04)
)
(:goal
(and
(pred_4 obj_01 obj_07)
(pred_4 obj_13 obj_04)
(pred_4 obj_03 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_04)))
)
)