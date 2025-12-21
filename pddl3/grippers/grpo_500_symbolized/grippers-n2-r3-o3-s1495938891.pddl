(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_11 - type_1
obj_05 obj_10 obj_07 obj_06 - type_3
obj_03 obj_12 obj_04 - type_2
obj_09 obj_01 obj_02 - object)
(:init
(pred_4 obj_08 obj_03)
(pred_2 obj_08 obj_05)
(pred_2 obj_08 obj_10)
(pred_4 obj_11 obj_03)
(pred_2 obj_11 obj_07)
(pred_2 obj_11 obj_06)
(pred_3 obj_09 obj_04)
(pred_3 obj_01 obj_04)
(pred_3 obj_02 obj_12)
)
(:goal
(and
(pred_3 obj_09 obj_04)
(pred_3 obj_01 obj_12)
(pred_3 obj_02 obj_04)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_04)))
)
)